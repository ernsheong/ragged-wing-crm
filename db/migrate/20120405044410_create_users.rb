class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :identifier_url
      t.timestamps
    end
  end
end
