jQuery ->
  $('#myTab a').click = (e) ->
    e.preventDefault()
    $(this).tab('show')

jQuery ->
  $('#myTab a:first').tab('show')

jQuery ->
  $('#new_upload').fileupload
    dataType: "script"
    add: (e, data) ->
      file = data.files[0]
      data.context = $(tmpl("template-upload", file))
      $('#new_upload').append(data.context)
      data.submit()
      console.log(data)
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
    done: (e, data) ->
      if data.context
        data.context.remove()
        data.context = null

jQuery ->
  $('.best_in_place').best_in_place()
