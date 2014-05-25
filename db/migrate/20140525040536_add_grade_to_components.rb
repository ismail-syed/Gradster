class AddGradeToComponents < ActiveRecord::Migration
  def change
    add_column :components, :grade, :float, :default => 0.0
  end
end
