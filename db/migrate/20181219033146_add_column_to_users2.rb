class AddColumnToUsers2 < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :provider_url, :string
  end
end
