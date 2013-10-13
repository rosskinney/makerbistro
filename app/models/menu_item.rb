class MenuItem < ActiveRecord::Base
	has_many :recipes
	has_many :ingredients, through: :recipes

	accepts_nested_attributes_for :ingredients
end
