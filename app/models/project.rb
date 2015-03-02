class Project < ActiveRecord::Base
# Связь с тэгами
	has_and_belongs_to_many :tags

	validates :name, presence: true
	validates :imgurl, presence: true

	accepts_nested_attributes_for :tags, 
	 	:allow_destroy => true, :reject_if => proc { |a| a['name'].blank? }
  

end
