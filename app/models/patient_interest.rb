class PatientInterest < ActiveRecord::Base
  belongs_to :patient
  belongs_to :interest
end
