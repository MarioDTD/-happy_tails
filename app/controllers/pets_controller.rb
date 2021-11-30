class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def dogs
    @dogs = Pet.where(animal: "Dog")
  end

  def cats
    @cats = Pet.where(animal: "Cat")
  end
end
