class GenerateRankingController < ApplicationController
    def index
        @karyawan = Employee.all
    end

    def generate_rank
        @criteria = CriteriaValue.find(params[:id])
        @list_kriteria = CriteriaValue.all
        @id_karyawan = params[:id]
    end

    def create
        puts "Request Parameters: #{params.id_emp}"
    end


end
