class RenameCategoriesToInterestCategories < ActiveRecord::Migration
	def self.up
	  rename_table :categories, :interest_categories
	end

	def self.down
	  rename_table :interest_categories, :categories
	end
end
