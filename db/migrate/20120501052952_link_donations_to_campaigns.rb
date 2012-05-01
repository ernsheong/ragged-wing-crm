class LinkDonationsToCampaigns < ActiveRecord::Migration
  def change
    change_table :donations do |t|
      t.remove :campaign
      t.references :campaign
    end
  end
end
