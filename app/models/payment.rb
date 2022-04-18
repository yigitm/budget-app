class Payment < ApplicationRecord
  belongs_to :user
  has_many :group_payments, dependent: :destroy
  has_many :groups, through: :group_payments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :amount, numericality: { greater_than: 0, less_than: 1_000_000 }
end
