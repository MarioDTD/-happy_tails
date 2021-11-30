class LikesController < ApplicationController
  def create
    @pet = Pet.find(params[:pet_id])
    @user = current_user
    likes = {user: @user, pet:@pet}
    @like = Like.new(likes)
    if @like.save
      redirect_to pet_path(@pet)
    end
  end
end
