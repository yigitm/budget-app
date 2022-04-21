class Group < ApplicationRecord
  belongs_to :user
  has_many :group_payments, dependent: :destroy
  has_many :payments, through: :group_payments, dependent: :destroy, foreign_key: :group_id

  validates :name, presence: true, length: { minimum: 3 }

  def total_payment(category)
    category.payments.sum(:amount)
  end
end
