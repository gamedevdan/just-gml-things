// Check if the calling object is in the view
function in_view(_viewCam){

	if (x >= camera_get_view_x(_viewCam) &&
	x <= (camera_get_view_x(_viewCam)+camera_get_view_width(_viewCam)) &&
	y >= camera_get_view_y(_viewCam) &&
	y <= (camera_get_view_y(_viewCam)+camera_get_view_height(_viewCam))) {
		
		return true;
		
	} else {
	
		return false;
		
	}

}
