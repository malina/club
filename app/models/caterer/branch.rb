class Caterer::Branch
  include Mongoid::Document
  
  field :name, type: String
  field :phone, type: String
  field :address, type: String
  field :pickup_available, type: Boolean
  field :pickup_discount, type: Integer
  
  embedded_in :caterer
end
