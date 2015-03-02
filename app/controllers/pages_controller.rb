class PagesController < ApplicationController

  before_action :news_data

  def home
  	@current_page = nil
    
  end

  def tools
  	@current_page = {title: 'Услуги', 
        comment: ''#Описание всех возможных видов работ, что мы выполняем'
      }
    # @selected = 1
    @services = Service.all
    unless params[:id].nil?
      @service = Service.find(params[:id])
    end
  end

  def tools_view
    @current_page = {title: 'Услуги', 
        comment: ''#Описание всех видов работ, что мы выполняем'
      }
    @services = Service.all
    @service = Service.find(params[:id])
    render 'tools'
  end

  def projects
  	@current_page = {title: 'Проекты', 
        comment: ''#Список доступных для просмотра проектов.'
      }
      # Какой тэг указан
    @project = params[:project]
    unless @project.nil? 
      @project = Project.find(@project)
    else
      @tag = params[:tag]
      if @tag.nil?
      # Если не указан никакой тэг - берем все
        @projects = Project.all.order(:name)
      else
      # Если есть тэг - выбираем только по нему
        @projects = Project.joins("join projects_tags pt on pt.project_id = projects.id").where('pt.tag_id' => @tag)
      end
      # Применяем постраничный вывод (пагинация)
      @projects = @projects.paginate(:page => params[:page], :per_page => 4).order( 'name DESC')
    end
  end

  def contacts
  	@current_page = {title: 'Контакты', 
        comment: ''#'Содержит информацию для связи.'
      }
  end

  def about
    @current_page = {title: 'О Компании', 
        comment: ''#'Содержит информацию для связи.'
      }
  end

  def news
    @news  = params[:news]
    unless @news.nil? 
      @news = Micropost.find(@news)
    else
      @news = Micropost.first
    end
  end

  def docs
    
  end

  def test
    render action:'contacts'

    MessageMailer.go_message('schis-pm@yandex.ru').deliver
    
    
  end

  private 
  def news_data
    @microposts = Micropost.paginate(:page => params[:page], :per_page => 5).order( 'start_dt DESC')
  end

end
