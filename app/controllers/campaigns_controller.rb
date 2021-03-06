class CampaignsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.order(sort_column + " " + sort_direction).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaigns }
    end
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
    @campaign = Campaign.find(params[:id])
    @target = Target.new
    @amount_graph = @campaign.graph_donations_by_year(params[:id])
    @freq_graph = @campaign.donation_freq_by_year(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @campaign }
    end
  end

  # GET /campaigns/new
  # GET /campaigns/new.json
  def new
    @campaign = Campaign.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @campaign }
    end
  end

  # GET /campaigns/1/edit
  def edit
    @campaign = Campaign.find(params[:id])
  end

  def target
    donors = Donation.donor_list(params[:donations]) # returns array of Person IDs
    unless donors.nil?
      donors.each do |id|
        begin 
          Target.create!({ person_id: id, campaign_id: params[:campaign][:id] })
        rescue
          next
        end
      end
    end 

    @campaign = Campaign.find(params[:campaign][:id])
    @target = Target.new
    @amount_graph = @campaign.graph_donations_by_year(params[:campaign][:id])
    @freq_graph = @campaign.donation_freq_by_year(params[:campaign][:id])

    respond_to do |format|
      format.html { render "show" }  
    end
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(params[:campaign])

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render json: @campaign, status: :created, location: @campaign }
      else
        format.html { render action: "new" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /campaigns/1
  # PUT /campaigns/1.json
  def update
    @campaign = Campaign.find(params[:id])

    respond_to do |format|
      if @campaign.update_attributes(params[:campaign])
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to campaigns_url }
      format.json { head :no_content }
    end
  end

  private
  
  def sort_column
    Campaign.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
