class DonationsController < ApplicationController
  helper_method :sort_column, :sort_direction

  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.order(sort_column + " " + sort_direction).page(params[:page])
    # @donations = Donation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donations }
    end
  end

  def download    
    Donation.generate_donation_csv          
    send_file("#{Rails.root}/public/temp/donations.csv", :type => "application/csv")    
  end

  def upload    
    uploaded_file = params[:file]    
    success = Donation.import_donations(uploaded_file)
    if success    
      flash[:notice] = uploaded_file.original_filename + "'s contents was imported successfully."
    else
      flash[:notice] = "Import failed." 
    end
    redirect_to :action => "index" 
  end

  def search_by_amount
    @donations = Donation.search_by_specific_amount(params[:amount])
    render "index"
  end

  def search_by_amount_range
    @donations = Donation.search_by_range_amount(params[:min], params[:max])
    render "index"
  end

  def search_by_date_range
    @donations = Donation.get_donations_between_dates(params[:start], params[:end])
    render "index"
  end

  def filter_donations
    @donations = Donation.filter_donations(params[:min], params[:max], params[:start], params[:end])
    @results = {}
    @results[:total] = @donations.count
    @results[:donations] = @donations

    @donations = Kaminari.paginate_array(@donations).page(params[:page])
    respond_to do |format|
      format.html { render "index" }
      format.json { render json: @results }
    end
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    @donation = Donation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.json
  def new
    @donation = Donation.new
    @person = Person.find(params[:person_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/1/edit
  def edit
    @donation = Donation.find(params[:id])
    @person = @donation.donor
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(params[:donation])

    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        format.json { render json: @donation, status: :created, location: @donation }
      else
        format.html { render action: "new" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donations/1
  # PUT /donations/1.json
  def update
    @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to donations_url }
      format.json { head :no_content }
    end
  end

  private
  
  def sort_column
    Donation.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
