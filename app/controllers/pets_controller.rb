class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def dog
    @dogs = Pet.where(animal: "Dog")
  end
end
