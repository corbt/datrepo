class Dataset < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :collections

  has_many :user_favorite_datasets, dependent: :destroy
  has_many :favoriting_users, through: :user_favorite_datasets, source: :user

  validates :title, presence: true, uniqueness: {scope: :user, message: "is already in use with another dataset of yours"}
  validates :user, presence: true
  validates :url, presence: true

  before_save :set_description_plaintext

  default_scope { order 'user_favorite_datasets_count DESC' }

  def set_description_plaintext
    if self.description?
      description_html = SanitizedRenderer.render(self.description)
      self.description_plaintext = Nokogiri::HTML(description_html).text
    end
  end

  # Makes indexable in elasticsearch
  searchkick text_start: [:title]
  def search_data
    as_json only: [:title, :description_plaintext]
  end
end
