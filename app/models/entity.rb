class Entity < ApplicationRecord
  validates :name, :amount, :categories, presence: true
  validates :amount, numericality: { greater_than: 0 }

  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories
end
