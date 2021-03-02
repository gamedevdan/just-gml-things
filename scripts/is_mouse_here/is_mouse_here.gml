// Check if the mouse is in a rectangle
function is_mouse_here(_x1,_y1,_x2,_y2){

	if (point_in_rectangle(mouse_x,mouse_y,_x1,_y1,_x2,_y2)) {
		
		return true;
		
	} else {
		
		return false;	
		
	}

}
