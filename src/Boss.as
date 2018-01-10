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
	public class Boss extends Entity
	{
		[Embed(source="../assets/graphics/boss_sprite.png")]
		private const BOSS:Class;
		
		public var sprBoss:Spritemap = new Spritemap(BOSS, 268, 268);
		
		
		public function Boss(x:Number=0, y:Number=0)
		{
			super(x, y);
			this.setHitbox(160, 160, -55, -55);
			this.type = "enemy";
			sprBoss.add("move", [0, 1, 2, 3, 4], 14, true);
			graphic = sprBoss;
			sprBoss.play("move");
		}
		
		override public function update():void
		{
			//this.x += FP.elapsed*GC.BOSS_SPEED;
			//if (this.x == FP.screen.width) this.x -= FP.elapsed*GC.BOSS_SPEED;
			
			
			if (collide("bullet", x, y))
			{
				GV.Hitcount = (GV.Hitcount + 1);
			}
			
			if (collide("player", x, y))
			{
				FP.world.remove(this);
			}
			
			if (GV.Hitcount == 100)
			{
				FP.world.remove(this);
			}
			
			if (x < 0) x = 0;
			if (x > FP.screen.width - width) x = FP.screen.width - width;

			super.update();
		}
		
		//override protected function getScore():void
		{
			//GV.Score += GC.BOSS_VALUE;
		}
	}

}