class Course < ActiveRecord::Base
	has_many :components, :dependent => :destroy
end
