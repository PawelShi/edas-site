class PagesController < ApplicationController
  def home
  	@current_page = {title: '', comment: ''}
  end

  def tools
  	@current_page = {title: 'Услуги', 
        comment: ''#Описание всех возможных видов работ, что мы выполняем'
      }
  end

  def projects
  	@current_page = {title: 'Проекты', 
        comment: ''#Список доступных для просмотра проектов.'
      }
  end

  def contacts
  	@current_page = {title: 'Контакты', 
        comment: ''#'Содержит информацию для связи.'
      }
  end
end
