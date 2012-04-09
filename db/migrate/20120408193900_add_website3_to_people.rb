class AddWebsite3ToPeople < ActiveRecord::Migration
  def change
    add_column :people, :website3, :string
  end
end
