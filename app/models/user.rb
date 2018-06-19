class User < ActiveRecord::Base
  has_secure_password
  has_many :permissions, dependent: :destroy
  has_many :convoy_plans, dependent: :destroy
  has_many :convoys_supporting, through: :permissions, source: :convoy_plan
 

  PASSWORD_REGEX2=/\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x

  # /\A
#   (?=.{8,})          # Must contain 8 or more characters
#   (?=.*\d)           # Must contain a digit
#   (?=.*[a-z])        # Must contain a lower case character
#   (?=.*[A-Z])        # Must contain an upper case character
#   (?=.*[[:^alnum:]]) # Must contain a symbol
# /x
   
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :user_name, presence: true, length: { in: 2..30 }  #, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, confirmation: true, format: { with: PASSWORD_REGEX2 }

  
  # def full_name #Custom Class and Instance Methods
  #   "#{self.first_name} #{self.last_name}"
  # end
  
  # # creating a custom class method. self refers to the User model
  # def self.average_age
  #     self.sum(:age) / self.count
  # end
  

  
  

  before_save :downcase_email
  # after_update :successfully_updated
  # after_create :successfully_created

  private
    def downcase_email
      self.email.downcase!
    end
    # def successfully_created
    #   puts "Successfully created a new user"
    # end
    # def successfully_updated
    #   puts "Successfully updated a existing user"
    # end
  
  # this callback will run after creating a new user


#-------------------------------------------------Notes Start Here
# -------------------------Bcrypt
# u = User.new(name: 'oscar', email: 'o@gmail.com', password: '', password_confirmation: 'nomatch')
# u.save                                                           # => false, password required
# u.password = 'password'
# u.save                                                           # => false, confirmation doesn't match
# u.password_confirmation = 'password'
# u.save                                                           # => true
# u.authenticate('not password')                                   # => false
# u.authenticate('password')                                       # => user instance
# ## putting it all together
# User.find_by_email('o@gmail.com').try(:authenticate, 'password') # => user instance
# User.find_by_email('o@gmail.com').try(:authenticate, 'not')      # => false
# User.find_by_email('not@il.com').try(:authenticate, 'password')  # => false
end
