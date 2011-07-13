function Editor (getURL, getParameters, setURL, setParameters, mode, domElement, baseURL, title)
{
	this.getURL = getURL;
	this.getParameters = getParameters;
	this.setURL = setURL;
	this.setParameters = setParameters;
	this.mode = mode;
	this.div = $(domElement);
	this.baseURL = baseURL;
	this.title = title;
	this.loadRequest = null;
	this.saveRequest = null;
	
	this.init =  function()
	{
		this.loadGUI();
		this.startEdit();
		this.loadContent();
	}

	this.loadGUI = function()
	{
		$.ajax({
			type: "GET",
			url: this.baseURL + "/html/baseEditor.html",
			context: this,
			success: function(data) {
				this.div.html(data);
				this.textDiv = this.div.find('div[title=text]');
				this.saveButton = this.div.find('[title=savebutton]');
				this.cancelButton = this.div.find('[title=cancelbutton]');
				this.filename = this.div.find('[title=filename]');
			},
			dataType: "text",
			async: false
		});
	}
	
	this.loadContent = function()
	{
		if(this.loadRequest === null)
		{
			this.loadRequest = $.ajax({
				type: "GET",
				url: this.getURL,
				data: this.getParameters,
				context: this,
				success: function(data) {
					this.setContent(data);
					this.loadRequest = null;
				},
				dataType: "text",
				async: true
			});
		}
	}
	
	this.saveContent = function()
	{
		if(this.saveRequest === null)
		{
			var sendData = this.setParameters;
			sendData['data'] = this.getContent();
			sendData['name'] = this.filename.val();

			this.saveRequest = $.ajax({
				type: "POST",
				url: this.setURL,
				data: sendData,
				context: this,
				success: function() {
					this.saveRequest = null;
				},
				async: true
			});
		}
	}

	this.setContent = function(content)
	{
		this.editor.setValue(content);
	}
	
	this.getContent = function()
	{
		return this.editor.getValue();
	}

	this.startEdit = function ()
	{
		this.div[0].style.display = "block";
		
		this.editor = new CodeMirror(this.textDiv[0], {
			  mode: this.mode,
			  value: ''
			});
		this.editor.setOption("theme", 'default');

		this.saveButton[0].addEventListener(
			'click', 
			parametrizeCallback(
				function(e){
					this.saveContent();
				},
				{scope: this}),
			false);
		
		this.cancelButton[0].addEventListener(
			'click', 
			parametrizeCallback(
				function(e){
					this.abort();
				},
				{scope: this}),
			false);
		
		this.filename.val(this.title);
	}
	
	this.abort = function()
	{
		this.onAbort();
		if(this.saveRequest !== null)
			this.saveRequest.abort();
		
		if(this.loadRequest !== null)
			this.loadRequest.abort();
		
		this.div.html('');
		
		this.div[0].style.display = "none";
	}
	
	this.onAbort = function() {}
	
	this.init();
	
}