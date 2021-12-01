class LikesController < ApplicationController
  def index
    @likes = current_user.likes
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @like = current_user.likes.new
    @like.pet = @pet
    @like.save!
    # if!@like.save
    #   flash[:notice] = @like.errors.full_messages.to_sentence
    # end
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @pet = Pet.find(params[:pet_id])
    @like = current_user.likes.find((current_user.like_ids & @pet.like_ids).first)
    @like.destroy
    # redirect_to pet_path(@pet)
    redirect_back(fallback_location: root_path)
  end
end
