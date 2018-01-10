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
	public class Triangle_Enemy extends Enemy
	{
		//[Embed(source="../assets/graphics/triangle_enemy_sprite.png")]
		//private const TRIANGLEENEMY:Class;
		
		//public var sprTriangleEnemy:Spritemap = new Spritemap(TRIANGLEENEMY, 24, 24);
		
		
		public function Triangle_Enemy() 
		{
			this.graphic = new Image(GC.GFX_TRIANGLE_ENEMY);
			this.setHitbox(16, 16, -4, -4);
			this.type = "enemy";
			//sprTriangleEnemy.add("move", [0, 1,], 5, true);
			//graphic = sprTriangleEnemy;
			//sprTriangleEnemy.play("move");
		}
		
		override public function update():void
		{
			this.y += FP.elapsed*GC.TRIANGLE_ENEMY_SPEED;
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
			GV.Score += GC.TRIANGLE_ENEMY_VALUE;
		}
	}

}