package 
{
	import mx.core.SpriteAsset;
	import net.flashpunk.Engine;
	import net.flashpunk.FP
	import net.flashpunk.graphics.Backdrop
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Collin Daugherty
	 */
	public class Main extends Engine 
	{
		[Embed(source="../assets/sounds/music.mp3")]
		private const MUSIC:Class;
		
		public var music:Sfx = new Sfx(MUSIC);
		
		
		public function Main():void 
		{
			super (320, 470);
			//FP.screen = new ScreenRetro
			FP.screen.scale = 1;
			//FP.console.enable();
		}
		
		override public function init():void 
		{
			var s:Splash = new Splash;
			FP.world.add(s);
			s.start(splashComplete);
		}
		
	
		public function splashComplete():void
		{
			FP.world = new StartWorld();
			music.loop(0.2);
			super.init();
		}
		
	}
		
}