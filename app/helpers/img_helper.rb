module ImgHelper
# Вывод изображений разных
  def slide_view_btn(gallery_nm, img_nm, caption, title)
  		id = "v_modal_#{img_nm.split('.').first}"
  		str =""
  		thumb   = image_tag "/gallery/#{gallery_nm}/240/#{img_nm}", alt: title
      big_img = image_tag("/gallery/#{gallery_nm}/1024/#{img_nm}", size: "100%", alt: title, 
          class: "center-block")
      res = <<-EOF
<div class='thumbnail'>
  #{thumb} 
  <div class='caption'>
    <h5>#{caption}</h5>
    <!-- Button trigger modal -->
    <button class='btn btn-primary' role='button' data-toggle='modal' 
    data-target='##{id}'>Увеличить</button>
  </div>
</div>
<!-- Modal -->      
<div class="modal fade bs-example-modal-lg" id="#{id}" tabindex="-1" role="dialog" aria-labelledby="#{id}_label" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="#{id}_label">#{title}</h4>
      </div>
      <div class="modal-body ">

        #{big_img}
        
      </div>
      
    </div>
  </div>
</div>
EOF
    raw(res)
  end

  def image_box(img_src, text, url)
      str = '<div class="thumbnail noborder nopadding">' +
            image_tag(img_src, width: "100%" ) +
            '<div class="caption">
              <h5 class="text-center">' + text + '</h5>
            </div>
          </div>'
        
      link_to(raw(str),url)
  end

  def slide_view(gallery_nm, img_nm, caption, title)
    id = "v_modal_#{img_nm.split('.').first}"
    str =""
    thumb   = image_tag "/gallery/#{gallery_nm}/240/#{img_nm}", alt: title
    big_img = image_tag("/gallery/#{gallery_nm}/1024/#{img_nm}", size: "100%", alt: title, 
          class: "center-block")
    res = <<-EOF
<div class='thumbnail' data-toggle='modal' data-target='##{id}'>
  #{thumb} 
    <h5>#{caption}</h5>
  
</div>
<!-- Modal -->      
<div class="modal fade bs-example-modal-lg" id="#{id}" tabindex="-1" role="dialog" aria-labelledby="#{id}_label" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="#{id}_label">#{title}</h4>
      </div>
      <div class="modal-body ">

        #{big_img}
        
      </div>
      
    </div>
  </div>
</div>
EOF
    raw(res)
  end

end