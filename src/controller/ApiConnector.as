package controller
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.getLogger;
	
	public class ApiConnector extends EventDispatcher
	{
		
		
		private static const logger: ILogger = getLogger( ApiConnector );
		
		
		public function ApiConnector()
		{

		}
		
		
		
		public function pingService(){
			logger.debug("pingService");
		}
		
		
		
		
	}
}