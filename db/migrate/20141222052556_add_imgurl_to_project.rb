class AddImgurlToProject < ActiveRecord::Migration
  def change
    add_column :projects, :imgurl, :string
  end
end
