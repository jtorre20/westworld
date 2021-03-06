class Api::V1::CharacterController < ApplicationController

  before_action :find_character, only: [:update]

  def index
    @character = Character.all
    render json: @characters
  end

  def update
    @character.update(character_params)
    if @character.save
      render json: @character, status: :accepted
    else
      render json: { errors: @character.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def character_params
    params.permit(:conciousness)
  end

  def find_character
    @character = Character.find(params[:id])
  end
end



end
