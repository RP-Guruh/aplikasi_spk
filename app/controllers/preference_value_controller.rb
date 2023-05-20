class PreferenceValueController < ApplicationController
    def index
        @preference = PreferenceValue.order(:id)    
    end

    def create
       
        value = PreferenceValue.new
        value.kriteria = params[:kriteria]
        value.keterangan = params[:keterangan]
        value.bobot_nilai = params[:bobot_nilai]

        if value.save
            flash[:success] = "Value saved successfully."
            @save_time = Time.now
            redirect_to preference_path(value)
        else
            flash[:danger] = "Failed to save criteria."
            @save_time = Time.now
            redirect_to preference_path(value)
        end
        
    end

    def destroy
        value = PreferenceValue.find(params[:deleteID])
        if value.destroy
          flash[:success] = "Value deleted successfully."
          @save_time = Time.now
          redirect_to preference_path(value)
        else
          flash[:danger] = "Failed to delete value."
          @save_time = Time.now
          redirect_to preference_path(value)
        end
    end

    def edit
        @value = PreferenceValue.find(params[:id])
    end

    def update
        value = PreferenceValue.find(params[:id])
       
        update_attributes = {
            kriteria: params[:kriteria],
            keterangan: params[:keterangan],
            bobot_nilai: params[:bobot_nilai]
        }
        
        if value.update(update_attributes)
          flash[:success] = "Value updated successfully."
          @save_time = Time.now
          redirect_to preference_path(value)
        else
          flash[:danger] = "Failed to update value."
          @save_time = Time.now
          redirect_to preference_path(value)
        end
    end
end
