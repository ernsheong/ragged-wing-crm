class AddAdminAccount < ActiveRecord::Migration
  def change
  	User.create :email => "raggedwing169@gmail.com",
  							:identifier_url => "https://www.google.com/accounts/o8/id?id=AItOawmOFS03P9p6QPk7Du-HjY6cKuwgPmGeSK0",
  							:admin => true
  end
end
