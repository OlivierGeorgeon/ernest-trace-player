function StreamSelector(div_id, noticeDiv_id, baseURI, tracePlayeInfos, configEditor)
{
	this.baseURI = baseURI;
	this.div = $('#' + div_id);
	this.notice_div = $('#' + noticeDiv_id);
	this.tpInfos = tracePlayeInfos;
	this.currentPlayer = null;
	this.currentStream = null;
	this.autoLast = false;
	this.configEditor = configEditor;
	this.reloadProgrammed = false;
	
	this.reload = function()
	{
		this.reloadProgrammed = false;
		
		$.ajax({
			url: this.baseURI + '/php/streamList.php',
			context: this,
			success: function(data){
				this.div.html(data);
				this.relink();
				if(!this.reloadProgrammed)
				{
					this.reloadProgrammed = true;
					setTimeout(parametrizeCallback(this.reload, {scope: this}), 5000);
				}
			},
			dataType: "text",
			async: true
		});
		
	}
	
	this.relink = function()
	{
		this.div.find('ul li a[title=stream]').each(
				parametrizeCallback(function(index, elem, that)
					{
						var name = this.parentNode.getAttribute('title');
						//this.addEventListener("click",
						this.onclick = parametrizeCallback(function(e, name)
								{
									this.changeStream(name, "stream");
								},
								{scope: that, args: [name]}
							)
						//)
						;
					},
					{args: [this]}
				)
			);

		this.div.find('ul li a[title=stored]').each(
				parametrizeCallback(function(index, elem, that)
					{
						var name = this.parentNode.getAttribute('title');
						//this.addEventListener("click",
						this.onclick = parametrizeCallback(function(e, name)
								{
									this.changeStream(name, "storedstream");
								},
								{scope: that, args: [name]}
							)
						//)
						;
					},
					{args: [this]}
				)
			);
		
		this.div.find('ul li a[title=delete-stored]').each(
				parametrizeCallback(function(index, elem, that)
					{
						var name = this.parentNode.getAttribute('title');
						//this.addEventListener("click",
						this.onclick = parametrizeCallback(function(e, name)
								{
									this.deleteStored(name, "storedstream");
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
	
	this.cleanPlayer = function()
	{
		if(this.currentPlayer !== null)
		{
			this.currentPlayer.cleanup();
			$('#' + this.tpInfos.div_id).empty();
			this.currentPlayer = null;
		}
	}
	
	this.changeStream = function(name, handler)
	{
		this.notice_div.prepend("Now playing " + name + ".<br/>");
		this.cleanPlayer();
		
		this.currentStream = name;
		
		this.currentPlayer = new TracePlayer2(
			this.tpInfos.div_id, 
			this.tpInfos.notice_div_id,
			this.tpInfos.pipeline, 
			handler,
			name,
			"",
			this.baseURI);
		
		if(this.configEditor !== null)
		{
			this.currentPlayer.onPlaying = parametrizeCallback(this.configEditor.playing, {scope: this.configEditor});
			this.currentPlayer.onStopped = parametrizeCallback(this.configEditor.stopped, {scope: this.configEditor});
		}
		this.currentPlayer.start();
		
		this.currentPlayer.onEOT = parametrizeCallback(this.onEOT, {scope: this});
	}
	
	this.deleteStored = function(name, type)
	{
		$.post(baseURI + "/php/streamDelete.php", {traceId: name});
		this.reload();
	}
	
	this.setAutoLast = function(auto)
	{
		try{
		if(this.autoLast != auto)
		{
			this.autoLast = auto;
			
			if(this.autoLast == true)
				this.playLast();
		}
		}catch (e) {
			alert(e);
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
						this.changeStream(lastTrace, "stream");
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