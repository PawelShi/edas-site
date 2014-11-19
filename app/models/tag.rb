class Tag < ActiveRecord::Base

	validates_presence_of :name, :message => "can't just be blank"

	# Связь с проектами
	has_and_belongs_to_many :projects
	
	
	attr_accessor :raise_exception
  
  	after_save :raise_exception_if_needed

  def raise_exception_if_needed
    if @raise_exception.to_i == 1
      raise 'Oh noes!'
    end
  end


end
