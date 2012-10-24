class Person < ActiveRecord::Base
  has_many :hookups
  validates :name, presence: true, uniqueness: true
  attr_accessible :name, :age, :building, :gender, :school, :id
  
end
