class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :type
      t.string :description
      t.datetime :time

      t.timestamps
    end
  end
end
