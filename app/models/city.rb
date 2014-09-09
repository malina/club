class City
  include Mongoid::Document
  
  field :_id, type: String, default: ->{  name.parameterize  }
  
  field :name, type: String
  
  
  has_many :destinations
  has_many :caterers
  has_many :districts
end
