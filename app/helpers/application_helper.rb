

module ApplicationHelper
	# require "img_helper"

	def page_title
		unless @current_page.nil?
			@current_page[:title]
		else
			'nil'
		end

	end

	def nav_active(logic, name, url)
		result = '<li '
		# puts "nav_active: logic=#{logic} (#{params[:action]})| name=#{name}| url=#{url}"
		# <li <%= nav_active('about')%> ><%= link_to 'О КОМПАНИИ |', about_path %></li>

		result = result + "class=active" if logic == params[:action]
		result = result + '>' + link_to(name, url) + '</li>'
		# result = "class=active" if logic == params[:action]
		raw(result)
	end

	def markdown(text)

		doc = my_parse(text)
		# puts doc
		raw(doc)

		# renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
  #   	options = {
  #       	autolink: true,
  #       	no_intra_emphasis: true,
	 #        fenced_code_blocks: true,
	 #        lax_html_blocks: true,
	 #        strikethrough: true,
	 #        superscript: true,
	 #        space_after_headers: true
  #   	}
  #   	Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  	end

  	def tag_used(tag_id)
  		
  		Tag.joins("join projects_tags pt on pt.tag_id = tags.id").where(:id => tag_id).count

  	end

  	def get_tags(project)
		# Возвращает список тэгов
		
		project.tags

	end

	def get_tags_str(project)
		
		res = ''
		project.tags.each do |tag|
			res = "#{res} #{tag.name};"
		end
		res
		
	end

	def my_parse(text)
		# Ищем наши вставки в тексте и заменяем
		# TEXT - кусок HTML документа
		# Самая первая вставка - галлерея
		doc = Nokogiri::HTML::DocumentFragment.parse(text)
		# Ищем все элементы с именем gallery
		gals = doc.css("gallery")
		# Проходим по ним
		gals.each do |gal|
			# puts gal
			# читаем параметры галлереи и формируем новую строку
			str = eval("gallery(#{gal.content})")
			# поученную строку HTML преобразуем в структурированный фрагмент Nokogiri
			sub_doc = Nokogiri::HTML::DocumentFragment.parse(str)
			# меняем имя элемента на div и добавляем ему класс
			# puts gal.name
			gal.name="div"
			gal['class'] = 'container-fluid'
			# Уничтожаем контент, что-бы не светился
			gal.content = ''
			# Привязываем новую структуру как вложение к элементу Gallery
			sub_doc.parent = gal
		end

		icons = doc.css("icon")
		icons.each do |icon|
			# puts "Icon.name=#{icon.name}"
			str = eval("icon(#{icon.content})")
			# puts str
			sub_doc = Nokogiri::HTML::DocumentFragment.parse(str)
			# puts sub_doc
			# puts sub_doc.name
			icon.name='img'
			# puts sub_doc['src']
			# icon['class'] = ''
			icon.content = ''
			icon['src'] = sub_doc['src']
			# puts icon
			# sub_doc.parent = icon
		end


		doc.to_html
	end

	def icon(path)
		# создание иконки
		size = nil
		if size.nil?
			"<img src='#{path}'>"
		else
			"<img src='#{path}'>"
		end
	end

	def gallery(path, gallery_name, count, cols)
		# Создание галереи
		pref="<h3 class='clr-brand'>#{gallery_name}</h3>"
		# puts path

		if (cols > 0) and (count > cols)
		
			# Проходим по числу изображений
			curr_row = 0 
			# строка текущая
			str = "<div class='row'>"
			# puts "count:#{count}"
			count.times do |num|
				# puts "num:#{num}"
				# str = "#{str} <img src='#{path}/240/img_#{num+1}.jpg' alt='...' class='img-thumbnail'>"
				a_str = "<img src='#{path}/240/img_#{num+1}.jpg' >"
				a_str = "<a href='#{path}/1024/img_#{num+1}.jpg' class='thumbnail'>#{a_str}</a>"
				a_str = "<div class=col-xs-8 col-md-8'> #{a_str}</div>"
				str ="#{str}#{a_str}"

				next_row = (num+1)/cols
				# puts "num = #{num} | cur = #{curr_row} | next = #{next_row}"
				# если следующая строка будет новая - вставить нужно
				if next_row>curr_row 
					str = "#{str}</div><div class='row'>"
					curr_row = next_row
				end
			end
			unless (count/cols)>curr_row
				str = "#{str}</div>"
			end

			
		end
        # puts str
		res ="#{pref}#{str}"
		# puts res
		res
	end
	
end
