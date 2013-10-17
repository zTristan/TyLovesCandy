$(document).ready(function(){
  function callFB(){
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '636750786375852', // App ID
      channelURL : '//tylovescandy.com/channel.html', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      oauth      : true, // enable OAuth 2.0
      xfbml      : true
    });

  };

  (function(d){
    var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
    js = d.createElement('script'); js.id = id; js.async = true;
    js.src = "//connect.facebook.net/en_US/all.js";
    d.getElementsByTagName('head')[0].appendChild(js);
  }(document));     
}
});

function loginClick(){
   // your click handling code in here
}