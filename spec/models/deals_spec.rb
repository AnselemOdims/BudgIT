require 'rails_helper'

RSpec.describe Deal, type: :model do
  context 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:category).class_name('Category') }
  end

  context 'values not empty' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end

  context 'values should be numerical' do
    it do
      should validate_numericality_of(:amount)
        .is_greater_than_or_equal_to(0)
    end
  end
end
