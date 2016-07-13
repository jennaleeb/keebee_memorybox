class AdvancedPatientSearchesController < ApplicationController
  
  def index
  	@patients = Patient.where("residence LIKE ?", "%#{params[:residence]}")
  	@advanced_patient_search.patient_search_categories.build
  	# @patients = Patient.all
  end

  def new
  	@advanced_patient_search = AdvancedPatientSearch.create
  end

  def show
  end
end
