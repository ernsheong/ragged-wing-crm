class RemoveTypeFromRelationships < ActiveRecord::Migration
  def up
  	remove_column :relationships, :type
  end

  def down
  	add_column :relationships, :type
  end
end
