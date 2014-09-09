class Caterer::OperationalPeriod
  include Mongoid::Document
  field :from, type: DateTime
  field :to, type: DateTime

  embedded_in :delivery_zone, class_name: 'Caterer::DeliveryZone'
end
