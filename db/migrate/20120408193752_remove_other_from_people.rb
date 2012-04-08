class RemoveOtherFromPeople < ActiveRecord::Migration
  def up
    remove_column :people, :other
  end

  def down
    add_column :people, :other, :string
  end
end
