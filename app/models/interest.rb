class Interest < ActiveRecord::Base
  belongs_to :category

  has_many :patient_interests, dependent: :destroy
  has_many :patients, through: :patient_interests

  # Check that the form did not input an empty string and that
  # the patient interest hasn't already been defined
  validates :name, length: { minimum: 2 }, uniqueness: { scope: :patient_id }

end
