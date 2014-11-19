class CreateProjectsTagsJoinTable < ActiveRecord::Migration
  def change
    create_table :projects_tags, id: false do |t|
      t.integer :project_id
      t.integer :tag_id
    end
 
    add_index :projects_tags, :project_id
    add_index :projects_tags, :tag_id
  end
end