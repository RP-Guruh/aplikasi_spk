class GenerateRankingController < ApplicationController
    include ApplicationHelper
  
    def index
        @karyawan = Employee.all
    end

    def generate_rank
        @list_kriteria = CriteriaValue.all
        @id_karyawan = params[:id]
    end

    def rank_all_data
        @datasrc = DataSource.all
    end

    def create
      if DataSource.any?
        masterDataSource = DataSource.where(status: 'completed')
        masterDataSource.each do |data|
          new_data = LogDataSource.new
          new_data.id_employee = data.id_employee
          new_data.id_kriteria = data.id_kriteria
          new_data.nilai = data.nilai
          new_data.status = data.status
          new_data.save
        end
        masterDataSource.delete_all
      end
        jum_data = params[:id_emp].count
        jum_data.times do |index|
            datasrc = DataSource.new
            datasrc.id_employee = params[:id_emp][index]
            datasrc.id_kriteria = params[:id_kriteria][index]
            datasrc.nilai = params[:bobot_nilai][index]
            datasrc.save
        end
        flash[:success] = "Data successfully added"
        @save_time = Time.now
        redirect_to '/ranking'
    end

    def normalisasi
        data = DataSource.all
        
        # ========================= Perhitungan Normalisasi ==========================

        normalized_scores = Hash.new { |h, k| h[k] = [] }

       
        data.each do |row|
        kriteria = row.id_kriteria
        bobot_nilai = {
            id_employee: row.id_employee,
            nilai: row.nilai.to_f
          }
          normalized_scores[kriteria] << bobot_nilai
        end
      
        
        normalized_scores.each do |kriteria, bobot_nilai|
            nilais = bobot_nilai.map { |bobot| bobot[:nilai] }
            normalized_nilais = normalize_min_max(nilais)
            bobot_nilai.each_with_index do |bobot, index|
              bobot[:nilai] = normalized_nilais[index]
            end
            normalized_scores[kriteria] = bobot_nilai
        end
        
        if Normalisasi.any?
          masterDataNormalisasi = Normalisasi.all
          masterDataNormalisasi.each do |data|
            new_data = LogNormalisasi.new
            new_data.id_employee = data.id_employee
            new_data.id_kriteria = data.id_kriteria
            new_data.nilai_normalisasi = data.nilai_normalisasi
            new_data.status = data.status
            new_data.save
          end
          masterDataNormalisasi.delete_all
        end
        normalized_scores.each do |kriteria, bobot_nilai|
            bobot_nilai.each do |bobot|
              id_kriteria = kriteria
              id_karyawan = bobot[:id_employee]
              nilai = bobot[:nilai]

              normalisasi_nilai = Normalisasi.new(status: "request", id_kriteria: id_kriteria, id_employee: id_karyawan, nilai_normalisasi: nilai)
              normalisasi_nilai.save
            end
        end

        # ================================ END NORMALISASI =================================
          
        scores = Hash.new(0)
       
        normalized_scores.each do |kriteria, bobot_nilai|
        bobot = bobot_kriteria[kriteria] # Ganti dengan bobot kriteria yang telah ditentukan
      
        bobot_nilai.each_with_index do |data, index|
            nilai = Normalisasi.where(id_employee: data[:id_employee], id_kriteria: kriteria, status: "request").first
            scores[index] += nilai.nilai_normalisasi.to_f * bobot
        end
        end

        # ============================= Perhitunga bobot nilai dari normalisasi ===============
        if HitungNormalisasiBobot.any?
          masterDataNormalisasiBobot = HitungNormalisasiBobot.all
          masterDataNormalisasiBobot.each do |data|
            new_data = LogNormalisasiBobot.new
            new_data.id_employee = data.id_employee
            new_data.id_kriteria = data.id_kriteria
            new_data.nilai_bobot = data.nilai_bobot
            new_data.status = data.status
            new_data.save
          end
          masterDataNormalisasiBobot.delete_all
        end

        hasil_normalisasi = Normalisasi.all
        bobot = bobot_kriteria
        weighted_scores = {}
        hasil_normalisasi.each do |row|
          id_employee = row['id_employee']
          id_kriteria = row['id_kriteria']
          nilai = row['nilai_normalisasi']
      
          bobot_nilai = bobot[id_kriteria]
          weighted_scores[id_employee] ||= 0
          weighted_scores[id_employee] += nilai * bobot_nilai
          hitungNormalisasi = HitungNormalisasiBobot.new(id_kriteria: id_kriteria, id_employee: id_employee, nilai_bobot: weighted_scores[id_employee])
          hitungNormalisasi.save
        end

        # ============================ END PERHITUNGAN BOBOT NORMALISASI ===================

        # ============================ Menjumlahkan nilai bobot dan menemukan urutan ranking nya 
        if HasilAkhir.any?
            masterDataAkhir = HasilAkhir.all
            masterDataAkhir.each do |data|
              new_data = LogHasil.new
              new_data.id_employee = data.id_employee
              new_data.nilai_akhir = data.nilai_akhir
              new_data.status = data.status
              new_data.save
            end
            masterDataAkhir.delete_all
         end

        hasil = HitungNormalisasiBobot.group(:id_employee).sum(:nilai_bobot)

        sorted_results = hasil.sort_by { |_id_employee, total_nilai| -total_nilai }

        # Menampilkan hasil penjumlahan nilai dengan keterangan ranking
        sorted_results.each_with_index do |(id_employee, total_nilai), index|
          ranking = index + 1
          rounded_nilai = total_nilai.round(2)
          hasil_akhir = HasilAkhir.new(id_employee: id_employee, nilai_akhir: rounded_nilai)
          hasil_akhir.save
          HitungNormalisasiBobot.update_all(status: "completed")
          Normalisasi.update_all(status: "completed")
          DataSource.update_all(status: "completed")
        end

        redirect_to '/ranking/data/akhir'


        # ============================ END ========================================================
    end

    def normalisasiData
      @data = Normalisasi.order(:id_employee)
    
    end

    def normalisasiBobot
      @data = HitungNormalisasiBobot.order(:id_employee)
    end

    def hasilAkhir
      @data = HasilAkhir.all
    end

    private

    # Fungsi untuk melakukan normalisasi Min-Max pada bobot_nilai
    def normalize_min_max(data)
      min_val = data.min
      max_val = data.max
    
      normalized_data = data.map do |value|
        (value - min_val).to_f / (max_val - min_val)
      end
      normalized_data
    end
  
    # Metode untuk mendefinisikan bobot kriteria
    def bobot_kriteria

      bobot_nilai = CriteriaValue.all
      hasil_looping = {}

      bobot_nilai.each do |nilai|
        id_kriteria = nilai.id
        bobot = nilai.bobot_nilai
        hasil_looping[id_kriteria] = bobot
      end
      hasil_looping
    end

end
