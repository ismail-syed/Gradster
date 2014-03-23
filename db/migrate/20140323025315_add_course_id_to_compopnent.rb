class AddCourseIdToCompopnent < ActiveRecord::Migration
  def change
    add_column :compopnents, :course_id, :integer
  end
end
