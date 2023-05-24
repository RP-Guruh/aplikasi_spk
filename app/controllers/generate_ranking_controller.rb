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


end
