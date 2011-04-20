function StreamSelector(div_id, noticeDiv_id, baseURI, tracePlayeInfos)
{
	this.baseURI = baseURI;
	this.div = $('#' + div_id);
	this.notice_div = $('#' + noticeDiv_id);
	this.tpInfos = tracePlayeInfos;
	this.currentPlayer = null;
	this.currentStream = null;
	this.autoLast = false;
	
	this.reload = function()
	{
		$.ajax({
			url: this.baseURI + '/php/streamList.php',
			context: this,
			success: function(data){
				this.div.html(data);
				this.relink();
			},
			dataType: "text",
			async: false
		});
		
		setTimeout(parametrizeCallback(this.reload, {scope: this}), 5000);
	}
	
	this.relink = function()
	{
		this.div.find('ul li a').each(
			parametrizeCallback(function(index, elem, that)
				{
					var name = this.getAttribute('title');
					//this.addEventListener("click",
					this.onclick = parametrizeCallback(function(e, name)
							{
								this.changeStream(name);
							},
							{scope: that, args: [name]}
						)
					//)
					;
				},
				{args: [this]}
			)
		);
	}
	
	this.changeStream = function(name)
	{
		this.currentStream = name;
		if(this.currentPlayer !== null)
		{
			this.currentPlayer.cleanup();
			$('#' + this.tpInfos.div_id).empty();
			this.currentPlayer = null
			1+1;
		}
		
		this.currentPlayer = new TracePlayer2(
			this.tpInfos.div_id, 
			this.tpInfos.notice_div_id,
			this.tpInfos.pipeline, 
			"stream",
			name,
			"",
			this.baseURI);

		this.currentPlayer.start();
		
		this.currentPlayer.onEOT = parametrizeCallback(this.onEOT, {scope: this});
	}

	this.setAutoLast = function(auto)
	{
		if(this.autoLast != auto)
		{
			this.autoLast = auto;
			
			if(this.autoLast == true)
				this.playLast();
		}
	}
	
	this.playLast = function()
	{
		if(this.autoLast)
		{
			$.ajax({
				url: this.baseURI + '/php/lastStreamedTrace.php',
				context: this,
				success: function(data){
					var lastTrace = data.documentElement.textContent; //TODO 
					if(this.currentStream != lastTrace)
					{
						this.changeStream(lastTrace);
						this.currentPlayer.play();
					}else{
						setTimeout(parametrizeCallback(this.playLast, {scope: this}), 500);
					}
				},
				dataType: "xml",
				async: false
			});
		}
	}
	
	this.onEOT = function()
	{
		if(this.autoLast)
		{
			this.playLast();
		}
	}
	
	this.reload();
}