module ApplicationHelper

	def image_box(img_src, text, url)
		str = '<div class="thumbnail noborder nopadding">' +
            image_tag(img_src, width: "100%" ) +
            '<div class="caption">
              <h5 class="text-center">' + text + '</h5>
            </div>
          </div>'
        
        link_to(raw(str),url)
	end

	def page_title
		unless @current_page.nil?
			@current_page[:title]
		else
			'nil'
		end

	end

	def nav_active(logic)
		result = ''
		result = "class=active" if logic == params[:action]
		result
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
		# 
		gals = doc.css("gallery")
		gals.each do |gal|
			# читаем параметры галлереи
			str = eval("gallery(#{gal.content})")
			# puts str
			sub_doc = Nokogiri::HTML::DocumentFragment.parse(str)
			# меняем
			gal.name="div"
			gal['class'] = 'container-fluid'
			gal.content = ''
			sub_doc.parent = gal
		end
		doc.to_html
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
				str = "#{str} <img src='#{path}/240/img_#{num+1}.jpg' alt='...' class='img-thumbnail'>"

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
