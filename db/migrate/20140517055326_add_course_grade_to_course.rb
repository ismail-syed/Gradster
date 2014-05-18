class AddCourseGradeToCourse < ActiveRecord::Migration
  def change
  	add_column :courses, :grade, :integer, :default => 0
  end
end
