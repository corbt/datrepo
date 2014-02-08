class Dataset < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :user, presence: true

  # Makes indexable in elasticsearch
  searchkick
end
