class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :person
      t.string :type
      t.boolean :internal # internal/external?
      t.timestamps
    end
  end
end
