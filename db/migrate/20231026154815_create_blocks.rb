class CreateBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :blocks do |t|
      t.references :session, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end

    # Adding uniqueness constraint for the couple name and session_id
    add_index :blocks, [:name, :session_id], unique: true
  end
end
