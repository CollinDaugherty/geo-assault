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
	
	
	/**
	 * ...
	 * @author Collin Daugherty
	 */
	public class Game_Over extends World 
	{
		protected var ScoreText:Text;
		protected var LivesText:Text;
		protected var GameOverText:Text;
		protected var ClickText:Text;
		public function Game_Over()
		{
			super();
		}
		
		override public function begin():void
		{
			addGraphic(new Image(GC.BACKGROUND));
			Text.size = 24;
			ScoreText = new Text("0", 0, 0, FP.screen.width);
			LivesText = new Text("0", 0, 440, FP.screen.width);
			GameOverText = new Text("Game Over", 99, 180, FP.screen.width);
			ClickText = new Text("Click to Continue", 70, 324, FP.screen.width);
			addGraphic(ScoreText);
			addGraphic(LivesText);
			addGraphic(GameOverText);
			addGraphic(ClickText);
		}
		
		override public function update():void
		{
			if(Input.mousePressed)
			{
				FP.world = new StartWorld();
			}
		}
	}

}