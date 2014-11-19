class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, limit: 100
      t.text :body

      t.timestamps
    end
    add_index :projects, :name, unique: true
  end
end
