class AddRoleAndCompanyToPeople < ActiveRecord::Migration
  def change
    add_column :people, :role, :string
    add_column :people, :company, :string
  end
end
