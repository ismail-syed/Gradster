class Component < ActiveRecord::Base
	belongs_to :course
	has_many :evaluations, :dependent => :destroy

	validates :name, presence: true
	validates :component_weight, presence: true

	

end
