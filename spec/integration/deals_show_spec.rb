require 'rails_helper'

RSpec.describe 'Categories show page', type: :feature do
  before :each do
    @user = User.create!(email: 'johndo@gmail.com', password: '123abc', full_name: 'John')

    visit '/users/sign_in'
    fill_in 'Email', with: 'johndo@gmail.com'
    fill_in 'Password', with: '123abc'
    click_button 'LOG IN'
    @category = @user.categories.create!(name: 'Food', icon: 'back_arrow1.png')
    visit category_path(@category)
  end

  it 'should have the following content' do
    expect(page).to have_content('SINGLE CATEGORY')
    expect(page).to have_content('$0')
    expect(page).to have_content('Total Transactions')
    expect(page).to have_link('Add New Transaction')
  end
end
