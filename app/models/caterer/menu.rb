class Caterer::Menu
  include Mongoid::Document
  
  belongs_to :caterer
  embeds_many :dishes, class_name: 'Caterer::Dish'
end
