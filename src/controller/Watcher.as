package controller
{
	import com.adobe.air.filesystem.FileMonitor;
	import com.adobe.air.filesystem.events.FileMonitorEvent;
	
	import flash.events.Event;
	import flash.filesystem.File;
	
	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.getLogger;
	
	
	
	/**
	 * Watch a folder for changes, creation
	 * 
	 * 
	 */
	public class Watcher
	{
		private static const logger: ILogger = getLogger( Watcher );
		
		private var monitor:FileMonitor;
		
		private var index:Indexer;
		
		
		
		public function Watcher(inDexer:Indexer)
		{
			index = inDexer;
			
		}
		
		
		
		
		/**
		 * Start watching a folder
		 */
		public function watch(file:File=null){
			
			
			// Set to desktop for debug purpose
			if(!file){
				file = File.desktopDirectory;
			}


			if(!file.isDirectory){
				throw new Error("We should watch for a directory");
			}

			if(null === monitor){
				
				monitor = new FileMonitor();
				monitor.addEventListener(FileMonitorEvent.CHANGE, onFileChange);
				monitor.addEventListener(FileMonitorEvent.MOVE, onFileMove);
				monitor.addEventListener(FileMonitorEvent.CREATE, onFileCreate);
				
				index.init();
				
			};			
			
			monitor.file = file;
			monitor.watch();
			
			// scan the folder
			index.scan(file);
			
			
		}
		
		
		
		private function onFileChange(e:FileMonitorEvent):void
		{
			logger.debug("file was changed");
			index.rescan();
		}
		
		private function onFileMove(e:FileMonitorEvent):void
		{
			logger.debug("file was moved");
			index.rescan();
		}
		
		private function onFileCreate(e:FileMonitorEvent):void
		{
			logger.debug("file was created");
			index.rescan();
		}
		
	}
}