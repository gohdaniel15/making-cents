// connects to the session
$(document).ready(function(){
	if(session != undefined) {
		session.disconnect();
	}

	if($('.consultant-video').length > 0){
		var session = OT.initSession(apiKey, sessionId);
	
		session.connect(token, function(error){
			if(!error) {
				// initPublisher(id of DOM element, options)
				var publisher = OT.initPublisher('publisher', {
					insertMode: 'append',
					width: '100%',
					height: '100%'
				});
	
				// publish to the session
				session.publish(publisher);
			} else {
				$('#video-error-msg').addClass('alert-danger').text('There was an error connecting to the session. Please try again.');
				console.log('There was an error connecting to the session:', error.code, error.message);
			}
		});

		// subscribe to a newly created stream
		session.on({
			streamCreated: function(event){
				session.subscribe(event.stream, 'subscriber', {
					insertMode: 'append',
					width: '100%',
					height: '100%'
				});
			}
		});
	}
});