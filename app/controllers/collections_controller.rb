class CollectionsController < ApplicationController
  before_filter :authenticate_user!, 
    only: [:new, :create, :update, :edit, :destroy, :favorite, :datasets]

  before_filter :find_collection, 
    only: [:show, :edit, :update, :destroy, :favorite, :datasets]

  before_filter :ensure_editable, only: [:update, :destroy, :datasets]


  def update
    @collection.update(collection_params)

    redirect_to collection_path(@collection)
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.create(collection_params.merge(user: current_user))
    render 'new' unless @collection.valid?

    redirect_to collection_path(@collection)
  end

  def destroy
    title = @collection.title
    @collection.destroy
    flash[:notice] = "Deleted collection \"#{title}\""
    redirect_to user_path(current_user.username)
  end

  def favorite
    if params[:favorite] == "true"
      current_user.favorite_collections << @collection
    elsif params[:favorite] == "false"
      current_user.favorite_collections.delete @collection
    end
    render nothing: true
  end

  def datasets
    if params[:add] == "true"
      @collection.datasets << Dataset.find(params[:dataset])
    elsif params[:add] == "false"
      @collection.datasets.delete params[:dataset]
    end
    render nothing: true
  end

  private
    def collection_params
      params.require(:collection).permit(:title)
    end

    def find_collection
      if params[:id]
        @collection = Collection.find params[:id]
      elsif params[:collection_id]
        @collection = Collection.find params[:collection_id]
      end
      if @collection.nil?
        render 'public/404.html', status: 404, layout: false
      end
    end

    def ensure_editable
      redirect_to collection_path(@collection) unless editable?(@collection)
    end
end
