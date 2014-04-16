class DatasetsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :favorite]

  before_filter :find_dataset, only: [:show, :edit, :update, :destroy, :favorite]
  before_filter :ensure_editable, only: [:update, :destroy]

  def index
    redirect_to popular_path
  end

  def popular
  end

  def update
    @dataset.update(dataset_params)
    render 'edit' and return unless @dataset.valid?

    redirect_to dataset_path(@dataset)
  end

  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = Dataset.create(dataset_params.merge(user: current_user))
    Rails.logger.debug "Is it valid: "
    Rails.logger.debug @dataset.valid?

    render 'new' and return unless @dataset.valid?

    redirect_to dataset_path(@dataset)
  end

  def destroy
    title = @dataset.title
    @dataset.destroy
    flash[:notice] = "Deleted dataset \"#{title}\""
    redirect_to user_path(current_user.username)
  end

  def favorite
    if params[:favorite] == "true"
      current_user.favorite_datasets << @dataset
    elsif params[:favorite] == "false"
      current_user.favorite_datasets.delete @dataset
    end
    render nothing: true
  end

  private

    def dataset_params
      params.require(:dataset).permit(:title, :custom_license, :description, :url)
    end

    def find_dataset
      if params[:id]
        @dataset = Dataset.find params[:id]
      elsif params[:dataset_id]
        @dataset = Dataset.find params[:dataset_id]
      end
      if @dataset.nil?
        render 'public/404.html', status: 404, layout: false
      end
    end

    def ensure_editable
      redirect_to dataset_path(@dataset) unless editable?(@dataset)
    end
end
