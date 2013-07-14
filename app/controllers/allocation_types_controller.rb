class AllocationTypesController < ApplicationController
	before_filter do 
		redirect_to :new_user_session_path unless current_user && current_user.admin?
	end

	def index
		@allocation_types = current_user.account.allocation_types.all
	end

	def show
		@allocation_type = current_user.account.allocation_types.find(params[:id])
	end

	def edit
		@allocation_type = current_user.account.allocation_types.find(params[:id])
	end
end
