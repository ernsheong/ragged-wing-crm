class CreateCampaignTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.references :person
      t.references :campaign
      t.string :status

      t.timestamps
    end

  end
end
