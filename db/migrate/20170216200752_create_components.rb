class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.string :name
      t.string :serial_number
      t.text :description
      t.integer :service_id

      t.timestamps
    end
  end
end
