class Hookup < ActiveRecord::Base
  belongs_to :person_a, class_name: "Person"
  belongs_to :person_b, class_name: "Person"
  validates :person_a, :presence => true
  validates :person_b, :presence => true
  validate :different_people
  
  accepts_nested_attributes_for :person_a
  accepts_nested_attributes_for :person_b

  private
  def different_people
    errors[:person_b] << "Can't have two of the same user" unless person_a_id != person_b_id
  end
  
end
