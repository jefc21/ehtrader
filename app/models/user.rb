class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => {email: true, login: false}

  has_many :contract, dependent: :destroy
  has_one :user_role, dependent: :destroy

  
end
