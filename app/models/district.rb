class District
  include Mongoid::Document
  
  field :_id, type: String, default: ->{  name.parameterize  }
  
  field :name, type: String
  belongs_to :city
  has_many :destinations
end
