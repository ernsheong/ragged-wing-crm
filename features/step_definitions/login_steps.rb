Given /^I am logged in$/ do
  new_user = {:email => "raggedwing169@gmail.com",
    :identifier_url => "https://www.google.com/accounts/o8/id?id=AItOawmOFS03P9p6QPk7Du-HjY6cKuwgPmGeSK0"}
  user = User.create!(new_user)
end

#Given /^I am logged in$/ do
#  visit(new_session_path)
#  fill_in("Email", :with => "raggedwing169")
#  fill_in("Passwd", :with => "berkeley169")
#  click_button("Sign in")
#end
