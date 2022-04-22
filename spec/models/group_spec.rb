require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.new(name: 'First Name', email: 'test@mail.com', password: '123456')
    @user.confirmed_at = Time.now
    @user.skip_confirmation!
    @user.confirm
    @user.save

    @group = Group.create(name: 'Food Category', icon: 'food.png', user_id: @user.id)
  end

  it 'can be created with valid inputs' do
    expect(@group.valid?).to be_truthy
  end

  it "can't be created without name" do
    @group2 = Group.new(icon: 'food.png', user_id: @user.id)

    expect(@group2.valid?).to be_falsey
  end

  it "can't be created without icon" do
    @group2 = Group.new(name: 'Food Category', user_id: @user.id)

    expect(@group2.valid?).to be_falsey
  end

  it "can't be created without false user_id" do
    @group2 = Group.new(name: 'Food Category', icon: 'food.png')

    expect(@group2.valid?).to be_falsey
  end
end
