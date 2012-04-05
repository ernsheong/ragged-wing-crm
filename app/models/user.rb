class User < ActiveRecord::Base
  validates :identifier_url, :email, :presence => true
  validates :first_name, :last_name, :presence => true, :on => :update
end
