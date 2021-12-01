class LikesController < ApplicationController
<<<<<<< HEAD
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
=======
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
>>>>>>> 29f0c36e4bec6b001a4ce0650b444b14e7c7fe49
  end
end
