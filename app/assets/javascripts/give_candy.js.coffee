jQuery ->
  $('form.give_candy').ajaxForm
    beforeSubmit: (a, $form, options) ->
      $form.children('.badge').html(parseInt($form.children('.badge').html(), 10)+1)
      $form.children('button').remove();

jQuery ->
  $("#facebook_login").click (e)->
    e.preventDefault()
    FB.login (r) ->
