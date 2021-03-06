class OrganizationsController < ApplicationController
  helper_method :sort_column, :sort_direction

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.order(sort_column + " " + sort_direction).page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @organizations }
    end
  end

  def filter
    @organizations = Kaminari.paginate_array(Organization.filter(params[:filter])).page(params[:page])
    @selected = params[:filter]
    respond_to do |format|
      format.html { render "index" }
      format.json { render json: @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find(params[:id])
    @address = @organization.address
    @member = Member.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/new
  # GET /organizations/new.json
  def new
    @organization = Organization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    @organization = Organization.find(params[:id])
    @address = @organization.address
    @person = @organization.person
    @state = @address.state unless @address.nil?
    @country = @address.country unless @address.nil?
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @address = Address.create!(params[:address])
    @organization = Organization.new(params[:organization])
    @organization.address = @address
    
    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render json: @organization, status: :created, location: @organization }
      else
        format.html { render action: "new" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.json
  def update
    @organization = Organization.find(params[:id])
    unless params[:address].nil?
      if @organization.address
        @organization.address.update_attributes(params[:address])
      end
    end
    #if @address
      #updated_attributes = {name: org['name'], website: org['website'], org_type: org['org_type'], address_id: @address.id}
    #else
      #updated_attributes = {name: org['name'], website: org['website'], org_type: org['org_type'], address_id: nil}
    #end

    respond_to do |format|
      if @organization.update_attributes(params[:organization])# and @address.update_attributes(params[:address])
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end

  # Link a person to an organization
  def create_member
    # Member.create!..

    respond_to do |format|
      format.html { redirect_to organization_path(params[:orgaid])}
      format.json { head :no_content }
    end
  end

  # Remove a link between a person and an organization
  def destroy_member

    #@member = Member.find
    #@member.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end


  private
  
  def sort_column
    Organization.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
