class SearchController < ApplicationController
	helper_method :sort_column, :sort_direction

	def index
		if params[:q]
			q = params[:q]
			@people = Person.search(q)
			@organizations = Organization.where("lower(name) LIKE ?", "#{q}%")
			@events = Event.where("lower(name) LIKE ?", "#{q}%")
		else
			@people = []
			@organizations = []
			@events = []
		end
	  respond_to do |format|
	    format.html { render "index" }
	    format.json { render json: @results }
	  end
	end

	private
  
  def sort_column

  end
  
  def sort_direction
  end   

end