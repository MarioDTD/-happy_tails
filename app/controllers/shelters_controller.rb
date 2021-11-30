class SheltersController < ApplicationController
  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)
    @shelter.user = current_user
    @shelter.save!
    redirect_to shelter_path(@shelter)
  end

  private

  def shelter_params
    params.require(:shelter).permit(:name, :address, :contact, :email)
  end
end
