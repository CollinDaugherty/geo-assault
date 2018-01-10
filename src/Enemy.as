package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import Bullet
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.Sfx;

	
	/**
	 * ...
	 * @author Collin Daugherty
	 */
	public class Enemy extends Entity 
	{
		[Embed(source="../assets/graphics/enemy_sprite.png")]
		private const ENEMY:Class;
		
		public var sprEnemy:Spritemap = new Spritemap(ENEMY, 32, 32);
		
		
		[Embed(source = "../assets/sounds/kill.mp3")]
		private const KILL:Class;
		
		public var kill:Sfx = new Sfx(KILL);
		
		
		public function Enemy() 
		{
			super(FP.rand(FP.screen.width - 10), -10);
			//this.graphic = new Image(GC.GFX_ENEMY);
			this.setHitbox(16, 16, -7, -7);
			this.type = "enemy";
			sprEnemy.add("move", [0, 1, 2, 3, 4], 18, true);
			graphic = sprEnemy;
			sprEnemy.play("move");
		}
		
		override public function update():void
		{
			this.y += FP.elapsed*GC.ENEMY_SPEED;
			if (this.y > FP.screen.height) this.world.remove(this);
			
			if (collide("bullet", x, y))
			{
				FP.world.remove(this);
				this.getScore();
				kill.play(0.4);
			}
			
			if (collide("player", x, y))
			{
				FP.world.remove(this);
			}
			
			if (x < 0) x = 0;
			if (x > FP.screen.width - width) x = FP.screen.width - width;

			super.update();
		}
		
		protected function getScore():void
		{
			GV.Score += GC.ENEMY_VALUE;
		}
	}

}