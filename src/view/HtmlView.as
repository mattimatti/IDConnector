package view
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.LocationChangeEvent;
	import flash.html.HTMLLoader;
	import flash.net.URLRequest;
	
	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.getLogger;
	
	public class HtmlView extends Sprite
	{
		
		protected var holder:HTMLLoader;
		
		private static const logger: ILogger = getLogger( HtmlView );
		
		public function HtmlView(loader:HTMLLoader)
		{
			
			this.holder = loader;

			// Setup Events
			this.holder.addEventListener(Event.COMPLETE,   this.onPageLoaded);
			this.holder.addEventListener( LocationChangeEvent.LOCATION_CHANGING, this.onLocationChanging );
			
			
		}
		
		
		
		
		public function loadRoot($url:String):void{
			var urlReq:URLRequest = new URLRequest($url);
			this.holder.load(urlReq); 
		}
		
		
		
		
		public function onLocationChanging( event:LocationChangeEvent ):void
		{
			logger.debug( "Location changing: " + event.location );
			
			if ( event.location.indexOf( "http://www.adobe.com" ) < 0 ) 
			{
				event.preventDefault();
			}
		}
		
		
		/**
		 * 
		 */
		private function onPageLoaded(e:Event):void{
		
			logger.debug("onPageLoaded");
		
		}
		
		
		
		
	}
}