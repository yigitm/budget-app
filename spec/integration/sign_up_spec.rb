require 'rails_helper'

RSpec.describe 'sign_up page', type: :system do
  before(:each) do
    @user = User.new(name: 'First Name', email: 'test@mail.com', password: '123456')

    @second_user = User.create!(name: 'Second User', email: 'test2@mail.com', password: '123456')
    @second_user.confirmed_at = Time.now
  end

  it "can't sign up with existing user information" do
    visit('/users/sign_up')
    fill_in "user[name]", :with => @user.name
    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password
    fill_in "user[password_confirmation]", :with => @user.password

    @user.confirmed_at = Time.now
    @user.skip_confirmation!
    @user.confirm
    @user.save
    
    click_on 'sign-up'
    expect(page).to have_content('Email has already been taken')
  end

  it "can sign up and redirect user to login page" do
    visit('/users/sign_up')
    fill_in "user[name]", :with => 'Second User'
    fill_in "user[email]", :with => 'second@mail.com'
    fill_in "user[password]", :with => '123456'
    fill_in "user[password_confirmation]", :with => '123456'
    click_on 'sign-up'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end