class Caterer::DeliveryZone
  include Mongoid::Document
  
  field :name, type: String
  
  field :delivery_time, type: String, default: 0
  field :minimum_order_value, type: Integer, default: 0
  field :delivery_charge, type: Integer, default: 0
  field :teaser, type: String, default: ''
  
  field :payment_options, type: Hash, default: {}
  field :schedule, type: Hash, default: {}
  field :selected_districts, type: Hash, default: {}
  # as_json
  
  before_save :attach_districts
  
  def attach_districts
    self.district_ids = selected_districts.values
  end
  
  has_and_belongs_to_many :districts
  embedded_in :caterer
end
