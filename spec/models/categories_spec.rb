require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:deals) }
  end

  context 'values not empty' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:icon) }
  end
end