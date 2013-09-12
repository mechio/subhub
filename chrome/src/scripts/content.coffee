#
# Add Styles
#
$('head').append("""
  <style type="text/css">
    .sidebar-button.loading * {
      display: none;
    }
    .sidebar-button.loading,
    .sidebar-button.loading:hover,
    .sidebar-button.loading:active {
      background-image: url(https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-16px.gif?8c695afe);
      background-position: 50% 50%;
      background-repeat: no-repeat;
      height: 24px;
      background-color: #EAEAEA;
      box-shadow: none;
      border: 1px solid #C5C5C5;
    }
  </style>
""")

#
# Create the button
#
button = $("""
<a href="#" class="minibutton sidebar-button" title="Open this repository in Sublime Text 3" rel="nofollow">
  <span class="octicon octicon-link-external"></span><span>Open in Sublime</span>
</a>
""")

$(".repository-sidebar .only-with-full-nav").append(button)

button.on 'click', (e) ->
  unless button.hasClass('loading')
    repo = $("div[data-protocol-type='ssh'] .js-url-field").val() || $("div[data-protocol-type='http'] .js-url-field").val()    
    button.addClass('loading')
    chrome.runtime.sendMessage {clone: repo}, (response) ->
      button.removeClass('loading')

  e.preventDefault()