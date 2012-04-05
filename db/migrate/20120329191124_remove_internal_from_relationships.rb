class RemoveInternalFromRelationships < ActiveRecord::Migration
  def up
  	remove_column :relationships, :internal
  end

  def down
  	add_column :relationships, :internal
  end
end
