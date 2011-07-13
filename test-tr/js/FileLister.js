function FileLister (divId, editorDivId, baseURL)
{
	this.div = $("#" + divId);
	this.editorDiv = $("#" + editorDivId);
	this.baseURL = baseURL;
	this.currentEditor = null;
	
	this.init = function()
	{
		this.loadBase();
		this.loadList();
	}
	
	this.loadBase = function()
	{
		$.ajax({
			type: "GET",
			url: this.baseURL + "/html/baseFileList.html",
			context: this,
			success: function(data) {
				this.div.html(data);
				this.ul = this.div.find('ul');
			},
			dataType: "text",
			async: false
		});
	}
	
	this.loadList = function()
	{
		$.ajax({
			type: "GET",
			url: this.baseURL + "/php/edition/fileList.php",
			context: this,
			success: function(data) {
				this.updateFileList(data);
			},
			dataType: "xml",
			async: false
		});
	}
	
	this.updateFileList = function(data)
	{
		this.ul.empty();
		$(data).find("file").each(
			parametrizeCallback(
				function(elem, index, that)
				{
					that.ul.append(
						"<li>" 
						+ "<a href=\"#\">(" + this.getAttribute('type') + ")" + this.getAttribute('name') + "</a>"
						+ " <a href=\"#\" title=\"delete\">✗</a>"
						+ "</li>");
					
					var li = $(that.ul[0].lastChild);
					li[0].firstChild.addEventListener("click", parametrizeCallback(function(e, that)
							{
								e.preventDefault();
								
								if(that.currentEditor !== null)
									that.currentEditor.abort();
								
								var name = this.getAttribute('name');
								var type = this.getAttribute('type');
								
								that.currentEditor = new Editor(
									that.baseURL + "/php/edition/getFile.php",
									{"name": name, "type": type},
									
									that.baseURL + "/php/edition/setFile.php",
									{"name": name, "type": type},

									(name.match("xml$") == "xml" ? "xml" :
									(name.match("xsl$") == "xsl" ? "xml" :
									(name.match("php$") == "php" ? "application/x-httpd-php" : "text"))),
									
									that.editorDiv,
									that.baseURL,
									name
								);
								
								that.currentEditor.onAbort = parametrizeCallback(function()
									{
										this.currentEditor = null;
									}, {scope: that});
								
								return false;
							},
							{scope: this, args: [that]}
						), true);

					li.children('*[title=delete]')[0].addEventListener("click", parametrizeCallback(function(e, that)
							{
								e.preventDefault();
								
								$.ajaxSetup({async:false});
								$.post(
									baseURI + "/php/edition/deleteFile.php", 
									{configId: this.getAttribute('name')}
								);
								$.ajaxSetup({async:true});
								
								that.loadList();
								
								return false;
							},
							{scope: this, args: [that]}
						), true);
				},
				{args: [this]}
			)
		);
	}
	
	this.init();
}