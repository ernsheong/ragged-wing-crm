require 'spec_helper'

feature "Dropdown Navigation" do 

	background do
		visit "/"
	end

	describe "People Menu" do 
		context "when a relationship is selected" do
			it "redirects to filtered page" do 
				Relationship.list.each do |rel|
					within ".navbar" do 
						click_on rel
					end				
					uri = URI.parse(current_url)
					uri.query.should have_content "filter=#{rel.split.join("+")}"
				end
			end
		end
	end

	describe "Organization Menu" do 
		context "when a org type is selected" do
			it "redirects to filtered page" do 
				Organization.org_types.each do |typ|
					within ".navbar" do 
						click_on typ
					end				
					uri = URI.parse(current_url)
					uri.query.should have_content "filter=#{typ.split.join("+")}"
				end
			end
		end
	end
end
