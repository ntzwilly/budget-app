class Category < ApplicationRecord
  validates :name, :icon, presence: true
  belongs_to :user
  has_and_belongs_to_many :entities

  def amount
    entities.sum('amount')
  end
end
