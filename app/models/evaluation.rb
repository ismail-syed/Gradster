class Evaluation < ActiveRecord::Base
	belongs_to :component
	validates :mark, presence: true

	def average_evaluation_mark
		self.class.average(:mark).where(:component_id => self.component_id)
	end
end
