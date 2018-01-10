package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Collin Daugherty
	 */
	public class Player extends Entity 
	{
		
		[Embed(source="../assets/sounds/death.mp3")]
		private const DEATH:Class;
		
		[Embed(source="../assets/sounds/shoot.mp3")]
		private const SHOOT:Class;
		
		[Embed(source="../assets/sounds/shoot2.mp3")]
		private const SHOOT2:Class;
		
		[Embed(source = "../assets/sounds/upgrade.mp3")]
		private const UPGRADE:Class;
		
		
		public var death:Sfx = new Sfx(DEATH);
		public var shoot:Sfx = new Sfx(SHOOT);
		public var shoot2:Sfx = new Sfx(SHOOT2);
		public var upgrade:Sfx = new Sfx(UPGRADE);
		
		
		public function Player(x:Number=0, y:Number=0) 
		{
			super(x, y);
			graphic = new Image(GC.GFX_PLAYER);
			this.setHitbox(16, 16, -4, -4);
			this.type = "player";
		}
		
		
		override public function update():void
		{
			if (Input.check(Key.RIGHT))
			{
				x += 190 * FP.elapsed;
			}
			if (Input.check(Key.LEFT))
			{
				x -= 190 * FP.elapsed;
			}
			
			if (x < 0) x = 0;
			if (x > FP.screen.width - width) x = FP.screen.width - width;
			
			if (GV.Score < 30050)
			{
				if (Input.pressed(Key.SPACE))
				{
					this.world.add(new Bullet(x + 10, y - 3));
					shoot.play(0.3);
				}
			
				if (Input.mousePressed)
				{
					this.world.add(new Bullet(x + 10, y - 3));
					shoot.play(0.3);
				}
			}
			
			if (GV.Score > 30000)
			{
				if (Input.pressed(Key.SPACE))
				{
					this.world.add(new Bullet_Upgrade(x + 10, y - 3));
					shoot2.play(0.25);
				}
			
				if (Input.mousePressed)
				{
					this.world.add(new Bullet_Upgrade(x + 10, y - 3));
					shoot2.play(0.25);
				}
			}
			
			
			if (GV.Score > 30000)
			{
				graphic = new Image(GC.GFX_PLAYER_UPGRADE);
				upgrade.play(0.5);
			}
			
			
			
			if (collide("enemy", x, y))
			{
				FP.world.remove(this);
				death.play(0.5);
			}
			
			if (collide("bullet", x, y))
			{
				FP.world.remove(this);
				death.play(0.5);
			}
			
			
			super.update();
		}
		
	}

}