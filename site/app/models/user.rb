class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, 
    presence: true, 
    uniqueness: { case_sensitive: false },
    length: { minimum: 3 },
    exclusion: { in: %w(corbt kyle kcorbitt datrepo admin) }

  has_many :datasets

end
