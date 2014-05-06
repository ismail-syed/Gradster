class Course < ActiveRecord::Base
	has_many :components, :dependent => :destroy
	belongs_to :users

	# VALIDATIONS
	validates :name, presence: true
end
