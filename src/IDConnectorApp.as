package
{
	import controller.AbstractApplication;
	import controller.ApiConnector;
	import controller.IApplication;
	import controller.LocalConfiguration;
	
	import event.ProjectEvent;
	
	import flash.events.Event;
	
	import model.Project;
	
	public class IDConnectorApp extends AbstractApplication
	{
		
		private var project:Project;
		
		private var apiConnector:ApiConnector;

		
		public function IDConnectorApp()
		{
			super();
		}
		
		
		
		
		/**
		 * 
		 */
		public function main():void
		{
			// TODO Auto Generated method stub
			this.config = new LocalConfiguration();
			this.addEventListener(LocalConfiguration.LOADED,this.onConfigLoaded);
			
		}
		


		
		/**
		 *
		 */
		override protected function startApp():void
		{
			
			this.addEventListener(Event.NETWORK_CHANGE,onNetworkChange);
			
			this.apiConnector = new ApiConnector();
			
			
			this.apiConnector.pingService();
			
		}		
		
		/**
		 * 
		 */
		public function newProject():void
		{
			this.project = new Project();
			this.dispatchEvent(new ProjectEvent(ProjectEvent.CREATED));
			
		}
		
		
		
		/**
		 * 
		 */
		public function openProject():void
		{
			this.project = new Project();
			this.dispatchEvent(new ProjectEvent(ProjectEvent.CREATED));
				
		}			
		
		
		
		override protected function onConnectionActive():void
		{
			// TODO Auto Generated method stub
			
		}
		
		override protected function onConnectionLatency():void
		{
			// TODO Auto Generated method stub
			
		}
		

		
	}
}