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
	public class Bullet extends Entity 
	{
		
		public function Bullet(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			this.setHitbox(2, 2);
			this.graphic = new Image(GC.GFX_BULLET)
			this.type = "bullet";
		}
		
		override public function update():void
		{
			y -= FP.elapsed * GC.BULLET_SPEED;
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