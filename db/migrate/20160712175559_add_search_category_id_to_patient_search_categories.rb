class AddSearchCategoryIdToPatientSearchCategories < ActiveRecord::Migration
  def change
  	add_column :patient_search_categories, :search_category_id, :integer
  end
end
