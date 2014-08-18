class AdminController < ApplicationController
	before_action :alldata

  def index
  end
  
  private 
  	def alldata
      @current_page = {title: 'Администрирование сайта', comment: ''}
    end
end
