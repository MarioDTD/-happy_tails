class LikesController < ApplicationController
  def create
    @pet.likes.create(user_id: current_user.id)
    redirect_to pet_path(@pet)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end
end
