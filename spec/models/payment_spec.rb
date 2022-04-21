require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) do
    @user = User.new(name: 'First Name', email: 'test@mail.com', password: '123456')
    @user.confirmed_at = Time.now
    @user.skip_confirmation!
    @user.confirm
    @user.save

    @payment = Payment.create(name: 'Food Payment', amount: 125, user_id: @user.id)
  end

  it 'can be created with valid inputs' do
    expect(@payment.valid?).to be_truthy
  end

  it "can't be created without name" do
    @payment2 = Payment.new(amount: 125, user_id: @user.id)

    expect(@payment2.valid?).to be_falsey
  end

  it "can't be created without amount" do
    @payment2 = Payment.new(name: 'Food Payment', user_id: @user.id)

    expect(@payment2.valid?).to be_falsey
  end

  it "can't be created without user_id" do
    @payment2 = Payment.new(name: 'Food Payment', amount: 125 )

    expect(@payment2.valid?).to be_falsey
  end
end
