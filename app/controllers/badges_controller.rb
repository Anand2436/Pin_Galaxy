class BadgesController < ApplicationController
	before_action :find_badge, only: [:show,:edit,:update,:destroy, :upvote]
	before_action :authenticate_user! ,except: [:index, :show]
	def index
		@badges=Badge.all.order("created_at DESC")
	end
	def new
		@badge = current_user.badges.build
	end

	def create
		@badge=	current_user.badges.build(badge_params)

		if @badge.save
			redirect_to @badge,notice: "Successfully created new badge"
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @badge.update(badge_params)
			redirect_to @badge,notice: "Badge Updated Successfully"
		else
			render 'edit'
		end
	end

	def destroy

		@badge.destroy
		redirect_to root_path

	end

	def upvote
		@badge.upvote_by current_user
		redirect_to :badge
	end


	def show

	end

	private

	def badge_params
			params.require(:badge).permit(:title,:description, :image)
	end

	def find_badge
		@badge=Badge.find(params[:id])
	end

end