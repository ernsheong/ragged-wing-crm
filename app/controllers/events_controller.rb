class EventsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /events
  # GET /events.json
  def index
    @events = Event.order(sort_column + " " + sort_direction).page(params[:page])
    @years = (2005..Time.now.year).entries
    @event_types = Event.event_types

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def filter
    @event_types = Event.event_types
    @years = (2005..Time.now.year).entries

    @selected_event = params[:filter_event]
    @selected_year = params[:filter_year]

    event = @selected_event
    year = @selected_year

    @events = Event.filter(year, event[0..-3].downcase)

    if year.blank? && event.blank?
      flash[:notice] = "Showing all events"
    elsif year && event.blank?
      flash[:notice] = "Showing all events in #{year}"
    elsif year.blank? && event
      flash[:notice] = "Showing all #{event}"
    else
      flash[:notice] = "Showing all #{event} in #{year}"
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
