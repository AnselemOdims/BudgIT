class Category < ApplicationRecord
  belongs_to :user
  has_many :deals, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
