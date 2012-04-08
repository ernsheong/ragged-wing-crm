class AddWebsite4ToPeople < ActiveRecord::Migration
  def change
    add_column :people, :website4, :string

  end
end
