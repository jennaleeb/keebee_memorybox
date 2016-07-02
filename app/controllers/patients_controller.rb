class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :js, :html


  # GET /patients
  # GET /patients.json
  def index
    
    # List patients who were added or their profiles changed 1 week ago
    @recently_added_patients = Patient.where("created_at >= ?", 1.week.ago.utc).order('created_at DESC')
    @recently_updated_patients = Patient.where("updated_at >= ?", 1.week.ago.utc).order('updated_at DESC')

    if params[:advanced_search]
      @patients_advanced_filter = Patient.tag_search(params[:advanced_search])
    end

    if current_user.admin_user?

      if params[:search]
          @patients = Patient.search(params[:search]).order("created_at DESC")
        else
          @patients = Patient.order('created_at DESC')
      end

    else

      if params[:search]
          @patients = Patient.where(user_id: current_user.id).search(params[:search]).order("created_at DESC")
        else
          @patients = Patient.where(user_id: current_user.id).order('created_at DESC')
      end

    end

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
    # fix for multiple songs
    @song = @patient.songs.last
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id
    @patient.save
    @song = @patient.songs.create
    redirect_to edit_patient_path(@patient)


  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      if params[:images]
        params[:images].each do |image|
          @photo = @patient.photos.create(image: image)
        end
        
      end

      if params[:clips]
        params[:clips].each do |clip|
          @video = @patient.videos.create(clip: clip)
        end
      end
      redirect_to :back
    end
      
    
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

    def photo_params
      params.require(:patient).permit(:image)
    end

    def video_params
      params.require(:patient).permit(:clip)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :nickname, :language, :birthplace,
        :home_base, :spouse_name, :children, :grandchildren, :occupation, :pets, :favourite_sports,
        :favourite_radio, :favourite_childhood_games, :favourite_movie_tv, :favourite_actors,
        :favourite_animals, :additional_info, :favourite_music, :favourite_activities, :user_id, :rfid_number, :residence, songs_attributes: [:id, :title, :artist, :url])
    end
end
