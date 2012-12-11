class Ability
  include CanCan::Ability
  

  def current_ability
    @current_ability ||= Ability.new(current_person)
  end

  def initialize(person)
    # Define abilities for the passed in user here. For example:
    #
       person ||= Person.new # guest user (not logged in)
       if person.admin?
         can :manage, :all
         can :access, :rails_admin   # grant access to rails_admin
         can :dashboard              # grant access to the dashboard

       else
         #can :read, Hookup
         can :create, Hookup
         can :create, Person
         #can :manage, Hookup
         
       end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
