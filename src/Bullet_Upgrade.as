package  
{
	import flash.display.Bitmap;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import flash.display.BitmapData;
	
	/**
	 * ...
	 * @author Collin Daugherty
	 */
	public class Bullet_Upgrade extends Entity 
	{
		
		public function Bullet_Upgrade(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			this.setHitbox(12, 6);
			this.graphic = new Image(GC.GFX_BULLET_UPGRADE)
			this.type = "bullet";
		}
		
		override public function update():void
		{
			y -= FP.elapsed * GC.BULLET_UPGRADE_SPEED;
			if (y < -height) this.world.remove(this);
			
			if (collide("enemy", x, y))
			{
				FP.world.remove(this);
			}
			
			super.update();
		}
		
		override public function removed():void
		{
			super.removed();
		}
	}

}