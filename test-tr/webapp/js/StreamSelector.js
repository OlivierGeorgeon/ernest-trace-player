function StreamSelector(div_id, noticeDiv_id, baseURI, tracePlayeInfos, configEditor)
{
	this.baseURI = baseURI;
	if(div_id != "")
		this.div = $('#' + div_id);
	else
		this.div = null;
	this.notice_div = $('#' + noticeDiv_id);
	this.tpInfos = tracePlayeInfos;
	this.currentPlayer = null;
	this.currentStream = null;
	this.autoLast = false;
	this.configEditor = configEditor;
	this.reloadProgrammed = false;
	
	this.init = function()
	{
		if(this.div !== null)
		{
			this.loadBase();
			this.reload();
		}
	}
	
	this.loadBase = function()
	{
		$.ajax({
			type: "GET",
			url: this.baseURI + "/html/baseStreamList.html",
			context: this,
			success: function(data) {
				this.div.html(data);
				this.ulForm = this.div.find('form');
				this.ulSubmit = this.ulForm.find("input[type='submit']");
				this.ulAware = this.div.find("span[title='upload-awareness']");
				this.ulIframe = this.div.find("iframe");
				this.apl = this.div.find("input[name='auto-last']");
				this.apl.change(parametrizeCallback(
							function(e, that) {
								that.changeAutoStream(this);
							}, {args: [this]}
						)
					);
				
				this.ulForm.submit(
						parametrizeCallback(
							function(e, that) {
								that.ulSubmit[0].disabled = true;
								that.ulAware.css('display', 'inline');
							}, {args: [this]}
						)
					);
				
				this.ulIframe.load(
						parametrizeCallback(
								function(e, that) {
									that.ulSubmit[0].disabled = false;
									that.ulAware.css('display', 'none');
								}, {args: [this]}
							)
					);
				this.div = this.div.find("div[title='stream-list']");
			},
			dataType: "text",
			async: false
		});
	}
	
	this.reload = function()
	{
		this.reloadProgrammed = false;
		
		$.ajax({
			url: this.baseURI + '/php/streamSelection/streamList.php',
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
	
	this.changeAutoStream = function(check)
	{
		if(check.checked)
		{
			this.setAutoLast(true);
		}else{
			this.setAutoLast(false);
		}
	}
	
	this.relink = function()
	{
		this.div.find('ul li a[title=stream]').each(
				parametrizeCallback(function(index, elem, that)
					{
						var name = this.parentNode.getAttribute('title');
						this.onclick = parametrizeCallback(function(e, name)
								{
									this.changeStream(name, "stream");
								},
								{scope: that, args: [name]}
							)
						;
					},
					{args: [this]}
				)
			);

		this.div.find('ul li a[title=stored]').each(
				parametrizeCallback(function(index, elem, that)
					{
						var name = this.parentNode.getAttribute('title');
						this.onclick = parametrizeCallback(function(e, name)
								{
									this.changeStream(name, "storedstream");
								},
								{scope: that, args: [name]}
							)
						;
					},
					{args: [this]}
				)
			);

		this.div.find('ul li a[title=delete-stored]').each(
				parametrizeCallback(function(index, elem, that)
					{
						var name = this.parentNode.getAttribute('title');
						this.onclick = parametrizeCallback(function(e, name)
								{
									this.deleteStored(name, "storedstream");
								},
								{scope: that, args: [name]}
							)
						;
					},
					{args: [this]}
				)
			);
		this.div.find('ul li a[title=download]').each(
				parametrizeCallback(function(index, elem, that)
					{
						var name = this.parentNode.getAttribute('title');
						this.onclick = parametrizeCallback(function(e, name)
								{
									this.downloadTrace(name);
								},
								{scope: that, args: [name]}
							)
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

		if(confirm("Delete Trace " + name + " ?"))
		{
			$.post(baseURI + "/php/streamSelection/streamDelete.php", {traceId: name});
			this.reload();
		}
	}

	this.downloadTrace = function(name)
	{
		window.open(baseURI + "/php/streamSelection/dlTrace.php?traceId=" + name, '_newtab');
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
				url: this.baseURI + '/php/streamSelection/lastStreamedTrace.php',
				context: this,
				success: function(data){
					var lastTrace = data.documentElement.textContent;
					if(this.currentStream != lastTrace)
					{
						this.changeStream(lastTrace, "stream");
						this.currentPlayer.play();
					}else{
						try{
							setTimeout(parametrizeCallback(this.playLast, {scope: this}), 500);
						}catch(e)
						{
							alert(e);
						}
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
	
	this.init();
}