jQuery ->
  $("#facebook_login").click (event)->
    event.preventDefault()
    FB.login (response) ->
      if (response.authResponse) 
        $(".form-signin").ajaxSubmit

jQuery ->
  $.ajaxSetup({ cache: true })
  $.getScript '//connect.facebook.net/en_UK/all.js', ->
    FB.init({
      appId: '636750786375852',
      channelUrl: '//tylovescandy.com/channel.html',
    })
    FB.getLoginStatus()