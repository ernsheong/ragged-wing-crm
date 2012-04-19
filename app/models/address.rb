class Address < ActiveRecord::Base
	has_many :organizations
	has_many :people
	
  def to_s    
    address = ""         
    address << self.street << ', ' unless self.street == ''    
    address << self.city << ', ' unless self.city == ''
    address << self.state << ', ' unless self.state == ''    
    address << self.zip << ', '  unless self.zip == ''              
    if self.country == ''            
      index = address.index(',', -3)      
      if index == nil
        return ""
      end              
      address[0..index-1]
    else
      address << self.country
    end        
  end
end
