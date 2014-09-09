class Order
  include Mongoid::Document
  
  
  # Review section
  field :review, type: String
  field :cuisine_is_ok, type: Boolean, default: true
  field :delivery_is_ok, type: Boolean, default: true
  field :service_is_ok, type: Boolean, default: true
  field :caterer_comment, type: String
  field :administration_comment, type: String
  
  belongs_to :destination
  belongs_to :person
  belongs_to :caterer
end
