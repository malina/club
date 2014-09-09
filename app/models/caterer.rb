class Caterer
  include Mongoid::Document
  
  after_create :create_default_delivery_zone, :create_gen
  
  field :name, type: String
  field :response_time, type: Integer
  field :about, type: String
  
  mount_uploader :avatar, AvatarUploader
  def avatar_url;   avatar.url    ;end
  
  
  def as_json(options={})
    options[:methods] ||= []
    options[:include] ||= []
    
    options[:methods] << :avatar_url
    options[:methods] << :minimum_order_value
    options[:methods] << :delivery_charge
    options[:methods] << :teaser
    options[:methods] << :delivery_time
    
    options[:include] << :cuisines
    
    super(options)
  end
  
  def delivery_time
    default_delivery_zone.delivery_time
  end
  
  def minimum_order_value
    default_delivery_zone.minimum_order_value
  end
  
  def delivery_charge
    default_delivery_zone.delivery_charge
  end
  
  def teaser
    default_delivery_zone.teaser
  end
  
  def payment_options
    default_delivery_zone.payment_options
  end
  
  embeds_many :delivery_zones, class_name: 'Caterer::DeliveryZone'
  embeds_one :default_delivery_zone, class_name: 'Caterer::DeliveryZone'
  embeds_many :branches, class_name: 'Caterer::Branch'
  embeds_one :gen, class_name: 'Caterer::Gen'
  has_one :menu, class_name: 'Caterer::Menu'

  has_and_belongs_to_many :cuisines
  belongs_to :city
  has_many :orders
end
