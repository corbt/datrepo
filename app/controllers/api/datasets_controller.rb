class API::DatasetsController < API::APIController
  before_filter :find_dataset, only: [:show, :update, :destroy]

  before_filter :api_authenticate_user!, only: [:create, :update, :destroy]
  before_filter :ensure_api_editable, only: [:update, :destroy]

  def show
    render_dataset
  end

  def create
    @model = Dataset.create(dataset_params.merge(user: api_current_user))
    unless @model.valid?
      render json: {error: @model.errors}, status: 403
      return
    end
    render_dataset
  end

  def update
    @model.update_attributes(dataset_params)
    unless @model.valid?
      render json: {error: @model.errors}, status: 403
      return
    end
    render_dataset
  end

  def destroy
    @model.destroy
    render nothing: true
  end

  protected
  def find_dataset
    begin
      @model ||= Dataset.find(params[:id])
    rescue
      render json: {error: "No matching dataset found"}, status: 404 if @model.nil?
    end
  end

  def dataset_params
    params.permit(:title, :custom_license, :description, :url)
  end

  def render_dataset
    render json: @model.slice(:id, :title, :description, :url)
  end
end