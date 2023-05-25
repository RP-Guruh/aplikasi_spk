class GenerateRankingController < ApplicationController
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
        
        # Inisialisasi variabel untuk menyimpan hasil normalisasi bobot_nilai
        normalized_scores = Hash.new { |h, k| h[k] = [] }

        # Lakukan normalisasi bobot_nilai untuk setiap kriteria
        data.each do |row|
        kriteria = row.id_kriteria
        bobot_nilai = {
            id_employee: row.id_employee,
            nilai: row.nilai.to_f
          }
          normalized_scores[kriteria] << bobot_nilai
        end
      
        # Lakukan normalisasi Min-Max pada setiap kriteria
        normalized_scores.each do |kriteria, bobot_nilai|
            nilais = bobot_nilai.map { |bobot| bobot[:nilai] }
            normalized_nilais = normalize_min_max(nilais)
            bobot_nilai.each_with_index do |bobot, index|
              bobot[:nilai] = normalized_nilais[index]
            end
            normalized_scores[kriteria] = bobot_nilai
        end
        # Simpan data normalisasi
        # normalized_scores.each do |kriteria, bobot_nilai|
        #     bobot_nilai.each do |bobot|
        #       id_kriteria = kriteria
        #       id_karyawan = bobot[:id_employee]
        #       nilai = bobot[:nilai]
        #       normalisasi_nilai = Normalisasi.new(id_kriteria: id_kriteria, id_employee: id_karyawan, nilai_normalisasi: nilai)
        #       normalisasi_nilai.save
        #     end
        # end
          
        scores = Hash.new(0)
        
        normalized_scores.each do |kriteria, bobot_nilai|
        bobot = bobot_kriteria[kriteria] # Ganti dengan bobot kriteria yang telah ditentukan
        bobot_nilai.each_with_index do |data, index|
            puts index
            nilai = Normalisasi.find(data[:index]).nilai_normalisasi.to_f
            scores[index] += nilai * bobot
        end
        end

    
        puts scores

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
      {
        9 => 20,
        10 => 13,
        11 => 12,
        12 => 11,
        13 => 14,
        14 => 15,
        15 => 15
      }
    end

end
