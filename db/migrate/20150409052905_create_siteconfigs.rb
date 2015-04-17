class CreateSiteconfigs < ActiveRecord::Migration
  def change
    create_table :siteconfigs do |t|
      t.string :name, limit: 50
      t.text :value

      t.timestamps
    end
  end
end
