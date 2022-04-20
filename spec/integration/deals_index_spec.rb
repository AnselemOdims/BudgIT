require 'rails_helper'

RSpec.describe 'Categories index page', type: :feature do
  before :each do
    @user = User.create!(email: 'johndo@gmail.com', password: '123abc', full_name: 'John')

    visit '/users/sign_in'
    fill_in 'Email', with: 'johndo@gmail.com'
    fill_in 'Password', with: '123abc'
    click_button 'LOG IN'

    visit '/deals'
  end

  it 'should have the following content' do
    expect(page).to have_content('ALL TRANSACTIONS')
    expect(page).to have_content('Total Transactions')
    expect(page).to have_link('Home')
    expect(page).to have_link('Transactions')
    expect(page).to have_link('Categories')
    expect(page).to have_link('Sign Out')
    expect(page).to have_content('No transactions added for this category')
  end

  it 'should redirect to the right path' do
    click_link 'Add New Transaction'
    expect(current_path).to eq(new_deal_path)
  end

  it 'should display the created transaction' do
    @category = @user.categories.create!(name: 'Food', icon: 'back_arrow1.png')
    @transaction = @user.deals.create!(name: 'Rice Payment', amount: 100, category: @category)
    visit '/deals'
    expect(page).to have_content('ALL TRANSACTIONS')
    expect(page).to have_content('Total Transactions')
    expect(page).to have_content(@transaction.created_at)
    expect(page).to have_content('$100')
    expect(page).to have_link('Add New Transaction')
  end
end
