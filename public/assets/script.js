$(function(){
	
	// container is the DOM element;
	// userText is the textbox
	
	var container = $("winner")
		userText = $('winner'); 
	
	// Shuffle the contents of container
	container.shuffleLetters();

	// Bind events
	userText.click(function () {
		
	  userText.html("");
	  
	}).bind('keypress',function(e){
		
		if(e.keyCode == 13){
			
			// The return key was pressed
			
			container.shuffleLetters({
				"text": userText.html()
			});
			
			userText.html("");
		}

	}).hide();

	// Leave a 4 second pause

	setTimeout(function(){
		
		// Shuffle the container with custom text
		container.shuffleLetters({
			"text": "Test it for yourself!"
		});
		
		userText.val("type anything and hit return..").fadeIn();
		
	},4000);
	
});

