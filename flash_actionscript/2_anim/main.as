// Test.as
class Test
{
	function Test()
	{
		var mc:MovieClip = _root.createEmptyMovieClip( "myClip", 1 );
		mc._x = mc._y = 100;
		mc.beginFill( 0xff0000, 100 );
		mc.moveTo(0,0);
		mc.lineTo(100,0);
		mc.lineTo(100,100);
		mc.lineTo(0,100);
		mc.lineTo(0,0);
		var myBlur = new flash.filters.BlurFilter();
		myBlur.clone = true;
		myBlur.blurX = 20;
		myBlur.blurY = 20;
		mc.filters = [myBlur];
	}

	static function main()
	{
		var temp = new Test();
	}
}

