class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :deals, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
