class Component < ActiveRecord::Base
	belongs_to :course
	has_many :evaluations, :dependent => :destroy
	accepts_nested_attributes_for :evaluations, :allow_destroy => true, reject_if: proc { |attributes| attributes['mark'].blank? }
	validates :name, presence: true
	validates :component_weight, presence: true
end
