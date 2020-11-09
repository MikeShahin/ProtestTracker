class CreateProtests < ActiveRecord::Migration[6.0]
  def change
    create_table :protests do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :date
      t.string :time
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
