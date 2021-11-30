class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end 

  def dog
    @dogs = Pet.where(animal: "Dog")
  end

  def cat
    @cats = Pet.where(animal: "Cat")
  end
end
