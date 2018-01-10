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
	public class Enemy2 extends Enemy 
	{
		[Embed(source="../assets/graphics/enemy2_sprite.png")]
		private const ENEMY2:Class;
		
		public var sprEnemy2:Spritemap = new Spritemap(ENEMY2, 32, 32);
		
		
		public function Enemy2() 
		{
			//super(FP.rand(FP.screen.width - 10), -10);
			//this.graphic = new Image(GC.GFX_ENEMY);
			this.setHitbox(16, 16, -7, -7);
			this.type = "enemy";
			sprEnemy2.add("move", [0, 1, 2, 3, 4], 21, true);
			graphic = sprEnemy2;
			sprEnemy2.play("move");
		}
		
		override public function update():void
		{
			this.y += FP.elapsed*GC.ENEMY2_SPEED;
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
		
		override protected function getScore():void
		{
			GV.Score += GC.ENEMY2_VALUE;
		}
	}

}