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
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	
	/**
	 * ...
	 * @author Collin Daugherty
	 */
	public class GameWorld extends World 
	{
		[Embed(source="../assets/sounds/1up.mp3")]
		private const ONEUP:Class;
		
		[Embed(source="../assets/sounds/spawn.mp3")]
		private const SPAWN:Class;
		
		
		public var oneup:Sfx = new Sfx(ONEUP);
		public var spawn:Sfx = new Sfx(SPAWN);
		
		
		protected var player:Player;
		protected var ScoreText:Text;
		protected var LivesText:Text;
		protected var LivesText2:Text;
		public function GameWorld()
		{
			FP.screen = new ScreenRetro
			super();
		}
		
		override public function begin():void
		{
			addGraphic(new Image(GC.BACKGROUND));
			player = new Player(FP.screen.width/2 - 6, 400);
			Text.size = 24;
			ScoreText = new Text("0", 0, 0, FP.screen.width);
			Text.size = 21;
			LivesText = new Text("0", 60, 440, FP.screen.width);
			LivesText2 = new Text("Lives:", 0, 440, FP.screen.width);
			addGraphic(ScoreText);
			addGraphic(LivesText);
			addGraphic(LivesText2);
			this.add(player);
			spawn.play(0.5);
		}
		
		override public function update():void
		{
			if(this.classCount(Player) != 0)
			{
				if(this.classCount(Enemy) == 0 || FP.random > GC.ENEMY_SPAWN_CHANCE)
				{
					if(FP.rand(1) ==0)
					add(new (Enemy));
					
				}
			}
			
			if (GV.Score > 1000)
			{
				if(this.classCount(Player) != 0)
				{
					if(this.classCount(Round_Enemy) == 0 || FP.random > GC.ROUND_ENEMY_SPAWN_CHANCE)
					{
						if(FP.rand(1) ==0)
						add(new (Round_Enemy));
					}
				}
			}
			
			if (GV.Score > 10000)
			{
				if(this.classCount(Player) != 0)
				{
					if(this.classCount(Star_Enemy) == 0 || FP.random > GC.STAR_ENEMY_SPAWN_CHANCE)
					{
						if(FP.rand(1) ==0)
						add(new (Star_Enemy));
					}
				}
			}
			
			if (GV.Score > 20000)
			{
				if(this.classCount(Player) != 0)
				{
					if(this.classCount(Triangle_Enemy) == 0 || FP.random > GC.TRIANGLE_ENEMY_SPAWN_CHANCE)
					{
						if(FP.rand(1) ==0)
						add(new (Triangle_Enemy));
					}
				}
			}
			
			if (GV.Score > 50000)
			{
				if(this.classCount(Player) != 0)
				{
					if(this.classCount(Diamond_Enemy) == 0 || FP.random > GC.DIAMOND_ENEMY_SPAWN_CHANCE)
					{
						if(FP.rand(1) ==0)
						add(new (Diamond_Enemy));
					}
				}
			}
			
			if (GV.Score > 70000)
			{
				if(this.classCount(Player) != 0)
				{
					if(this.classCount(Enemy2) == 0 || FP.random > GC.ENEMY2_SPAWN_CHANCE)
					{
						if(FP.rand(1) ==0)
						add(new (Enemy2));
						GC.ENEMY_SPAWN_CHANCE = .99;
					}
				}
			}
			
			if (GV.Score > 90000)
			{
				if(this.classCount(Player) != 0)
				{
					//FP.world = new BossWorld();
				}
			}
			
			
				
			ScoreText.text = GV.Score.toString();
			LivesText.text = GV.Lifecount.toString();
			if(this.classCount(Player) == 0 && this.classCount(Enemy) == 0)
			{
				GV.Score = GV.Score -500;
				GV.Lifecount = GV.Lifecount - 1;
				add(player);
				spawn.play(0.5);
				
			}
			
			if (GV.Lifecount == 0)
			{
				FP.world = new Game_Over();
			}
			
			if (GV.Score == 20000)
			{
				GV.Score = 20050
				GV.Lifecount = GV.Lifecount + 1;
				oneup.play(0.7);
			}
			
			if (Input.pressed(Key.M))
			{
				FP.volume = (FP.volume == 0) ? 1 : 0;
			}
			
				
			super.update();
		}
		
	}

}