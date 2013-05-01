package event
{
	import flash.events.Event;
	
	public class ProjectEvent extends Event
	{
		
		public static const CREATED:String = "PROJECT::CREATED";
		
		public static const OPENED:String = "PROJECT::OPENED";
		
		public static const SAVED:String = "PROJECT::SAVED";
		
		public static const UPDATED:String = "PROJECT::UPDATED";
		
		public static const DELETED:String = "PROJECT::DELETED";
		
		
		public function ProjectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}