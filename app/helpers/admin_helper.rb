module AdminHelper

	def nsi_getName(nsi_name, padeg)
		# Возвращает имя справочника
		# padeg - :ip - именительный, :dp - дательный, :rp - родительный
		case nsi_name
		when :micropost 
			case padeg
				when :ip then 'новость'
				when :dp then 'новости'
				when :rp then 'новость'
				else 'новостей'
			end
		when :user 
			case padeg
			when :ip then 'пользователь'
			when :dp then 'пользователю'
			when :rp then 'пользователя'
			else 'пользователей'
			end
		when :service 
			case padeg
			when :ip then 'услуга'
			when :dp then 'услуге'
			when :rp then 'услугу'
			else 'услуг'
			end
		when :project 
			case padeg
			when :ip then 'проект'
			when :dp then 'проекту'
			when :rp then 'проект'
			else 'проектов'
			end
		when :tag
			case padeg
			when :ip then 'тэг'
			when :dp then 'тэгу'
			when :rp then 'тэга'
			else 'тэг'
			end
		else '<безымянный>'
		end

	end


	def nsi_getTitle_navbar (action, nsi_name)
		#
		# В именительном падеже
		name = nsi_getName nsi_name, :ip
		# В дательном падеже
		name_dat = nsi_getName nsi_name, :dp

		name_rp = nsi_getName nsi_name, :rp

		name_more = nsi_getName nsi_name, :more

		case action
			when 'index' 	
				"Список #{name_more}"
			when 'edit'		
				"Изменить #{name}"
			when 'new'
				"Создать #{name_rp}"
			when 'show'
				"Просмотр #{name_rp}"
			else name_more
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

	# def nsi_visible_btn(btn_action)
	# 	# возвращает труе или фальсе если кнопка выводится
	# 	case params[:action]
	# 	when :show	
	# 		case btn_action 
	# 			when :show then	true
	# 			else false
	# 			end

	# 	end
	# end

	def nsi_path(nsi_name, path, pars)
		# Возвращает путь для справочника
		pref = case path
		when :new
			'new_admin_'
		when :show, :list
			'admin_'
		when :edit
			'edit_admin_'
		else 'admin_'
		end
		suff = case path
		when :new,:edit,:show
			'_path'
		when :list
			's_path'

		else ''
			
		end
		case path 
		when :show, :edit then
		  "#{pref}#{nsi_name.to_s}#{suff}(#{pars[:id]})"	
		else 
		  "#{pref}#{nsi_name.to_s}#{suff}"
		end
	end

	def nsi_name
		@current_page[:model].name.downcase.to_sym
	end

	def nsi_navbar(nsi_name )
		# Выводит строку с панелью управлеия справочником
		str ="<div class='navbar navbar-default'>
		<div class='navbar-brand'>
			#{nsi_getTitle_navbar params[:action], nsi_name}
		</div>"
		str2 = case params[:action].to_sym
				when :index 
					"#{link_to('Добавить', eval(nsi_path(nsi_name, :new, params)), 
		  			:class=>'btn btn-default navbar-btn')}"
				when :show
					"#{link_to('Добавить', eval(nsi_path(nsi_name, :new, params)), 
		  			:class=>'btn btn-default navbar-btn')}
					#{link_to('Изменить', eval(nsi_path(nsi_name, :edit, params)), 
					:class=>'btn btn-default navbar-btn')}

					#{link_to('К списку', eval(nsi_path(nsi_name, :list, params)), 
					:class=>'btn btn-default navbar-btn')}"
				when :edit, :new
					"#{link_to('К списку', eval(nsi_path(nsi_name, :list, params)), 
					:class=>'btn btn-default navbar-btn')}"
				else "#{link_to(params[:action], '#', 
					:class=>'btn btn-default navbar-btn')}"
				end

		
		
		# #{link_to('Просмотр', eval(nsi_path(nsi_name, :show, params)), 
		# 			:class=>nsi_get_btn_class_navbar(params[:action], 'show'))}

		str3 = "#{link_to 'В администрирование', admin_root_path, :class => 'btn btn-default navbar-btn pull-right'}"
		raw("#{str}#{str2}#{str3}</div>")
		
	end

	
end
	