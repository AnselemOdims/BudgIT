class Deal < ApplicationRecord
  belongs_to :category
  belongs_to :user

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
