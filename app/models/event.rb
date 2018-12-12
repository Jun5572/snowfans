class Event < ApplicationRecord
	has_many :interests
	has_many :comments

	belongs_to :user
end
