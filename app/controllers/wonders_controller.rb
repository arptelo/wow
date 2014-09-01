class WondersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
  	@wonder = current_user.wonders.build(wonder_params)
    if @wonder.save
      flash[:success] = "Wonder created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def wonder_params
      params.require(:wonder).permit({:name, :lat, :lng})
    end
end