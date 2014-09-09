class Caterer::Ingredient
  include Mongoid::Document
  embedded_in :dish, class_name: 'Caterer::Dish'
end
