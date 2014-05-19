class AddCourseGradeToCourse < ActiveRecord::Migration
  def change
  	add_column :courses, :grade, :float, :default => 0.0
  end
end
