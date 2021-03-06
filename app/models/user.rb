class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, 
    presence: true, 
    uniqueness: { case_sensitive: false },
    length: { minimum: 3 },
    exclusion: { in: %w(corbt kyle kcorbitt datrepo admin) },
    format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i, message: "should be alphanumeric"}

  validates :api_key, presence: true, uniqueness: true

  has_many :datasets, dependent: :destroy
  has_many :collections, dependent: :destroy

  has_many :user_favorite_collections, dependent: :destroy
  has_many :favorite_collections, through: :user_favorite_collections, source: :collection
  has_many :user_favorite_datasets, dependent: :destroy
  has_many :favorite_datasets, through: :user_favorite_datasets, source: :dataset

  before_validation :generate_key

  protected
    def generate_key
      self.api_key ||= Devise.friendly_token
    end
end
