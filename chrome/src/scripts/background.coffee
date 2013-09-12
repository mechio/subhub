chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
  if repo = request.clone
    console.log "Cloning #{repo} ..."

    xhr = $.ajax(
      type     : 'POST'
      url      : 'http://localhost:48666'
      data     : JSON.stringify(url: repo)
      dataType : 'text' 
    )
    
    xhr.fail ->
      console.error "Error cloning #{repo}"

    xhr.always ->
      console.log "Complete"
      sendResponse({})
  
  true