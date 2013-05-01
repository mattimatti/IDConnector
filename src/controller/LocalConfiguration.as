package controller
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class LocalConfiguration extends EventDispatcher
	{
		
		
		
		public static const LOADED:String = "CONFIG::LOADED";
		
		
		private var data:Array;
		
		
		public function LocalConfiguration()
		{
			this.data = new Array();
		}
		
		
		public function load():void{
			this.dispatchEvent(new Event(LocalConfiguration.LOADED));
		}
		
		
		
		/**
		 * 
		 */
		public function getConfig():Array{
			return data;
		}
		
		
		
		
		public function getKey(key:String):String{
			return this.data[key];
		}
	}
}