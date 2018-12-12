class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise	:database_authenticatable,
  				:registerable,
        	:recoverable,
        	:rememberable,
        	:trackable,
        	:validatable,
        	:omniauthable


  has_many :events
  has_many :comment
  has_many :notification
  has_many :follows





end
