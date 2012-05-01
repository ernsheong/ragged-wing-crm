class OrganizationsController < ApplicationController
  before_filter :ensure_signed_in

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all

    respond_to do |format|
      format.html
      format.json { render json: @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find(params[:id])
    @address = @organization.address

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
    #@address = Address.find_by_id(params[address_id])
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
end
