class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy, :update]

	def new
	end

	def create
	end

	def destroy
	end

	def show
	end

	def update
	end

	def index
	end
end