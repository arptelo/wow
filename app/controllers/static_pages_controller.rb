class StaticPagesController < ApplicationController
  def home
  	@wonders = Wonder.order("RANDOM()").limit(3)
  end

  def help
  end
end