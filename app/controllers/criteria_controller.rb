class CriteriaController < ApplicationController
    def index
        @kriteria = CriteriaValue.order(:id)    
        
    end

    def create
        latest_criteria = CriteriaValue.maximum(:kriteria)
        number = latest_criteria ? latest_criteria[1..].to_i + 1 : 1
        kriteria_baru = "C#{number}"

        kriteria_model = CriteriaValue.new
        kriteria_model.kriteria = kriteria_baru
        kriteria_model.keterangan = params[:keterangan]
        kriteria_model.bobot_nilai = params[:bobot_nilai]

        if kriteria_model.save
            flash[:success] = "Criteria saved successfully."
            @save_time = Time.now
            redirect_to criteria_path(kriteria_model)
        else
            flash[:danger] = "Failed to save criteria."
            @save_time = Time.now
            redirect_to criteria_path(kriteria_model)
        end
        
    end

    def destroy
        kriteria_model = CriteriaValue.find(params[:deleteID])
        if kriteria_model.destroy
          flash[:success] = "Criteria deleted successfully."
          @save_time = Time.now
          redirect_to criteria_path(kriteria_model)
        else
          flash[:danger] = "Failed to delete criteria."
          @save_time = Time.now
          redirect_to criteria_path(kriteria_model)
        end
    end

    def edit
        @criteria = CriteriaValue.find(params[:id])
    end

    def update
        kriteria_model = CriteriaValue.find(params[:id])
       
        update_attributes = {
            keterangan: params[:keterangan],
            bobot_nilai: params[:bobot_nilai]
        }
        
        if kriteria_model.update(update_attributes)
          flash[:success] = "Criteria updated successfully."
          @save_time = Time.now
          redirect_to criteria_path(kriteria_model)
        else
          flash[:danger] = "Failed to update Criteria."
          @save_time = Time.now
          redirect_to criteria_path(kriteria_model)
        end
    end
end
