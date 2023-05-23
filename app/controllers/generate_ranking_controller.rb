class GenerateRankingController < ApplicationController
    def index
        @karyawan = Employee.all
    end

    def generate_rank
        
        @list_kriteria = CriteriaValue.all
        @id_karyawan = params[:id]
    end

    def create
        puts "Request Parameters: #{params.to_json}"
    end


end
