class PeopleController < ApplicationController
  before_filter :ensure_signed_in
  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end


  def search
    @people = Person.search(params[:q]) # Array
    render "index"
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])
    @address1 = @person.address1
    @address2 = @person.address2
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
    @address1 = @person.address1
    @address2 = @person.address2
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])
    @address = Address.new(params[:address1])
    @address.save!
    @person.address1 = @address
    @address = Address.new(params[:address2])
    @address.save!
    @person.address2 = @address
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])
    # Update the address
    if @person.address1
      @person.address1.update_attributes(params[:address1])
    else
      @address1 = Address.new(params[:address1])
      @address1.save!
      @person.address1 = @address1
      @person.save!
    end
    if @person.address2
      @person.address2.update_attributes(params[:address2])
    else
      @address2 = Address.new(params[:address2])
      @address2.save!
      @person.address2 = @address2
      @person.save!
    end
    # Update person
    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    #@person = Person.find(params[:id])
    #@person.destroy
    Person.destroy(params[:id])

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end
end
