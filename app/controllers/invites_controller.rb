class InvitesController < ApplicationController
  def index
    @invites = Invite.all

    render("invites/index.html.erb")
  end

  def show
    @invite = Invite.find(params[:id])

    render("invites/show.html.erb")
  end
  
  def invite_show
    @activity = Activity.find(params[:id])
    @invites = Invite.where(:activity_id => @activity.id).all
    #@non_current_user = User.where.not(id: current_user.id).all
    @users = User.where.not(id: Invite.where(:activity_id => @activity.id).pluck(:invitee_id)).all

    render("invites/invite_show.html.erb")
  end

  def new
    @invite = Invite.new
    @activity = Activity.find(params[:activity_id])
    @users = User.where.not(id: current_user.id).all

    render("invites/new.html.erb")
  end
  
  def create_proposer
    @invite = Invite.new
    @activity = Activity.find(params[:activity_id])
    
    @invite.activity_id = params[:activity_id]
    @invite.invitee_id = @activity.proposer_id
    @invite.attend_status = "Going"
    
    save_status = @invite.save

    if save_status == true
      redirect_to("/activities/#{@activity.id}", :notice => "Activity created successfully.")
    else
      render("activities/new.html.erb")
    end
  end

  def create
    @invite = Invite.new
    @activity = Activity.find_by(:id => params[:activity_id])

    @invite.activity_id = params[:activity_id]
    @invite.invitee_id = params[:invitee_id]
    @invite.attend_status = params[:attend_status]

    save_status = @invite.save

    if save_status == true
      redirect_to("/invite_again/#{@invite.activity_id}", :notice => "Invite created successfully.")
    else
      redirect_to("/invites/new/#{@activity.id}", :alert => "Invite failed.")
    end
  end

  def edit
    @invite = Invite.find(params[:id])

    render("invites/edit.html.erb")
  end

  def update
    @invite = Invite.find(params[:id])

    @invite.activity_id = params[:activity_id]
    @invite.invitee_id = params[:invitee_id]
    @invite.attend_status = params[:attend_status]

    save_status = @invite.save

    if save_status == true
      redirect_to("/invites/#{@invite.id}", :notice => "Invite updated successfully.")
    else
      render("invites/edit.html.erb")
    end
  end

  def destroy
    @invite = Invite.find(params[:id])

    @invite.destroy

    if URI(request.referer).path == "/invites/#{@invite.id}"
      redirect_to("/", :notice => "Invite deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Invite deleted.")
    end
  end
end
