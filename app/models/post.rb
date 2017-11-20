class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 250 }

end
