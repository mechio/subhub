(function() {
  var button, doClone;

  $('head').append("<style type=\"text/css\">\n  .sidebar-button.loading * {\n    display: none;\n  }\n  .sidebar-button.loading,\n  .sidebar-button.loading:hover,\n  .sidebar-button.loading:active {\n    background-image: url(https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-16px.gif?8c695afe);\n    background-position: 50% 50%;\n    background-repeat: no-repeat;\n    height: 24px;\n    background-color: #EAEAEA;\n    box-shadow: none;\n    border: 1px solid #C5C5C5;\n  }\n</style>");

  button = $("<a href=\"#\" class=\"minibutton sidebar-button\" title=\"Open this repository in Sublime Text 3\" rel=\"nofollow\">\n  <span class=\"octicon octicon-link-external\"></span><span>Open in Sublime</span>\n</a>");

  $(".repository-sidebar .only-with-full-nav").append(button);

  button.on('click', function(e) {
    var repo;
    if (!button.hasClass('loading')) {
      repo = $("div[data-protocol-type='ssh'] .js-url-field").val();
      doClone(repo);
    }
    return e.preventDefault();
  });

  doClone = function(repo) {
    var xhr;
    button.addClass('loading');
    xhr = $.ajax({
      type: 'POST',
      url: 'http://localhost:48666',
      data: JSON.stringify({
        url: repo
      }),
      dataType: 'text'
    });
    xhr.fail(function() {
      return console.error("Error cloning " + repo);
    });
    return xhr.always(function() {
      return button.removeClass('loading');
    });
  };

}).call(this);
