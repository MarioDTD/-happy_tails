class SheltersController < ApplicationController
  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter = Shelter.new
  end

  def create
    if current_user.shelter.nil?
      @shelter = Shelter.new(shelter_params)
      @shelter.user = current_user
      if @shelter.save
        redirect_to shelter_path(@shelter)
        flash[:notice] = 'Shelter successfully created!'
      end
    else
      redirect_to root_path
      flash[:notice] = 'User can only create one shelter!'
    end
  end

  private

  def shelter_params
    params.require(:shelter).permit(:name, :address, :contact, :email)
  end
end
