class AddUserCategoryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_category, :string
  end
end
