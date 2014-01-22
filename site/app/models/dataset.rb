class Dataset < ActiveRecord::Base
  belongs_to :user

  # Makes indexable in elasticsearch
  searchkick
end
