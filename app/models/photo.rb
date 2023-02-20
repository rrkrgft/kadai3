class Photo < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :text, presence: true, length: { maximum: 255 }
end
