class Cuisine
  include Mongoid::Document
  field :_id, type: String, default: ->{  name.parameterize  }
  field :name, type: String
end
