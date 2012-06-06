require 'spec_helper'

feature "Dropdown Navigation" do 

	describe "People Menu" do 
		context "when a relationship is selected" do
			it "redirects to filtered page" do 
				Relationship.list.each do |rel|
					visit "/"
					within ".navbar" do 
						click_on rel
					end				
					uri = URI.parse(current_url)
					uri.query.should have_content "filter=#{rel.split.join("+")}"
				end
			end
		end
	end
end
