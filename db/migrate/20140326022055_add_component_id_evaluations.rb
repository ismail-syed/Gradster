class AddComponentIdEvaluations < ActiveRecord::Migration
  def change
  	add_column :evaluations, :component_id, :integer
  end
end
