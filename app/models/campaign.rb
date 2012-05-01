class Campaign < ActiveRecord::Base
  has_many :donations
end
