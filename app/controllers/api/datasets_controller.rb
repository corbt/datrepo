class API::DatasetsController < ApplicationController
  def show
    render json: Dataset.find(params[:id])
  end

  def create

  end

  def update

  end

  def destroy

  end
end