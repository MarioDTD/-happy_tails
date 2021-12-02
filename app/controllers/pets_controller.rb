class PetsController < ApplicationController
  has_scope :breed
  has_scope :age, using: %i[min_age max_age], type: :hash

  def index
    @pets = Pet.all
  end

  def new
    @shelter = current_user.shelter
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @shelter = current_user.shelter
    @pet.shelter = @shelter
    @pet.save!
    # remember to INCLUDE redirect to the shelter/show pet page after this pet is created
    redirect_to pet_path(@pet)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def dogs
    @pets = apply_scopes(Pet).animal("dog")

    @dogs = Pet.where(animal: "Dog")
    @pet_breed = []
    @min_age = params[:age] ? params[:age][:min_age] : ""
    @max_age = params[:age] ? params[:age][:max_age] : ""

    @dogs.each do |breed|
      @pet_breed << breed.breed
    end
  end

  def cats
    @pets = apply_scopes(Pet).animal("cat")

    @cats = Pet.where(animal: "Cat")
    @pet_breed = []
    @min_age = params[:age] ? params[:age][:min_age] : ""
    @max_age = params[:age] ? params[:age][:max_age] : ""

    @cats.each do |breed|
      @pet_breed << breed.breed
    end
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
    # redirect to the shelter page listing of pets
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :animal, :breed, :color, :gender, :overview, :fee, :age, :sterilised, photos: [])
  end
end
