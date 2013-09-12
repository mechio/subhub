(function() {
  chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
    var repo, xhr;
    if (repo = request.clone) {
      console.log("Cloning " + repo + " ...");
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
      xhr.always(function() {
        console.log("Complete");
        return sendResponse({});
      });
    }
    return true;
  });

}).call(this);
