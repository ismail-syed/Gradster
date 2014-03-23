class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.timestamps
    end

   create_table :components do |t|
      t.belongs_to :course
      t.timestamps
    end 

  end
end
