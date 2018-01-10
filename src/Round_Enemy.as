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
	public class Round_Enemy extends Enemy
	{
		//[Embed(source="../assets/graphics/round_enemy_sprite.png")]
		//private const ROUNDENEMY:Class;
		
		//public var sprRoundEnemy:Spritemap = new Spritemap(ROUNDENEMY, 24, 24);
		
		
		public function Round_Enemy() 
		{
			this.graphic = new Image(GC.GFX_ROUND_ENEMY);
			this.setHitbox(16, 16);
			this.type = "enemy";
			//sprRoundEnemy.add("move", [0, 1,], 4, true);
			//graphic = sprRoundEnemy;
			//sprRoundEnemy.play("move");
		}
		
		override public function update():void
		{
			this.y += FP.elapsed*GC.ROUND_ENEMY_SPEED;
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
			GV.Score += GC.ROUND_ENEMY_VALUE;
		}
	}

}