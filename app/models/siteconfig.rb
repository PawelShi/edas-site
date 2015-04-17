class Siteconfig < ActiveRecord::Base
	
	validates :name, presence: true

end
