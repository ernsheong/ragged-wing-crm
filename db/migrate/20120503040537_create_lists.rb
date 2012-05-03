class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :description
      t.integer :campaign_id

      t.timestamps
    end
  end
end
