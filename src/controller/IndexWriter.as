package controller
{
	import flash.filesystem.File;
	
	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.getLogger;

	public class IndexWriter
	{
		
		
		private static const logger: ILogger = getLogger( IndexWriter );
		
		
		public function IndexWriter()
		{
		}
		
		
		public function writeHeader():void{
			logger.info("writeHeader");
		}
		
		
		
		public function addEntry(file:File)
		{
			
			// nativePath
			// name
			logger.debug("writeEntry: " + file.name);
		}
		
		
		
		
		
		
		
		
	}
}