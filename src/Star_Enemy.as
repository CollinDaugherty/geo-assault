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
	public class Star_Enemy extends Enemy
	{
		[Embed(source="../assets/graphics/star_enemy_sprite.png")]
		private const STARENEMY:Class;
		
		public var sprStarEnemy:Spritemap = new Spritemap(STARENEMY, 24, 24);
		
		
		public function Star_Enemy() 
		{
			this.setHitbox(16, 16, -4, -4);
			this.type = "enemy";
			sprStarEnemy.add("move", [0, 1, 2, 3, 4], 20, true);
			graphic = sprStarEnemy;
			sprStarEnemy.play("move");
		}
		
		override public function update():void
		{
			this.y += FP.elapsed*GC.STAR_ENEMY_SPEED;
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
			GV.Score += GC.STAR_ENEMY_VALUE;
		}
	}

}