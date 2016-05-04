class AddPatientRefToVideos < ActiveRecord::Migration
  def change
    add_reference :videos, :patient, index: true
    add_foreign_key :videos, :patients
  end
end
