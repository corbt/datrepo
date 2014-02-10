class DatasetsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit]

  before_filter :find_dataset, only: [:show, :edit, :update]
  before_filter :ensure_editable, only: [:update]

  helper_method :editable

  def index
    render 'popular'
  end

  def popular
  end

  def search
    @search_off = true # Removes search from the toolbar
    
    @query = params[:query]
    @results = Dataset.search(params[:query]) if params[:query]
  end

  def edit
    render 'new'
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
