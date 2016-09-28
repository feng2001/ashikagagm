class AddProfToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prof, :text
  end
end
