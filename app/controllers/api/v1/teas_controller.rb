class Api::V1::TeasController < ApplicationController
  def create
    tea = Tea.new(
      name: params[:name],
      description: params[:description],
      temperature: params[:temperature],
      brew_time: params[:brew_time]
    )

    if tea.save
      render json: TeaSerializer.new(tea)
    else
      render json: {error: "Invalid tea information."}
    end
  end
end
