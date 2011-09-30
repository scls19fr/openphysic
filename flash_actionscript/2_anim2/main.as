// Application.as
class Application
{
	var container:MovieClip;

	function Application()
	{
		container = _root.createEmptyMovieClip( "container", 1 );

		for( var i=0; i<50; i++ )
		{
			makeBall( i );
		}

		var myShadow = new flash.filters.DropShadowFilter();
		myShadow.clone = true;
		myShadow.blurX = 20;
		myShadow.blurY = 20;
		myShadow.strength = 3;
		myShadow.hideObject = true;
		container.filters = [myShadow];
	}

	function makeBall( i )
	{
		var mc:MovieClip = container.createEmptyMovieClip( "clip_"+i, i );
		mc._x = Math.random()*Stage.width;
		mc._y = Math.random()*Stage.height;
		mc.beginFill( 0xff0000, 50 );

		var r=20;
		var x = 0;
		var y = 0;

		var c1=r*(Math.SQRT2-1);
		var c2=r*Math.SQRT2/2;
		mc.moveTo(x+r,y);
		mc.curveTo(x+r,y+c1,x+c2,y+c2);
		mc.curveTo(x+c1,y+r,x,y+r);
		mc.curveTo(x-c1,y+r,x-c2,y+c2);
		mc.curveTo(x-r,y+c1,x-r,y);
		mc.curveTo(x-r,y-c1,x-c2,y-c2);
		mc.curveTo(x-c1,y-r,x,y-r);
		mc.curveTo(x+c1,y-r,x+c2,y-c2);
		mc.curveTo(x+r,y-c1,x+r,y);

		mc.xSpeed = ( Math.random()*6 ) - 3;
		mc.ySpeed = ( Math.random()*6 ) - 3;

		mc.onEnterFrame = function()
		{
			this._x += mc.xSpeed;
			this._y += mc.ySpeed;

			if ( this._y < 0 )
				this._y = Stage.height;

			if( this._y > Stage.height )
				this._y = 0;

			if( this._x < 0 )
				this._x = Stage.width;

			if( this._x > Stage.width )
				this._x = 0;

			this._xscale = this._yscale = 20 + this._y*1.01;
		}
	}

	static function main()
	{
		var temp = new Application();
	}
}
