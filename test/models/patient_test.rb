require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end



  test "#describe returns first name" do
    patient = Patient.new(first_name: "Joe", last_name: "Doe")
    assert_equal(patient.describe, "Joe Doe")
  end

  test "#split_list takes string separated by commas and returns array" do
  	patient = Patient.new(grandchildren: "Billy,Bob,Sandra")
  	assert_equal(patient.split_list(patient.grandchildren), ["Billy", "Bob", "Sandra"])
  end
end
