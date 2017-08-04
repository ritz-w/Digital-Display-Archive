class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :comments
  validate :password_complexity
   def password_complexity
      if password.present? and not password.match(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/)
          errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
      end
   end
end