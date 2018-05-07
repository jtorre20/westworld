class Api::V1::RoundController < ApplicationController

  before_action :find_round, only: [:update]

  def index
    @round = Character.all
    render json: @rounds
  end

  def update
    @round.update(round_params)
    if @round.save
      render json: @round, status: :accepted
    else
      render json: { errors: @round.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def round_params
    params.permit(:id, :round, :seconds, :status, :score)
  end

  def find_round
    @round = Character.find(params[:id])
  end
end
end
