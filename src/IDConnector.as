package
{
	import controller.IndexWriter;
	import controller.Indexer;
	import controller.Watcher;
	
	import flash.display.Sprite;
	import flash.html.HTMLLoader;
	import flash.net.URLRequest;
	
	import model.Project;
	
	import org.as3commons.logging.api.LOGGER_FACTORY;
	import org.as3commons.logging.setup.SimpleTargetSetup;
	import org.as3commons.logging.setup.target.TraceTarget;
	
	import view.HtmlView;
	
	public class IDConnector extends Sprite
	{
		
		public var holder:HTMLLoader;		
		
		public function IDConnector()
		{
			
			
			
			LOGGER_FACTORY.setup = new SimpleTargetSetup( new TraceTarget );
			
			
			this.holder = new HTMLLoader();
			
			var app_width:int = 800;
			var app_height:int = 600;

			//this.holder.width = app_width;
			//this.holder.height = app_height;
			
			this.holder.width = stage.stageWidth;
			this.holder.height = stage.stageHeight;
			
			addChild(this.holder);

			
			var app:IDConnectorApp = new IDConnectorApp();
				app.main();
			
			
			var project:Project = new Project();
			
			var indexer:Indexer = new Indexer();
			
			var watcher:Watcher = new Watcher(indexer);
			watcher.watch();

						
			
			var appView:HtmlView = new HtmlView(this.holder);
				appView.loadRoot("http://www.google.com/");
				
		}
	}
}