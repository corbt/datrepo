class PopularController < ApplicationController

def index
  @datasets = Dataset.order('user_favorite_datasets_count DESC').limit(5)
end

end
