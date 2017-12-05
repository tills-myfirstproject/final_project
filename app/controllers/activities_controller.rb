class ActivitiesController < ApplicationController
  def index

    @activities = Activity.where(:proposer_id => current_user.id).all
    @categories = Category.all

    render("activities/index.html.erb")
  end

  def show
    @activity = Activity.find(params[:id])

    render("activities/show.html.erb")
  end

  def new
    @activity = Activity.new
    @categories = Category.all

    render("activities/new.html.erb")
  end

  def create
    @activity = Activity.new
    @categories = Category.all
    
    @activity.name = params[:name]
    @activity.address = params[:address]
    @activity.category_id = params[:category_id]
    @activity.date = params[:date]
    @activity.meet_time = params[:meet_time]
    @activity.proposer_id = params[:proposer_id]
    @activity.visual = params[:visual]
    @activity.duration = params[:duration]
    @activity.cost_level = params[:cost_level]

    save_status = @activity.save

    if save_status == true
      redirect_to("/activities/#{@activity.id}", :notice => "Activity created successfully.")
    else
      render("activities/new.html.erb")
    end
  end

  def edit
    @activity = Activity.find(params[:id])
    
    # if @activity.cost_level = "low"
    #   @low_option = "checked"
    # elsif @activity.cost_level = "medium"
    #   @medium_option = "checked"
    # elsif @activity.cost = "high"
    #   @high_option.cost = "high"
    # end

    render("activities/edit.html.erb")
  end

  def update
    @activity = Activity.find(params[:id])

    @activity.name = params[:name]
    @activity.address = params[:address]
    @activity.category_id = params[:category_id]
    @activity.meet_time = params[:meet_time]
    @activity.proposer_id = params[:proposer_id]
    @activity.visual = params[:visual]
    @activity.duration = params[:duration]
    @activity.cost_level = params[:cost_level]

    save_status = @activity.save

    if save_status == true
      redirect_to("/activities/#{@activity.id}", :notice => "Activity updated successfully.")
    else
      render("activities/edit.html.erb")
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    @activity.destroy

    if URI(request.referer).path == "/activities/#{@activity.id}"
      redirect_to("/", :notice => "Activity deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Activity deleted.")
    end
  end
end
