class Post < ApplicationRecord
  belongs_to :user
  has_many :comments , dependent: :delete_all
  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 250 }

end
