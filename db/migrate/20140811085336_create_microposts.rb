class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.date :start_dt
      t.string :title
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
