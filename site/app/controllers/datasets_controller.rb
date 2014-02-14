class DatasetsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  before_filter :find_dataset, only: [:show, :edit, :update, :destroy]
  before_filter :ensure_editable, only: [:update, :destroy]

  helper_method :editable

  def index
    render 'popular'
  end

  def popular
  end

  def update
    @dataset.update(dataset_params)

    redirect_to dataset_path(@dataset)
  end

  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = Dataset.create(dataset_params.merge(user: current_user, records: 0, size: 0, downloads: 0))
    render 'new' unless @dataset.valid?

    redirect_to dataset_path(@dataset)
  end

  def destroy
    title = @dataset.title
    @dataset.destroy
    flash[:notice] = "Deleted dataset \"#{title}\""
    redirect_to user_path(current_user.username)
  end

  private
    def editable
      @editable ||= (current_user == @dataset.user or current_user && current_user.admin?) ? true : false
    end

    def dataset_params
      params.require(:dataset).permit(:title, :custom_license, :description)
    end

    def find_dataset
      @dataset = Dataset.find params[:id]
    end

    def ensure_editable
      redirect_to dataset_path(@dataset) unless editable
    end
end
