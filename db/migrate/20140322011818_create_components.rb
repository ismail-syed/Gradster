class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.integer :component_weight
      t.timestamps
    end
  end 

end
