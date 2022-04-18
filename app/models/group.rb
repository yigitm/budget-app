class Group < ApplicationRecord
  belongs_to :user
  has_many :group_payments, dependent: :destroy
  has_many :payments, through: :group_payments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
end