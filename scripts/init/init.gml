// A basic init script to use at the start of games with some features you might want
function init(){

	// Always randomise in release builds
	randomise();
	
	// Stop double-tap on touch screens resulting in a right-click firing
	// You should be catching this yourself!
	device_mouse_dbclick_enable(false);

}
