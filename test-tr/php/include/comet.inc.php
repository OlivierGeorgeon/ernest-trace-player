<?
/*
 pi.comet
 http://pi.kodfabrik.com
 developer: azer koculu <http://azer.kodfabrik.com>
 */
class PIComet {

	public $method, $name, $header;

	function __construct($method, $name){
		$this->method = $method;
		$this->name = $name;
		$this->null = $method==3?"<comet></comet>":"";
		$this->header = $method=="2"?"application/x-dom-event-stream":"text/plain";
	}

	function push($text){
		$str = "";
		if($this->method==1 or $this->method==-1){
			$str .= "<comet>";
			$str .= $text;
			$str .= "</comet>";
		} else if($this->method==2){
			$str .= "Event: ".$this->name;
			$str .= "\ndata: ".$text."\n\n";
		} else if($this->method==3){
			$str .= "<script>";
			$str .= "parent.PIComet.event.push(\"$text\")";
			$str .= "</script>";
		};
		return $str;
	}

}
?>
