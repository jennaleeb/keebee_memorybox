class PatientInterest < ActiveRecord::Base
  belongs_to :patient
  belongs_to :interest
  validates_presence_of :interest_id
  validates :interest_id, :uniqueness => {:scope => :patient_id}
end
