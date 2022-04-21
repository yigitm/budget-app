require 'rails_helper'

RSpec.describe 'home page', type: :system do
  before(:each) do
    @user = User.new(name: 'First Name', email: 'test@mail.com', password: '123456')
    @user.confirmed_at = Time.now
    @user.skip_confirmation!
    @user.confirm
    @user.save

    @second_user = User.create!(name: 'Second User', email: 'test2@mail.com', password: '123456')
    @second_user.confirmed_at = Time.now
  end

  it 'can sign in to home page with correct & confirmed credentails' do
    visit('/users/sign_in')
    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password
    
    click_on 'login'
    expect(page).to have_content('Logout')
  end
end
