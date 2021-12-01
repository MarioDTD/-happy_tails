class LikesController < ApplicationController
  # def like
  #   @pet = Pet.find(params[:id])
  #   Like.create(user_id: current_user.id, pet_id: @pet.id)
  #   redirect_to pet_path(@pet)
  # end

  # def index
  #   @pet = Pet.find(params[:id])
  #   @likes = current_user.like
  # end

  # def update
  #   @pet = Pet.find(params[:id])
  #   like = Like.where(pet: Pet.find(params[:id]), user: current_user)
  #   if like == []
  #     #create the favourite
  #     Like.create(pet: Pet.find(params[:id]), user: current_user)
  #     @like_exists = true
  #   else
  #     #destroy the favourite
  #     like.destroy_all
  #     @like_exists = false
  #   end
  # end

  

  private

  def like_params
    params.require(:like).permit(:pet_id, :user_id)
  end
end
