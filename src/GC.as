package  
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author Collin Daugherty
	 */
	public class GC 
	{
		[Embed(source = "../assets/graphics/player.png")]
		public static const GFX_PLAYER:Class;
		
		
		[Embed(source = "../assets/graphics/player_upgrade.png")]
		public static const GFX_PLAYER_UPGRADE:Class;
		
		
		[Embed(source="../assets/graphics/enemy.png")]
		public static const GFX_ENEMY:Class;
		
		
		[Embed(source="../assets/graphics/round_enemy.png")]
		public static const GFX_ROUND_ENEMY:Class;
		
		
		[Embed(source="../assets/graphics/triangle_enemy.png")]
		public static const GFX_TRIANGLE_ENEMY:Class;
		
		
		[Embed(source = "../assets/graphics/diamond_enemy.png")]
		public static const GFX_DIAMOND_ENEMY:Class;
		
		
		[Embed(source="../assets/graphics/small_enemy.png")]
		public static const GFX_SMALL_ENEMY:Class;
		
		
		[Embed(source = "../assets/graphics/bullet.png")]
		public static const GFX_BULLET:Class;
		
		public static const BULLET_SPEED:Number = 220;
		
		
		[Embed(source = "../assets/graphics/bullet_upgrade.png")]
		public static const GFX_BULLET_UPGRADE:Class;
		
		public static const BULLET_UPGRADE_SPEED:Number = 300;
		
		
		
		public static const ENEMY_SPEED:Number = 85;
		public static var ENEMY_SPAWN_CHANCE:Number = 0.98;
		public static const ENEMY_VALUE:Number = 50;
		
		
		public static const ROUND_ENEMY_SPEED:Number = 95;
		public static const ROUND_ENEMY_SPAWN_CHANCE:Number = 0.99;
		public static const ROUND_ENEMY_VALUE:Number = 100;
		
		
		public static const STAR_ENEMY_SPEED:Number = 110;
		public static const STAR_ENEMY_SPAWN_CHANCE:Number = 0.99;
		public static const STAR_ENEMY_VALUE:Number = 200;
		
		
		public static const TRIANGLE_ENEMY_SPEED:Number = 165;
		public static const TRIANGLE_ENEMY_SPAWN_CHANCE:Number = 0.99;
		public static const TRIANGLE_ENEMY_VALUE:Number = 500;
		
		public static const DIAMOND_ENEMY_SPEED:Number = 185;
		public static const DIAMOND_ENEMY_SPAWN_CHANCE:Number = 0.99;
		public static const DIAMOND_ENEMY_VALUE:Number = 800;
		
		public static const ENEMY2_SPEED:Number = 195;
		public static const ENEMY2_SPAWN_CHANCE:Number = 0.99;
		public static const ENEMY2_VALUE:Number = 800;
		
		public static const SMALL_ENEMY_SPEED:Number = 205;
		public static const SMALL_ENEMY_SPAWN_CHANCE:Number = 0.9;
		public static const SMALL_ENEMY_VALUE:Number = 10;
		
		
		public static const BOSS_SPEED:Number = 150;
		public static const BOSS_VALUE:Number = 10000;
		
		
		public static const TYPE_ENEMY:String = "Enemy";
		public static const TYPE_BULLET:String = "Bullet";
		
		
		
		[Embed(source = "../assets/graphics/background2.png")]
		public static const BACKGROUND:Class;
		
		[Embed(source = "../assets/graphics/startscreen.png")]
		public static const STARTSCREEN:Class;
		
		
		[Embed(source = "../assets/graphics/volume.png")]
		public static const VOLUME:Class;
		
		[Embed(source = "../assets/graphics/volume_mute.png")]
		public static const VOLUME_MUTE:Class;
		
		
	}

}