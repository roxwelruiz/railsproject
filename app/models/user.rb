class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

	has_many :orders
	has_many :comments

	def timeout_in
		return 30.minutes if admin?
		15.minutes
	end
end
