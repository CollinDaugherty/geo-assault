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
	
	
	/**
	 * ...
	 * @author Collin Daugherty
	 */
	public class BossWorld extends World 
	{
		protected var player:Player;
		protected var boss:Boss;
		protected var bullet:Bullet;
		protected var ScoreText:Text;
		protected var LivesText:Text;
		public function BossWorld()
		{
			super();
		}
		
		override public function begin():void
		{
			addGraphic(new Image(GC.BACKGROUND));
			player = new Player(FP.screen.width / 2 - 6, 400);
			boss = new Boss(24, 5);
			Text.size = 24;
			ScoreText = new Text("0", 0, 0, FP.screen.width);
			LivesText = new Text("0", 0, 440, FP.screen.width);
			addGraphic(ScoreText);
			addGraphic(LivesText);
			this.add(player);
			this.add(boss);
		}
		
		override public function update():void
		{
			if(this.classCount(Player) != 0)
			{
				if(this.classCount(Small_Enemy) == 0 || FP.random > GC.SMALL_ENEMY_SPAWN_CHANCE)
				{
					if(FP.rand(1) ==0)
					add(new (Small_Enemy));
					add(new (Small_Enemy));
				}
			}
			
			if(this.classCount(Boss) != 0)
			{
				FP.world = new StartWorld();
			}
			
			ScoreText.text = GV.Score.toString();
			LivesText.text = GV.Lifecount.toString();
			if(this.classCount(Player) == 0 && this.classCount(Small_Enemy) == 0)
			{
				GV.Score = GV.Score -500;
				GV.Lifecount = GV.Lifecount - 1;
				GV.Hitcount = 0;
				add(player);
				
			}
			
			if (GV.Lifecount == 0)
			{
				FP.world = new Game_Over();
			}
			
			
			super.update();
		
		}
		
	}
}
