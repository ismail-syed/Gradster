class Course < ActiveRecord::Base
	belongs_to :users
	has_many :components, :dependent => :destroy
	accepts_nested_attributes_for :components, allow_destroy: true

	# VALIDATIONS
	validates :name, presence: true
end
