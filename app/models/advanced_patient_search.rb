class AdvancedPatientSearch < ActiveRecord::Base
	has_many :patient_search_categories

	include Filterable
	
end
