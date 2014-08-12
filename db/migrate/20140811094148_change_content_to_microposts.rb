class ChangeContentToMicroposts < ActiveRecord::Migration
  def change
  	change_table :microposts do |f|
  		f.remove :content
  		f.text :content

  	end
  	
  end
end
