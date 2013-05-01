package controller
{
	import air.net.URLMonitor;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.net.URLRequest;
	
	import flashx.textLayout.elements.OverflowPolicy;
	
	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.getLogger;

	public class AbstractApplication extends EventDispatcher
	{
		
		public var config:LocalConfiguration;
		
		protected static const logger: ILogger = getLogger( IDConnectorApp );
		
		protected var monitor:URLMonitor;
		
		
		public function AbstractApplication()
		{
		}
		
		
		/**
		 *
		 */
		protected function onNetworkChange(event:Event):void
		{
			this.startConnectionMonitor();
		}			
		
		
		/**
		 *
		 */
		private function startConnectionMonitor():void
		{
			// TODO Auto Generated method stub
			logger.debug("startConnectionMonitor");
			
			var url:URLRequest = new URLRequest(this.config.getKey("monitor_url"));
			url.method = "HEAD";
			
			monitor = new URLMonitor(url);
			monitor.pollInterval = 3000;
			//
			monitor.addEventListener(StatusEvent.STATUS,onConnectionStatus);
			
			monitor.start();
			
		}		
		
		
		
		
		/**
		 *
		 */
		protected function onConnectionStatus(event:StatusEvent):void
		{
			logger.debug("onConnectionStatus");
			
			if(this.monitor.available){
				
				logger.debug("yes we are connected!");
				
				this.onConnectionActive();
				
			}else{
				logger.debug("connection down .. notify ?");
				this.onConnectionLatency();
			}
			
			
			
		}		
		
		protected function onConnectionActive():void
		{

			
		}	
		
		protected function onConnectionLatency():void
		{
			
			
		}
		
		
		protected function startApp():void
		{

			
		}
		/**
		 *
		 */
		protected function onConfigLoaded(event:Event):void
		{
			
			this.startApp();
		}		
		
		
		
		
	}
}