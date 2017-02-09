class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.text :link
      t.text :description
      t.integer :service_id
      t.integer :user_id

      t.timestamps
    end
  end
end
