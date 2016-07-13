class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :js, :html


  # GET /patients
  # GET /patients.json
  def index

    # Ensure the form has one field on page load
    @advanced_patient_search = AdvancedPatientSearch.new
    @advanced_patient_search.patient_search_categories.build
    # raise 'hell'
    if params[:advanced_patient_search]
      # category = InterestCategory.find(params[:advanced_patient_search][:search_category_id])
      # raise 'hell'

      @patients_advanced_filter = Patient.filter(params[:advanced_patient_search][:patient_search_categories_attributes])
      # cat_id = params[:advanced_patient_search][:search_category_id]
      # @patients_advanced_filter = Interest.find_by(name: "#{params[:advanced_patient_search][:patient_search_categories_attributes]["0"][:keyword]}" ).patients

    end
    # List patients who were added or their profiles changed 1 week ago
    @recently_added_patients = Patient.where("created_at >= ?", 1.week.ago.utc).order('created_at DESC')
    @recently_updated_patients = Patient.where("updated_at >= ?", 1.week.ago.utc).order('updated_at DESC')


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
    @patient = Patient.find(params[:id])
    @interests = @patient.interests
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
    # @patient.songs.build

  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id
    @patient.save

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

      # raise "hell"

      if params[:interests]
        params[:interests].each do |i, value|
        # where i is the key in the input hash which represents the category
        # and values are the user form inputs
          # i = Interest.create(name: value, patient_id: @patient.id, category_id: i)
          interest = Interest.find_or_create_by(name: value, category_id: i)
          PatientInterest.create(interest_id: interest.id, patient_id: @patient.id)
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
        :favourite_animals, :additional_info, :favourite_music, :favourite_activities, :user_id, :rfid_number, :residence,
        songs_attributes: [:id, :title, :artist, :url, :_destroy], :patients_interests => [], patient_search_categories_attributes: [:keyword, :_destroy])
    end
end
