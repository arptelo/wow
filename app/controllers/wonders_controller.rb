class WondersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]
  
  def index
    @wonders = Wonder.text_search(params[:query]).page(params[:page]).per_page(20)
  end

  def new
    @propertyTags = PropertyTag.all
    @wonder = Wonder.new
    @wonders = Wonder.all
  end

  def create
  	@wonder = Wonder.new(wonder_params)
    @wonder.user_id = current_user.id
    if @wonder.save
      flash[:success] = "Harika eklendi!"
      redirect_to(@wonder)
    else
      render 'static_pages/home'
    end
  end

  def show
    @wonders = Wonder.order("RANDOM()").limit(10)
    @wonder = Wonder.find(params[:id])
    @comments = @wonder.comments.paginate(page: params[:page])
    @comment = current_user.comments.build if signed_in?
  end

  def update
    @wonder = Wonder.find(params[:id])
    @wonder.update_attributes(wonder_params)
    redirect_to @wonder
  end

  def destroy
  end

  private

    def wonder_params
      params.require(:wonder).permit(:name, :lat, :lng).tap do |whitelisted|
        whitelisted[:properties] = params[:wonder][:properties] 
      end
    end
end