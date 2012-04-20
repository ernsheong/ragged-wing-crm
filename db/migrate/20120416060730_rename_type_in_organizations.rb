class RenameTypeInOrganizations < ActiveRecord::Migration
  def up
  	rename_column(:organizations, :type, :org_type)
  end

  def down
  	rename_column(:organizations, :org_type, :type)
  end
end
