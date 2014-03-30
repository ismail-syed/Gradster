class Course < ActiveRecord::Base
	has_many :components, :dependent => :destroy

	# VALIDATIONS
	validates :name, presence: true
end
