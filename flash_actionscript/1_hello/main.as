class Tuto {

	static var app : Tuto;

	function Tuto() {
		// creates a 'tf' TextField size 800x600 at pos 0,0
		_root.createTextField("tf",0,0,0,800,600);
		// write some text into it
		_root.tf.text = "Hello world !";
	}

	// entry point
	static function main(mc) {
		app = new Tuto();
	}
}
