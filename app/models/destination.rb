class Destination
  include Mongoid::Document
  
  field :street, type: String
  field :house, type: String
  field :building, type: String
  field :apartment, type: String
  field :porch, type: String
  field :floor, type: String
  field :intercom, type: String

  belongs_to :city
  belongs_to :district
  belongs_to :person

  has_many :orders
end
