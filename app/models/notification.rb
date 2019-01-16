class Notification < ApplicationRecord
	belongs_to :user
	belongs_to :notified_by, class_name: "User"
	belongs_to :event
	belongs_to :comment, optional: true
	belongs_to :join, optional: true
end
