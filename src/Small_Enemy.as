package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import Bullet
	import net.flashpunk.graphics.Spritemap;

	
	/**
	 * ...
	 * @author Collin Daugherty
	 */
	public class Small_Enemy extends Enemy
	{

		public function Small_Enemy() 
		{
			this.graphic = new Image(GC.GFX_SMALL_ENEMY);
			this.setHitbox(2, 2);
			this.type = "enemy";
		}
		
		override public function update():void
		{
			this.y += FP.elapsed*GC.SMALL_ENEMY_SPEED;
			if (this.y > FP.screen.height) this.world.remove(this);
			
			if (collide("bullet", x, y))
			{
				FP.world.remove(this);
				this.getScore();
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
			GV.Score += GC.SMALL_ENEMY_VALUE;
		}
	}

}