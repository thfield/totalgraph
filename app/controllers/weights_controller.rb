class WeightsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
  	@weight = current_user.weights.build(weight_params)
    if @weight.save
      flash[:success] = "Entry logged!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @weight.destroy
    flash[:success] = "Entry deleted"
    redirect_to request.referrer || root_url
  end

  def edit
    @weight = Weight.find(params[:id])
  end

  def update
    @weight = Weight.find(params[:id])
    if @weight.update_attributes(weight_params)
      flash[:success] = "Entry updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def show
  end


  private

    def weight_params
      params.require(:weight).permit(:total, :pfat, :fat, :lean)
    end

    def correct_user
      @weight = current_user.weights.find_by(id: params[:id])
      redirect_to root_url if @weight.nil?
    end
end
