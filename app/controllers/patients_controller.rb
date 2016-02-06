class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
   
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

      if @patient.save

        if params[:images]
          params[:images].each do |image|
            @patient.photos.create(image: image)
          end
        end

        redirect_to edit_patient_path(@patient)
        
      else

      end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      
      if params[:images]
        params[:images].each do |image|
          @patient.photos.create(image: image)
        end
      end
      
      redirect_to patient_path
    end
    
    # respond_to do |format|
    #   if @patient.update(patient_params)
    #     format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @patient }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @patient.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :nickname, :language, :birthplace,
        :home_base, :spouse_name, :children, :grandchildren, :occupation, :pets, :favourite_sports,
        :favourite_radio, :favourite_childhood_games, :favourite_movie_tv, :favourite_actors,
        :favourite_animals, :additional_info, :favourite_music, :favourite_activities)
    end
end
