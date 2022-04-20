require 'rails_helper'

RSpec.describe 'Categories index page', type: :feature do
  before :each do
    @user = User.create!(email: 'johndo@gmail.com', password: '123abc', full_name: 'John')

    visit '/users/sign_in'
    fill_in 'Email', with: 'johndo@gmail.com'
    fill_in 'Password', with: '123abc'
    click_button 'LOG IN'

    visit '/categories'
  end

  it 'should have the following content' do
    expect(page).to have_content('John')
    expect(page).to have_content('Total Categories')
    expect(page).to have_link('Home')
    expect(page).to have_link('Transactions')
    expect(page).to have_link('Categories')
    expect(page).to have_link('Sign Out')
    expect(page).to have_content('No categories added yet')
  end

  it 'should redirect to the right path' do
    click_link 'Add New Category'
    expect(current_path).to eq(new_category_path)
  end

  it 'should display the created category' do
    @user.categories.create!(name: 'Food', icon: 'back_arrow1.png')
    visit '/categories'
    expect(page).to have_content('Food')
    expect(page).to have_content('CATEGORIES')
    expect(page).to have_content('Total Categories')
    expect(page).to have_content('$0')
    expect(page).to have_link('Add New Category')
  end
end