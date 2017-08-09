class StaticPagesController < ApplicationController
  
  def index
  end

  def landing_page
    @Projects = Project.all
  end

  def index_by_date
    @Projects = Project.order('date_began DESC')
  end

  def index_by_artist
    @Projects = Project.order(:author)
  end

  def events
    @Events = Event.all
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
