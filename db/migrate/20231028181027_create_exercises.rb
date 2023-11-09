class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.references :block, null: false, foreign_key: true
      t.string :name, null: false
      t.text :comment
      t.string :reps, null: false
      t.integer :weight

      t.timestamps
    end
  end
end
