class SearchController < ApplicationController
  def show
    @search_off = true # Removes search from the toolbar
    @query = params[:query]
    @results = Dataset.search(params[:query]) if params[:query]
  end

  def autocomplete
    render json: Dataset.search(params[:query], fields: [{title: :text_start}], limit: 10).map(&:title)
  end
end
