class Caterer::Dish
  include Mongoid::Document
  embedded_in :menu, class_name: 'Caterer::Menu'
  embeds_many :ingredients, class_name: 'Caterer::Ingredient'
end
