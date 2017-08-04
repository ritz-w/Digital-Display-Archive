class StaticPagesController < ApplicationController
  
  def index
  end

  def landing_page
    @products = Product.all
  end

  def index_by_date
    @products = Product.order('year_made DESC')
  end

  def index_by_artist
    @products = Product.order(:artist)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  def references
  end

end
