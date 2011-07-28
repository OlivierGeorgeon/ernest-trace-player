function ConfigEditor(div_id, noticeDiv_id, baseURI)
{
	this.baseURI = baseURI;
	this.div = $('#' + div_id);
	this.notice_div = $('#' + noticeDiv_id);
	
	this.init = function()
	{
		$.ajax({
			url: this.baseURI + '/html/baseConfigEditor.html',
			context: this,
			success: function(data){
				this.div.html(data);
				this.formDiv = this.div.find('div[title=new-symbole-form-div]')
				this.formLDiv = this.div.find('div[title=new-lsymbole-form-div]');
				this.symboleListDiv = this.div.find('div[title=symbole-list]');
				
				var slDiv = this.div.find('div[title=save-load]');
				this.saveFormDiv = slDiv.find('div[title=form]');
				this.confListDiv = slDiv.find('div[title=list]');
				
				this.coverSymboleForm = this.div.find('div[title=cover-new-form]');
				this.coverConfigList = this.div.find('div[title=cover-config-list]');

				this.publicButton = this.div.find('button[title=button-set-public]');
				this.publicUrl = this.div.find('div[title=set-public-url]');
				this.publicButton.click(parametrizeCallback(
						this.setPublic
						, {scope: this}
				));
			},
			dataType: "text",
			async: false
		});

		this.loadNewSymboleForm();
		this.loadNewLSymboleForm();
		this.loadSaveForm();
		this.loadConfigState();
		this.loadConfigList();
	}
	
	this.setPublic = function()
	{
		$.ajax({
			url: this.baseURI + '/php/transformationSetPublic.php',
			context: this,
			success: function(data){
				this.publicUrl.html("<a href=\"" + 
					window.location.protocol + '//' + window.location.host + this.baseURI + '/autoconf.php?transformationId=' + data.documentElement.textContent
					+ "\">" + window.location.protocol + '//' + window.location.host + this.baseURI + '/autoconf.php?transformationId=' + data.documentElement.textContent);
			},
			dataType: "xml",
			async: true
		});
	}
	
	this.loadNewSymboleForm = function()
	{
		$.ajax({
			url: this.baseURI + '/html/confNewSymboleForm.html',
			context: this,
			success: function(data){
				this.formDiv.html(data);
				
				this.formNew = this.formDiv.find('form[title=new-symbole]');
				this.formNewCond = this.formNew.find("input[name=condition]");
				this.formNewShape = this.formNew.find("input[name=shape]");
				this.formNewColor = this.formNew.find("input[name=color]");
				this.formNewVOffset = this.formNew.find("input[name=voffset]");
				this.formNewImg = this.formNew.find("input[name=image-url]");

				this.formNewScaleX = this.formNew.find("input[name=scaleX]");
				this.formNewScaleY = this.formNew.find("input[name=scaleY]");
				this.formNewRotate = this.formNew.find("input[name=rotate]");
				this.formNewSkewX = this.formNew.find("input[name=skewX]");
				this.formNewSkewY = this.formNew.find("input[name=skewY]");
				
				this.formNewShape.tooltip({tip: "#shape-tooltip", position: "center right", opacity: 0.7});
				
				this.formNew.submit(
					parametrizeCallback(
						function(e, baseURI) {
							$.post(baseURI + "/php/config/newSymbole.php", $(this).serialize());
						}, {args: [this.baseURI]}
					)
				);
			},
			dataType: "text",
			async: true
		});
	}
	
	this.loadNewLSymboleForm = function()
	{
		$.ajax({
			url: this.baseURI + '/html/confNewLSymboleForm.html',
			context: this,
			success: function(data){
				this.formLDiv.html(data);
				
				this.formNewL = this.formLDiv.find('form[title=new-lsymbole]');
				this.formNewLBeginCond = this.formNewL.find("input[name=begin-condition]");
				this.formNewLEndCond = this.formNewL.find("input[name=end-condition]");
				this.formNewLShape = this.formNewL.find("input[name=shape]");
				this.formNewLColor = this.formNewL.find("input[name=color]");
				this.formNewLVOffset = this.formNewL.find("input[name=voffset]");
				this.formNewLImg = this.formNewL.find("input[name=image-url]");
				this.formNewLShapeEnd = this.formNewL.find("input[name=shape-end]");
				this.formNewLColorEnd = this.formNewL.find("input[name=color-end]");
				this.formNewLVOffsetEnd = this.formNewL.find("input[name=voffset-end]");
				this.formNewLImgEnd = this.formNewL.find("input[name=image-url-end]");

				this.formNewLShape.tooltip({tip: "#long-shape-tooltip", position: "center right", opacity: 0.7});
				this.formNewLShapeEnd.tooltip({tip: "#long-shape-tooltip", position: "center right", opacity: 0.7});
				
				this.formNewL.submit(
					parametrizeCallback(
						function(e, baseURI) {
							$.post(baseURI + "/php/config/newLSymbole.php", $(this).serialize());
						}, {args: [this.baseURI]}
					)
				);
			},
			dataType: "text",
			async: true
		});
	}
	
	this.loadSaveForm = function()
	{
		$.ajax({
			url: this.baseURI + '/html/confSaveForm.html',
			context: this,
			success: function(data){
				this.saveFormDiv.html(data);
				
				this.saveFormDiv.find('form').submit(
					parametrizeCallback(
						function(e, baseURI, that) {
							$.ajaxSetup({async:false});
							$.post(baseURI + "/php/config/saveAs.php", $(this).serialize());
							$.ajaxSetup({async:true});
							
							that.loadConfigList();
						}, {args: [this.baseURI, this]}
					)
				);
			},
			dataType: "text",
			async: true
		});
	}

	this.loadConfigList = function()
	{
		$.ajax({
			url: this.baseURI + '/php/config/list.php',
			context: this,
			success: function(data){
				this.updateConfigList(data);
			},
			dataType: "xml",
			async: true
		});
	}
	
	this.updateConfigList = function(xmlList)
	{
		var ul = this.confListDiv.children('ul');
		ul.empty();
		
		$(xmlList).find('config').each(
			parametrizeCallback(function(index, elem, that, ul, xmlList)
				{
					var symbole = $(this);
					ul.append(
							"<li title=" + this.getAttribute('name') + ">" 
							+ "<a href=\"#\">" + this.getAttribute('name') + "</a>"
							+ " <a href=\"#\" title=\"delete\">✗</a>"
							+ "</li>"
					);
					
					var li = $(ul[0].lastChild);
					li[0].firstChild.addEventListener("click", parametrizeCallback(function(e, that)
							{
								e.preventDefault();
								// Trigger the config loading
								$.ajaxSetup({async:false});
								$.post(
									baseURI + "/php/config/load.php", 
									{configId: this.getAttribute('name')}
								);
								$.ajaxSetup({async:true});
								
								// Reload the config once done
								that.loadConfigState();
								that.saveFormDiv.find('input:first').val(this.getAttribute('name'));
								
								return false;
							},
							{scope: this, args: [that]}
						), true);

					li.children('*[title=delete]')[0].addEventListener("click", parametrizeCallback(function(e, that)
						{
							e.preventDefault();
							// Trigger the config deletion
							$.ajaxSetup({async:false});
							$.post(
								baseURI + "/php/config/delete.php", 
								{configId: this.getAttribute('name')}
							);
							$.ajaxSetup({async:true});
							
							// Reload the config once done
							that.loadConfigList();
							
							return false;
						},
						{scope: this, args: [that]}
					), true);
				},
				{args: [this, ul, xmlList]}
			)
		);
	}
	
	this.loadConfigState = function()
	{
		this.loadProgrammed = false;
		
		$.ajax({
			url: this.baseURI + '/php/config/getState.php',
			context: this,
			success: function(data){
				this.updateState(data);
				if(!this.loadProgrammed)
				{
					this.loadProgrammed = true;
					setTimeout(parametrizeCallback(this.loadConfigState, {scope: this}), 1000);
				}
			},
			dataType: "xml",
			async: true
		});
	}

	this.updateState = function(xmlState)
	{
		try{
			var ul = this.symboleListDiv.children('ul');
			ul.empty();
			
			$(xmlState).find('symbole').each(
				parametrizeCallback(function(index, elem, that, ul, xmlState)
					{
						var symbole = $(this);
						ul.append(
							"<li title=" + this.getAttribute('id') + ">" 
							+ "<div class=\"symbole-title\">" + this.getAttribute('id') + "</div>" 
							+ " <a href=\"#\" title=\"copy\">⎘</a>"
							+ " <a href=\"#\" title=\"delete\">✗</a>"
							+ "<div class=\"symbole-disp\">"
							+ symbole.children("condition").text() + "<br />"
							+ symbole.children("shape").text() + "<br />"
							+ symbole.children("color").text() + "<br />"
							+ symbole.children("voffset").text() + "<br />"
							+ symbole.children("image-url").text() + "<br />"
							+ 
							(symbole.children("transform").length > 0 ?
								"<u>Scale:</u><br />"
								+ "<u>x:</u> " + symbole.children("scaleX").text() + "<br />"
								+ "<u>y:</u> " + symbole.children("scaleY").text() + "<br />"
								+ "<u>Rotate:</u><br />"
								+ symbole.children("rotate").text() + "<br />"
								+ "<u>Skew:</u><br />"
								+ "<u>x:</u> " + symbole.children("skewX").text() + "<br />"
								+ "<u>y:</u> " + symbole.children("skewY").text() + "<br />"
								+ "</div></li>"
							: 
								"")
						);
	
						var li = $(ul[0].lastChild);
						li.children('*[title=copy]')[0].addEventListener("click", parametrizeCallback(function(e, that, xmlState)
							{
								e.preventDefault();
								that.copySymbole(xmlState, $(this));
								return false;
							},
							{scope: this, args: [that, xmlState]}
						), true);
						
						li.children('*[title=delete]')[0].addEventListener("click", parametrizeCallback(function(e, that, xmlState)
							{
								e.preventDefault();
								that.deleteSymbole(xmlState, $(this));
								return false;
							},
							{scope: this, args: [that, xmlState]}
						), true);
						
					},
					{args: [this, ul, xmlState]}
				)
			);
			
			$(xmlState).find('lsymbole').each(
				parametrizeCallback(function(index, elem, that, ul, xmlState)
					{
						var symbole = $(this);
						ul.append(
							"<li title=" + this.getAttribute('id') + ">" 
							+ "<div class=\"symbole-title\">" + this.getAttribute('id') + "</div>" 
							+ " <a href=\"#\" title=\"copy\">⎘</a>"
							+ " <a href=\"#\" title=\"delete\">✗</a>"
							+ "<div class=\"symbole-disp\">"
							+ symbole.children("begin-condition").text() + "<br />"
							+ symbole.children("end-condition").text() + "<br />"
							+ symbole.children("shape").text() + "<br />"
							+ symbole.children("color").text() + "<br />"
							+ symbole.children("voffset").text() + "<br />"
							+ symbole.children("image-url").text() + "<br />"
							+ (symbole.children("shape-end").length > 0 ? (symbole.children("shape-end").text() + "<br />") : "")
							+ (symbole.children("color-end").length > 0 ? (symbole.children("color-end").text() + "<br />") : "")
							+ (symbole.children("voffset-end").length > 0 ? (symbole.children("voffset-end").text() + "<br />") : "")
							+ (symbole.children("image-url-end").length > 0 ? (symbole.children("image-url-end").text() + "<br />") : "")
							+ "</div></li>"
						);
						
						var li = $(ul[0].lastChild);
						li.children('*[title=copy]')[0].addEventListener("click", parametrizeCallback(function(e, that, xmlState)
							{
								e.preventDefault();
								that.copyLSymbole(xmlState, $(this));
								return false;
							},
							{scope: this, args: [that, xmlState]}
						), true);
						
						li.children('*[title=delete]')[0].addEventListener("click", parametrizeCallback(function(e, that, xmlState)
							{
								e.preventDefault();
								that.deleteLSymbole(xmlState, $(this));
								return false;
							},
							{scope: this, args: [that, xmlState]}
						), true);
						
					},
					{args: [this, ul, xmlState]}
				)
			);
		}catch (e) {
			alert('Something went terribly wrong with the config state retrieval: ' + e);
		}
	}

	this.copySymbole = function(nothing, symboleElement)
	{
		this.formNewCond.val(symboleElement.children("condition").text());
		this.formNewShape.val(symboleElement.children("shape").text());
		this.formNewColor.val(symboleElement.children("color").text());
		this.formNewVOffset.val(symboleElement.children("voffset").text());
		this.formNewImg.val(symboleElement.children("image-url").text());

		this.formNewScaleX.val(symboleElement.children("scaleX").text());
		this.formNewScaleY.val(symboleElement.children("scaleY").text());
		this.formNewRotate.val(symboleElement.children("rotate").text());
		this.formNewSkewX.val(symboleElement.children("skewX").text());
		this.formNewSkewY.val(symboleElement.children("skewY").text());
	}
	
	this.deleteSymbole = function(nothing, symboleElement)
	{
		if(confirm("Do you really want to delete that symbole ?"))
		{
			$.post(baseURI + "/php/config/deleteSymbole.php", {id: symboleElement.attr("id")});
		}
	}
	
	this.copyLSymbole = function(nothing, symboleElement)
	{
		this.formNewLBeginCond.val(symboleElement.children("begin-condition").text());
		this.formNewLEndCond.val(symboleElement.children("end-condition").text());
		this.formNewLShape.val(symboleElement.children("shape").text());
		this.formNewLColor.val(symboleElement.children("color").text());
		this.formNewLVOffset.val(symboleElement.children("voffset").text());
		this.formNewLImg.val(symboleElement.children("image-url").text());
		this.formNewLShapeEnd.val(symboleElement.children("shape-end").text());
		this.formNewLColorEnd.val(symboleElement.children("color-end").text());
		this.formNewLVOffsetEnd.val(symboleElement.children("voffset-end").text());
		this.formNewLImgEnd.val(symboleElement.children("image-url-end").text());
	}
	
	this.deleteLSymbole = function(nothing, symboleElement)
	{
		$.post(baseURI + "/php/config/deleteLSymbole.php", {id: symboleElement.attr("id")});
	}

	this.playing = function()
	{
		this.coverConfigList[0].style.display = "block";
		this.coverSymboleForm[0].style.display = "none";
	}
	
	this.stopped = function()
	{
		this.coverConfigList[0].style.display = "none";
		this.coverSymboleForm[0].style.display = "block";
	}
	
	
	this.init();
}