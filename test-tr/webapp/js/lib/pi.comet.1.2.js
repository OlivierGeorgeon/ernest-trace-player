(function(_scope){
	
	/*
	 * pi.comet.js
	 * Comet Plug-in for pi.js
	 * 1.2
	 * Azer Koçulu <http://azer.kodfabrik.com>
	 * http://pi.kodfabrik.com
	 */
	
	_scope.comet = pi.base.extend({
		"$Init":function(_name,_callback,_disconnect){
			this.environment.setName(_name||"PIComet");
			
			this.environment.setMethod(pi.env.ie?3:pi.env.opera?2:pi.env.webkit?-1:1);
			this.environment.setTunnel(
				this.environment.getMethod()==3?new ActiveXObject("htmlfile"):
				this.environment.getMethod()==2?document.createElement("event-source"):
				new pi.xhr
			);
			this.event.push = _callback||new Function;
			this.event.disconnect = _disconnect||new Function;
			return this;
		},
		"checkFrameState":function(){
			if(this.environment.getTunnel().getElementById(this.environment.getName() + 'FrameBody').readyState=="loading"){
				this.toFrameState = setTimeout(this.checkFrameState.curry(this),500);
			} else {
				this.environment.getTunnel().parentWindow.PIComet.event.disconnect();
				this.environment.getTunnel().getElementById(this.environment.getName() + 'FrameBody').parentNode.removeChild(
					this.environment.getTunnel().getElementById(this.environment.getName() + 'FrameBody')
				);
				this.environment._setTunnel(null);
			}
		},
		"abort":function(){
			this.environment.setByteOffset(0);
			clearTimeout(this.toFrameState);
			switch(this.environment.getMethod()){
			case -1:
			case 1:
					this.environment.getTunnel().abort();
					this.event.push = null;
					this.event.disconnect = null;
					break;
				case 2:
					document.body.removeChild(this.environment.getTunnel());
					break;
				case 3:
					this.environment.getTunnel().body.innerHTML="<iframe src='about:blank'></iframe>";
			}
		},
		"send":function(){
			switch(this.environment.getMethod()){
			case -1:
			case 1:
					this.environment.getTunnel().send();
					break;
				case 2:
					document.body.appendChild(this.environment.getTunnel());
					this.environment.getTunnel().addEventListener(this.environment.getName(),this.event.change,false);
					break;
				case 3:
					this.environment.getTunnel().open();
					this.environment.getTunnel().write("<html><body></body></html>");
					this.environment.getTunnel().close();
					this.environment.getTunnel().parentWindow.PIComet = this;
					this.environment.getTunnel().body.innerHTML="<iframe id='{0}' src='{1}'></iframe>".format(this.environment.getName() + 'FrameBody',this.environment.getUrl());
					this.toFrameState = setTimeout(this.checkFrameState.curry(this), 500);
			};
			return this;
		},
		"environment":{
			"_byteOffset":0, "_name":"", "_tunnel":null, "_method":"", "_url":"",
			"setTunnel":function(_value){
				if(this.getMethod()==1 || this.getMethod()==-1){
					_value.environment.setType("GET");
					_value.environment.
					addData("PICometMethod","" + this.getMethod()).environment.
					addCallback([3],this._parent_.event.change).environment.
					addCallback([4],this._parent_.event.disconnect).environment.
					setCache(false);
				}
						
				_value._cometApi_ = this._parent_;
				this._setTunnel(_value);
				return this._parent_;
			},
			"setUrl":function(_value){
				if(this.getMethod()>1){
					_value = "{0}{1}PICometMethod={2}&PICometName={3}".format(_value,_value.search("\\?")>-1?"&":"?",this.getMethod(),this.getName(),Math.round(Math.random()*1000));
					if(this.getMethod()==2)
						this.getTunnel().setAttribute("src",_value);
				} else
					this.getTunnel().environment.setUrl(_value);
				this._setUrl(_value);
				return this._parent_;
			}
		},
		"event":{
			"change":function(){
				if (this._cometApi_.environment.getMethod() == 2)
					this._cometApi_.event.push(arguments[0].data);
				else {
					var temp = this.environment.getApi().responseText;
					var newdata = temp.substring(
							this._cometApi_.environment.getByteOffset());
					var offsetOffset = 0;
					var end = 0;
					var start = 0;
					while (true) {
						var start = newdata.indexOf("<comet>", end);
						var end = newdata.indexOf("</comet>", start);
						
						if(start >= 0 && end >= 0){
							offsetOffset = end + 8;
						}
						
						if (end < 0 || start < 0)
							break;
						this._cometApi_.event.push(newdata.substring(start + 7, end));
					};
					this._cometApi_.environment.setByteOffset(offsetOffset + this._cometApi_.environment.getByteOffset());
				}
			},
			"disconnect":function(){
				this._cometApi_.event.disconnect();
			},
			"push":new Function
		}
	});
	
	_scope.comet.get = function(_url,_listener,_disconnect){
		return new _scope.comet("PIComet"+Number(new Date()),_listener,_disconnect).environment.setUrl(_url).send();
	};
	
	_scope.comet.version = [1.1,2008091000];
})(pi);