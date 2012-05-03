class Campaign < ActiveRecord::Base
  has_many :donations
  has_many :targets
  validates_presence_of :start_date, :message => "is required!"
  validates_presence_of :end_date, :message => "is required!"

  def graph_donations_by_year(campaign)
    @donations = Donation.where(:campaign_id => campaign)
    if not @donations.empty?
      @donations_by_date = @donations.order("date")              
      earliest_date = @donations_by_date.first.date.year
      latest_date = @donations_by_date.last.date.year
      data = Hash.new(0)            
      @donations_by_date.each do |donation|
        data[donation.date.year] += donation.amount                
      end                 
      (earliest_date..latest_date).each do |year|
        if data[year] == 0
          data[year] = 0
        end
      end
      data = Hash[data.sort]
      max_donation = data.values.max
      bc = GoogleChart::BarChart.new('600x350', "", :vertical, false)      
      bc.data "donations", data.values, '0000ff'      
      bc.axis :x, :range => [earliest_date, latest_date], :color => '00ffff', :font_size => 16         
      bc.axis :y, :range => [0,max_donation], :color => 'ff00ff', :font_size => 16          
      bc.width_spacing_options(:bar_width => 40, :bar_spacing => 100)      
      bc.show_legend = false;               
      @graph = bc.to_url
    end
  end
  
  def donation_freq_by_year(campaign)
    @donations = Donation.where(:campaign_id => campaign)
    if not @donations.empty?
      @donations_by_date = @donations.order("date")              
      earliest_date = @donations_by_date.first.date.year
      latest_date = @donations_by_date.last.date.year
      data = Hash.new(0)            
      @donations_by_date.each do |donation|
        data[donation.date.year] += 1                
      end                 
      (earliest_date..latest_date).each do |year|
        if data[year] == 0
          data[year] = 0
        end
      end      
      data = Hash[data.sort]      
      max_freq = data.values.max
      bc = GoogleChart::BarChart.new('600x350', "", :vertical, false)      
      bc.data "donations", data.values, '0000ff'      
      bc.axis :x, :range => [earliest_date, latest_date], :color => '00ffff', :font_size => 16         
      bc.axis :y, :range => [0,max_freq], :color => 'ff00ff', :font_size => 16
      bc.width_spacing_options(:bar_width => 40, :bar_spacing => 100)            
      bc.show_legend = false;               
      @graph = bc.to_url
    end
  end

end
