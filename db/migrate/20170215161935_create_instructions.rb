class CreateInstructions < ActiveRecord::Migration[5.0]
  def change
    create_table :instructions do |t|
      t.string :name
      t.text :link
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
