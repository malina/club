class Caterer::Gen
  include Mongoid::Document
  
  field :title, type: String
  field :description, type: String
  field :keywords, type: String
  field :footer_title, type: String
  field :footer_text, type: String
  
  embedded_in :caterer
end
