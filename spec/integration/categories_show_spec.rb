require 'rails_helper'

RSpec.describe 'Categories show page', type: :feature do
  before :each do
    @user = User.create!(email: 'johndo@gmail.com', password: '123abc', full_name: 'John')

    visit '/users/sign_in'
    fill_in 'Email', with: 'johndo@gmail.com'
    fill_in 'Password', with: '123abc'
    click_button 'LOG IN'
   
    @category = @user.categories.create!(name: 'Food', icon: 'back_arrow1.png')
    @transaction = @user.deals.create!(name: 'Rice Payment', amount: 100, category: @category)
    visit deal_path(@transaction)
  end

  it 'should have the following content' do
    expect(page).to have_content('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')
    expect(page).to have_content('Rice Payment')
    expect(page).to have_content('$100')
    expect(page).to have_content('Transaction N°3412000032')
    expect(page).to have_content('TOTAL PAYMENT')
  end
end