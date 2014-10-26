class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@weight = current_user.weights.build
  		@feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end

  def about
  end

  def sandbox
  end
  
end
