class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.integer :component_weight
      t.timestamps
    end

     create_table :components do |t|
      t.belongs_to :course
      t.timestamps
    end

  end
end
