class StaticPagesController < ApplicationController
  def home
  	@wonders = Wonder.order("RANDOM()").limit(5)
  end

  def help
  end
end