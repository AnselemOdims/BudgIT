class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category

  validates :name, presence: true
  validates :amount, presence: true

  def self.sum_amounts(deals)
    sum = 0
    deals.all.each do |deal|
      sum += deal.amount
    end
    sum
  end
end
