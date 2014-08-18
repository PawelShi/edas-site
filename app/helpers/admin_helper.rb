module AdminHelper
	def nsi_getTitle_navbar (action)
		#
		case action
			when 'index' 	
				'Список новостей'
			when 'edit'		
				'Изменить новость'
			when 'new'
				'Создать новость'
			when 'show'
				'Просмотр новости'
			else 'Новости'
		end
	end

	def nsi_get_btn_class_navbar (action, btn_name)
		# Устанавливает классы для кнопоки навигационной панели
		#btn_name = list, new, edit, show
		#
		result='btn btn-default navbar-btn ' +
		case action
		when 'index'
			case btn_name
			when 'list','edit','show'
				'hidden'
			else ''
			end
		when 'new', 'edit'
			case btn_name
			when 'new', 'edit', 'show'
				'hidden'
			else ''	
			end
		when 'show'
			case btn_name
			when 'new'
				'hidden'
			else ''	
			end
			
		end
			

	end
end
