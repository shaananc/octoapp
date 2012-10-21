class Hookup < ActiveRecord::Base
  belongs_to :person
  
  validates :person, :presence => true
  accepts_nested_attributes_for :person
  

  
end
