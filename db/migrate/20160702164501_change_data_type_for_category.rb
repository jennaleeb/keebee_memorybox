class ChangeDataTypeForCategory < ActiveRecord::Migration

	def change
		remove_column :interests, :category
		add_reference :interests, :category, index: true
		add_foreign_key :interests, :categories
	end

end
