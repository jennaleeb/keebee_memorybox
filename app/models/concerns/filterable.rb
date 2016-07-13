module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      # Abstract this out to be more general

      patients = Patient.all

      filtering_params.each do |ith_search, search_terms|


        # Find each interest in the query
        interest = Interest.find_by(name: search_terms["keyword"], category_id: search_terms["search_category_id"])

        # Find set intersection of each patient list and reassign to loop through
        @patients_filtered = patients & interest.patients unless interest.nil?
        patients = @patients_filtered

      end

      @patients_filtered
    end

    


  end
end
