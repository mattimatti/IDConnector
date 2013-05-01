package controller
{
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	
	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.Logger;
	import org.as3commons.logging.api.getLogger;
	import org.osmf.logging.Logger;

	
	/**
	 * The indexer class creates an index of a folder
	 * 
	 */
	public class Indexer extends EventDispatcher
	{

		private static const logger: ILogger = getLogger( Indexer );
		
		
		private var scanning:Boolean;
		
		
		private var folder:File;
		
		
		private var writer:IndexWriter;
		

		/**
		 */
		public function Indexer(inWriter:IndexWriter = null)
		{
			if(null !== inWriter){
				writer = inWriter;
			}else{
				writer =   new IndexWriter();
			}
			
		}

		
		
		public function init()
		{
		}
		
		
		public function rescan()
		{
			
			
			logger.debug("rescan current folder");
			
			writer.writeHeader();
			
			this.doScan(folder);
			
			this.calculateChangeset();
			
		}
		
		
		
		
		private function calculateChangeset(){
			var hasChanges = false;
			
			if(hasChanges){
				
				logger.debug("has changes");
				
			}else{
				logger.debug("no changes");
			}
			
		}

		
		
		/*
		var stream:FileStream = new FileStream();
		stream.open(File.applicationStorageDirectory.resolvePath("myZip.zip"), FileMode.WRITE);
		
		zip.serialize(stream);
		stream.close();
		*/
		
		
		
		public function scan(inFolder:File): void{
			
			// set the current folder
			folder = inFolder;
			
			logger.debug("Indexing folder " +  folder.url);
			
			writer.writeHeader();
			
			this.doScan(folder);
			
			this.calculateChangeset();
			
		}
		
		
		
		/**
		 * Scan folders recursively
		 */
		private function doScan(inFolder:File): void {
			
			if(!inFolder) throw new Error("A folder or file should be specified");
			if(!inFolder.isDirectory) throw new Error("A folder should be specified");
			
			logger.debug("doScan " +  inFolder.url);
			
			var listing:Array = inFolder.getDirectoryListing();
			
			
			for (var i:int = 0; i < listing.length; i++) 
			{
				var tmpFileOrFolder:File = listing[i];
				
				// Ignore hidden files
				if(tmpFileOrFolder.isHidden){
					continue;
				}
				
				// If it0s a folder recursively scan
				if(tmpFileOrFolder.isDirectory){
					this.doScan(tmpFileOrFolder);
				}else{
					writer.addEntry(tmpFileOrFolder);
					
				}

			}
			
			
			
			
		}
		
		
	}
}