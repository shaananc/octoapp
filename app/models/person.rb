class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :hookups, :foreign_key => "person_a_id"
  validates :name, presence: true, uniqueness: true
  validates :password_confirmation, presence: true
  validate :upenn? 
  attr_accessible :name, :age, :building, :gender, :school, :id, :hookup_ids

  def upenn?
    domain_name =  Mail::Address.new(email).domain
    if !domain_name.nil? && !domain_name.end_with?("upenn.edu")
      errors.add(:email, "This is not a valid UPenn Email Address")
    end
  end

end
