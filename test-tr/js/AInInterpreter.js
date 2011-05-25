function AInInterpreter(svgTrace, displayInfos, tracePlayer)
{
	this.svgTrace = svgTrace;
	
	this.currentFragment = this.svgTrace.createFragment();
	
	this.displayInfos = displayInfos;
	
	this.tracePlayer = tracePlayer;

	this.execJQCallback = parametrizeCallback(
		function (index, whatsthat, that)
		{
			that.executeInstruction(this);
		},
		{args: [this]}
	);
	
	this.parseJQCallback = parametrizeCallback(
		function (index, whatsthat, that)
		{
			that.svgTrace.xmlToSVGFragment(this, that.currentFragment);
		},
		{args: [this]}
	);
	
	/**
	 * Executes the modification instructions given.
	 * Instructions must be a JQuery node collection.
	 */
	this.execute = function(instructions)
	{
		this.svgTrace.willModify();
		instructions.each(this.execJQCallback)
		this.svgTrace.commitModifications();
	}
	
	/**
	 * Executes one instruction.
	 * @private
	 * TODO: get the each instruction execution into a separate method.
	 */
	this.executeInstruction = function(instruction)
	{
		if(instruction.nodeName == "add")
		{
			try{
				$(instruction).children().each(this.parseJQCallback);
				this.svgTrace.addObsels(this.currentFragment);
			}catch (e) {
				//TODO: use notifyUser from tracePlayer
				alert("Instruction execution failed with exception: " + e);
			}
		}else if(instruction.nodeName == "delete")
		{
			try{
				//this.tracePlayer.notifyUser("*Deleting " + instruction.getAttribute("obsel-id"));
				this.svgTrace.deleteObsel(instruction.getAttribute("obsel-id"));
				//this.tracePlayer.notifyUser("-Done");
			}catch (e) {
				//TODO: use notifyUser from tracePlayer
				alert("Instruction execution failed with exception: " + e);
			}
		}else if(instruction.nodeName == "tooltip")
		{
			try{
				this.svgTrace.setToolTip($(instruction).children(), instruction.getAttribute("obsel-id"));
			}catch (e) {
				//TODO: use notifyUser from tracePlayer
				alert("Instruction execution failed with exception: " + e);
			}
		}
	}
	
	this.cleanup = function()
	{
		this.svgTrace = null;
		this.currentFragment = null;
		this.displayInfos = null;
		this.tracePlayer = null;
		
	}
}