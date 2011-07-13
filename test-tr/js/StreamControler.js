//TODO: Use a better comet library or make one.
function StreamControler(tracePlayer, streamBaseURL, urlOptions)
{
	this.baseURL = streamBaseURL;
	this.tracePlayer = tracePlayer;
	this.streamTime = "";
	this.firstRead = true;
	
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
		for(var option in urlOptions) {
			suppOption += encodeURIComponent(option) + "=" + encodeURIComponent(urlOptions[option]) + "&";
		}
		var url = this.url + suppOption;
		url = url + "lastKnownTime=" + this.streamTime;
		if(this.firstRead)
		{
			this.firstRead = false;
			url = url + "&cleanup";
		}
		
		if(! this.streaming)
		{
			this.streaming = true;

			if(! this.stream)
			{
				this.stream = pi.comet.get(
					url,
					parametrizeCallback(function(_response){ this.onStreamElement(_response); }, {scope: this}),
					parametrizeCallback(function(urlOptions){
						if(this.streaming)
						{
							this.tracePlayer.notifyUser("Connection lost.");
							this.streaming = false;
							this.stream.abort();
							this.stream = null;
							this.startStreaming(urlOptions);
						}
					}, {scope: this, args: [urlOptions]})
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
			this.stream = null;
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
	
	this.beforeUnload = parametrizeCallback(
			function(e){
				if(this.streaming)
				{
					this.streaming = false;
					this.stream.abort();
					this.stream = null;
				}
			},
			{scope: this}
		);
	
	window.addEventListener(
		"beforeunload", 
		this.beforeUnload,
		false
	);
	
	this.cleanup = function()
	{
		this.stopStreaming();
		this.tracePlayer = null;
		
		this.baseURL = null;
		this.tracePlayer = null;
		this.streamTime = null;
		
		this.url = null;
		this.buffer = null;
		window.removeEventListener(
			"beforeunload", 
			this.beforeUnload,
			false
		);
		
		this.beforeUnload = null;
	}
	
}