class AddMetadataToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :company_name, :string
    add_column :users, :customer_type, :string
    add_column :users, :estimated_annual_projects, :integer
    add_column :users, :estimated_annual_products, :integer
  end
end
