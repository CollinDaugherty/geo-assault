package 
{
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import net.flashpunk.Screen;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author YopSolo
	 */
	public class ScreenRetro extends Screen
	{
		public function ScreenRetro() 
		{
			// SCANLINES TYPES
			const HORIZONTAL:Array = [[1], [0]];
			
			const VERTICAL:Array = [[1, 0]];
			
			const DIAGONAL:Array = [[0, 0, 1],
									[0, 1, 0],									
									[1, 0, 0]];
									
			const INV_DIAGONAL:Array = [[1, 0, 0],
										[0, 1, 0],									
										[0, 0, 1]];
										
			const GRID:Array 	= 	[[1, 0],
									[0, 1]];
									
			const DOUBLE_GRID:Array = [[1, 0, 0, 1],
										[0, 1, 1, 0],			 
										[0, 1, 1, 0],
										[1, 0, 0, 1]];
										
			const RGB_FLAG:Array 	= 	[[0,1, 2],
										[0,1, 2],
										[0,1, 2]];
			// COLORS
			const BLACK:Array		= [0x40000000, 0x00FFFFFF];
			const RGB:Array			= [0x40CC0000, 0x4000CC00,0x400000CC];
										
			var scanlines:Sprite = new Sprite;
			var dat:BitmapData = build( HORIZONTAL, BLACK);	 // classic black horizontal scanlines		
			
			scanlines.graphics.beginBitmapFill( dat );
			scanlines.graphics.drawRect(0, 0, FP.width, FP.height);		// * 2	
			scanlines.graphics.endFill();			
			
			//scanlines.blendMode = BlendMode.OVERLAY;			
			
			FP.engine.addChild( scanlines );
			
		}
		
		public function build(pattern:Array, colors:Array):BitmapData 
		{
			var bitmapW:int = pattern[0].length;			
			var bitmapH:int = pattern.length;			
			var bmd:BitmapData = new BitmapData(bitmapW, bitmapH, true, 0x0);			
			for (var yy:int = 0; yy < bitmapH; yy++) {				
				for (var xx:int = 0; xx < bitmapW; xx++) {
					var color:int = colors[pattern[yy][xx]];
					bmd.setPixel32(xx, yy, color);
				}
			}
			return bmd;
		}
		
	}
	
}