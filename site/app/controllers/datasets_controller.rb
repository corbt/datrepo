class DatasetsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def show
    render 'popular'
  end

  def popular
  end

  def search
  end

  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = Dataset.create(dataset_params.merge(user: current_user))
    flash[:notice] = "Dataset successfully created!"
    redirect_to @dataset
  end

  private
    def dataset_params
      params.require(:dataset).require(:title)
      params.require(:dataset).permit(:custom_license, :description)
    end
end
