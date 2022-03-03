class Api::V1::TeasController < ApplicationController
  def create
    tea = Tea.new(
      name: tea_params[:name],
      description: tea_params[:description],
      temperature: tea_params[:temperature],
      brew_time: tea_params[:brew_time]
    )

    if tea.save
      render json: TeaSerializer.new(tea), status: 200
    else
      render json: {error: "Invalid tea information."}, status: 400
    end
  end

private

  def tea_params
    params.permit(:name, :description, :temperature, :brew_time)
  end
end
