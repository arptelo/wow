class StaticPagesController < ApplicationController
  def home
  	@wonders = Wonder.limit(5).order("RANDOM()")
  end

  def help
  end
end