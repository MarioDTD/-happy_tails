class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
    # check if the shelter_id works cos i'm creating this without 'create new shelter'
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @shelter = Shelter.find(params[:shelter_id])
    # check if the shelter_id works cos i'm creating this without 'create new shelter'
    @pet.shelter = @shelter
    @pet.save!
    # remember to INCLUDE redirect to the shelter/show pet page after this pet is created
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :animal, :breed, :color, :fee, :age, :sterilised, :photo)
  end
  
  def show
    @pet = Pet.find(params[:id])
  end 

  def dog
    @dogs = Pet.where(animal: "Dog")
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end
  
  def cat
    @cats = Pet.where(animal: "Cat")
    
  end
  
  private
  
  def pet_params
    params.require(:pet).permit(:name, :breed, :color, :fee, :age, :sterilised)
  end
end
