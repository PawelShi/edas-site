class Admin::AdminController < Admin::BaseController
	before_action :alldata, :news_data
	layout 'admin'

  def index
  end
  
  private 
  	def alldata
      @current_page = {model: nil, title: 'Администрирование сайта', comment: ''}
    end

    def news_data
    	@microposts = Micropost.paginate(:page => params[:page], :per_page => 3).order( 'start_dt DESC')
  	end
end
