class Component < ActiveRecord::Base
	belongs_to :course
	has_many :marks, :dependent => :destroy
end
