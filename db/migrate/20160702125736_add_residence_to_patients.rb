class AddResidenceToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :residence, :string
  end
end
