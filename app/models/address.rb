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

  def self.countries
    [ "United States", "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", 
      "Antigua & Deps", "Argentina", "Armenia", "Australia", "Austria", 
      "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", 
      "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia Herzegovina", 
      "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina", "Burundi", 
      "Cambodia", "Cameroon", "Canada", "Cape Verde", "Central African Rep", 
      "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", 
      "Congo {Democratic Rep}", "Costa Rica", "Croatia", "Cuba", "Cyprus", 
      "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", 
      "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", 
      "Eritrea", "Estonia", "Ethiopia", "Fiji", "Finland", "France", "Gabon", 
      "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", 
      "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", 
      "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland {Republic}", 
      "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan", "Jordan", "Kazakhstan", 
      "Kenya", "Kiribati", "Korea North", "Korea South", "Kosovo", "Kuwait", 
      "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", 
      "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Madagascar", 
      "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", 
      "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", 
      "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar (Burma)", 
      "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", 
      "Niger", "Nigeria", "Norway", "Oman", "Pakistan", "Palau", "Panama", 
      "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", 
      "Qatar", "Romania", "Russian Federation", "Rwanda", "St Kitts & Nevis", 
      "St Lucia", "Saint Vincent & the Grenadines", "Samoa", "San Marino", 
      "Sao Tome & Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", 
      "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", 
      "Somalia", "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", 
      "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", 
      "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad & Tobago", 
      "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", 
      "United Arab Emirates", "United Kingdom", "Uruguay", "Uzbekistan", 
      "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"]
  end

  def self.US_states
    ["AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID",
      "IL","IN","KS","KY","LA","MA","MD","ME","MH","MI","MN","MO","MS","MT","NC","ND",
      "NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","PR","PW","RI","SC","SD",
      "TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"]
  end
end
