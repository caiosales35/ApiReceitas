class Recipe < ApplicationRecord
    validates :category, inclusion: { in: %w(entree desert apettizer snack),
    message: "%{value} is not a valid category" }
    validates :title, :preparation_time, :oven_time, :ingredients, :steps, :category, presence: true
end
