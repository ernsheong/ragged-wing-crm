class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
	  t.references :person
	  t.text :body
      t.timestamps
    end
  end
end
