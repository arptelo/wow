class WondersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def new
    @wonder = Wonder.new
  end

  def create
  	@wonder = Wonder.new(wonder_params)
    @wonder.user_id = current_user.id
    if @wonder.save
      flash[:success] = "Wonder created!"
      redirect_to(@wonder)
    else
      render 'static_pages/home'
    end
  end

  def show
    @wonder = Wonder.find(params[:id])
  end

  def destroy
  end

  private

    def wonder_params
      params.require(:wonder).permit(:name, :lat, :lng)
    end
end