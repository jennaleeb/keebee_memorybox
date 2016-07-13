class Interest < ActiveRecord::Base
  belongs_to :interest_category

  has_many :patient_interests, dependent: :destroy
  has_many :patients, through: :patient_interests

  # Check that the form did not input an empty string and that
  # the patient interest hasn't already been defined
  # validates :name, length: { minimum: 2 }, uniqueness: { scope: :patient_id }
  validates :name, length: { minimum: 2 }
  validates_uniqueness_of :name, scope: :category_id

  scope :interest_name, -> (name) {where(name: "#{name}")}

  # Take model's comma separated string and turn it into a list
  def self.split_list(attribute)
  	unless attribute.nil?
  		list = attribute.split(",")
  	end
  	return list
  end
end
