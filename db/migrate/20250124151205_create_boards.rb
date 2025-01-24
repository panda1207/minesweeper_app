class CreateBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :email
      t.integer :width
      t.integer :height
      t.integer :mines
      t.text :data

      t.timestamps
    end
  end
end
