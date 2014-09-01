class StaticPagesController < ApplicationController
  def home
  	@wonders = Wonder.limit(2).order("RANDOM()")
  end

  def help
  end
end