class Ingredient < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
