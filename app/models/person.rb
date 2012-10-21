class Person < ActiveRecord::Base
  has_many :hookups
  validates :name, presence: true, uniqueness: true
  attr_accessible :name
  
end
