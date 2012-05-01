class User < ActiveRecord::Base
  validates :identifier_url, :email, :presence => true, :uniqueness => true

  #attr_protected :admin
end
