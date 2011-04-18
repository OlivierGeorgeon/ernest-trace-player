//TODO: Send feedback about connection state to the tracePlayer for awareness purpose.
// Is it possible to do that correctly with this comet library ?
//TODO: Use a better comet library or make one.
function StreamControler(tracePlayer, streamBaseURL, urlOptions)
{
	this.baseURL = streamBaseURL;
	this.tracePlayer = tracePlayer;
	this.streamTime = "";

	var url = streamBaseURL + "?";
	for(option in urlOptions) {
		if(option !== "")
			url += encodeURIComponent(option) + "=" + encodeURIComponent(urlOptions[option]) + "&";
	}
	
	this.url = url;
	this.streaming = false;
	this.paused = false;
	this.stream = null;
	this.buffer = [];
	
	this.startStreaming = function(urlOptions)
	{
		var suppOption = "";
		for(option in urlOptions) {
			suppOption += encodeURIComponent(option) + "=" + encodeURIComponent(urlOptions[option]) + "&";
		}
		var url = this.url + suppOption;
		url = url + "lastKnownTime=" + this.streamTime;
		
		if(! this.streaming)
		{
			this.streaming = true;

			if(! this.stream)
			{
				this.stream = pi.comet.get(
					url,
					parametrizeCallback(function(_response){ this.onStreamElement(_response); }, {scope: this}),
					parametrizeCallback(function(suppOption){
						if(this.streaming)
						{
							this.stream.abort();
							if(this.streaming)
							{
								this.startStreaming(suppOption);
							}
						}
					}, {scope: this, args: [suppOption]})  
				);
			}else{
				this.stream.environment.setUrl(url);
				this.stream.send();
			}
			
			this.tracePlayer.notifyUser("Streaming initiated.");
		}
	}

	this.stopStreaming = function()
	{
		if(this.streaming)
		{
			this.streaming = false;
			this.stream.abort();
			this.tracePlayer.notifyUser("Streaming stopped.");
		}
	}
	
	this.pauseStreaming = function()
	{
		if(this.paused)
		{
			for(key in this.buffer)
			{
				this.tracePlayer.processMessage(this.buffer[key]);
			}
			this.buffer = [];
			this.tracePlayer.notifyUser("Streaming unpaused.");
		}else{
			this.paused = true;
			this.tracePlayer.notifyUser("Streaming paused.");
		}
	}
	
	this.onStreamElement = function(element)
	{
		if(! this.paused)
		{
			this.tracePlayer.processMessage(element);
		}else{
			this.buffer.push(element);
		}
		 
	}
	
	this.setStreamTime = function(clock)
	{
		this.streamTime = clock;
	}
	
}