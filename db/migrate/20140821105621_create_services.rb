class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name, limit: 30
      t.text :content
      t.integer :sort

      t.timestamps
    end
    add_index :services, :name, unique: true
  end
end
