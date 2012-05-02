class EventsController < ApplicationController
  before_filter :ensure_signed_in
  helper_method :sort_column, :sort_direction
  # GET /events
  # GET /events.json
  def index
    @events = Event.order(sort_column + " " + sort_direction).page(params[:page])
    @years = (2005..Time.now.year).entries

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def search
    if params[:q]
      @events = Event.where("lower(name) LIKE ?", "%#{q}%").all
    else
      @events = []      
    end
    @results = {}
    @results[:total] = @events.count
    @results[:events] = @events
  
    @events = Kaminari.paginate_array(@events).page(params[:page])
    respond_to do |format|
      format.html { render "index" }
      format.json { render json: @results }
    end
  end

  def filter
    @events = Event.filter(params[:filter])
    @years = (2005..Time.now.year).entries
    @selected = params[:filter]
    if params[:filter].blank?
      flash[:notice] = "Showing all events"
    else 
      flash[:notice] = "Showing all events in #{@selected}"
    end
    @events = Kaminari.paginate_array(@events).page(params[:page])
    render "index"
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @events = Event.event_list

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @events = Event.event_list
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        @events = Event.event_list
        format.html { render action: "new"}
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        @events = Event.event_list
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
  
  def sort_column
    Event.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
