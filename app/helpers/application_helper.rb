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
end
