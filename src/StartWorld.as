package  
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import Player;
	import net.flashpunk.FP
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	
	/**
	 * ...
	 * @author Collin Daugherty
	 */
	public class StartWorld extends World 
	{
		protected var ClickText:Text;
		protected var ControlText:Text;
		protected var ControlText2:Text;
		protected var ControlText3:Text;
		protected var MuteText:Text;
		
		public function StartWorld()
		{
			super();
		}
		
		override public function begin():void
		{
			addGraphic(new Image(GC.STARTSCREEN));
			//Text.size = 24;
			//ClickText = new Text("Click to Start", 75, 150, FP.screen.width);
			//Text.size = 18;
			//ControlText = new Text("Controls:", 120, 310, FP.screen.width);
			//ControlText2 = new Text("Arrow Keys to Move", 63, 345, FP.screen.width);
			//ControlText3 = new Text("Click or Space to Shoot", 50, 370, FP.screen.width);
			//MuteText = new Text("M to Mute", 115, 405, FP.screen.width);
			//addGraphic(ClickText);
			//addGraphic(ControlText);
			//addGraphic(ControlText2);
			//addGraphic(ControlText3);
			//addGraphic(MuteText);

		}
		
		override public function update():void
		{
			if(Input.mousePressed)
			{
				FP.world = new GameWorld();
				GV.Lifecount = 3;
				GV.Score = 0;
			}
			
			if (Input.pressed(Key.M))
			{
				FP.volume = (FP.volume == 0) ? 1 : 0;
			}
			
		}
	}

}