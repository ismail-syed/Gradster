class AddCourseIdToComponents < ActiveRecord::Migration
  def change
  	add_column :components, :course_id, :integer
  end
end
