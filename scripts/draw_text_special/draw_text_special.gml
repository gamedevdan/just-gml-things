// Draw text with color tags and embedded images
// use [S=#] in your text to draw a sprite with the image index # in the middle of the string
// use [C=COLORNAME] in your text to change the text color on the fly. These colors must be define in the switch block further down this script.
function draw_text_special(_x,_y,_string,_scale,_maxwidth,_imageSprite){

	// Set up variables for use in this script.
	var tb_xstart = _x;
	var tb_ystart = _y;
	var tb_xnow = tb_xstart;
	var tb_ynow = tb_ystart;
	var tb_fullstring = _string;
	var tb_currentstring = "";
	var tb_stringremain = tb_fullstring;
	var tb_letter = "";
	var tb_scale = _scale;
	var tb_maxwidth = _maxwidth;
	var tb_sprite = _imageSprite;
	var tb_sprite_scale = 1;
	var tb_sprite_width = string_width("W");
	if (sprite_exists(tb_sprite)) {
		
		tb_sprite_scale = (string_height("MgMg")/sprite_get_height(tb_sprite))*tb_scale;
		tb_sprite_width = sprite_get_width(tb_sprite)*tb_sprite_scale;
		
	}
	var tb_padding = 0;
	var tb_drawcolor = draw_get_color();
	var tb_drawalpha = draw_get_alpha();
	var tb_halign = draw_get_halign();
	var tb_valign = draw_get_valign();
	var tb_tagstring = "";
	var tb_tagwidth = 0;
	var tb_color = tb_drawcolor;

	// Reset alignment to left-top as we handle this ourselves.
	// This is set back to the correct value at the end of the script.
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	// Recalibrate starting Y depending on valign.
	if (tb_valign == fa_middle) {
	
		tb_ystart -= round(string_height_ext(tb_fullstring,-1,tb_maxwidth/max(tb_scale,0.01))/2)*tb_scale;
	
	} else if (tb_valign == fa_bottom) {
	
		tb_ystart -= string_height_ext(tb_fullstring,-1,tb_maxwidth/max(tb_scale,0.01))*tb_scale;
	
	}

	// Recalibrate starting X depending on halign.
	if (tb_halign == fa_center) {
	
		tb_xstart = tb_xnow - round(string_width_ext(tb_fullstring,-1,tb_maxwidth/max(tb_scale,0.01)/2)*tb_scale);
	
	} else if (tb_halign == fa_right) {
	
		tb_xstart = tb_xnow - (string_width_ext(tb_fullstring,-1,tb_maxwidth/max(tb_scale,0.01))*tb_scale);
	
	}

	tb_xnow = tb_xstart;
	tb_ynow = tb_ystart;

	// Processing the text
	#region Process Text

		// Loop through the string
		for (var tb_i=1; tb_i < string_length(tb_fullstring)+1; tb_i++) {
		
			tb_letter = string_char_at(tb_fullstring,tb_i);
			var tb_notaletter = 0;
		
			// If we hit a [] "tag"
			if (tb_letter == "[") {
			
				#region Handle SPRITE tag [S=imageindextodraw]
			
					if (string_char_at(tb_fullstring,tb_i+1)=="S") {
				
						tb_i += 2;
				
						var tb_thisimage = "";
		
						do {
					
				            tb_i += 1;
					
				            if !(string_char_at(tb_fullstring,tb_i) == "]") {
						
				                tb_thisimage += string_char_at(tb_fullstring,tb_i);
						
				            }
					
				        } until (string_char_at(tb_fullstring,tb_i) == "]" || tb_i >= string_length(tb_fullstring)+1)
               
						if !(tb_thisimage == "") && (string_digits(tb_thisimage)==tb_thisimage) {
		
							tb_thisimage = round(real(tb_thisimage));
						
							if (sprite_exists(tb_sprite)) {
						
								draw_sprite_ext(tb_sprite,tb_thisimage,tb_xnow,tb_ynow,tb_sprite_scale,tb_sprite_scale,0,c_white,tb_drawalpha);
						
							}
			
							tb_padding += tb_sprite_width;
							tb_xnow += tb_sprite_width;
		
						}
					
					}
				
				#endregion 
				
				#region Handle COLOR tag [C=color] 
				
					if (string_char_at(tb_fullstring,tb_i+1)=="C") {
				
						tb_i += 2;

						var tb_thiscolor = "";
		
						do {
						
					        tb_i += 1;
						
					        if !(string_char_at(tb_fullstring,tb_i) == "]") {
							
					            tb_thiscolor += string_char_at(tb_fullstring,tb_i);
							
					        }
						
					    } until (string_char_at(tb_fullstring,tb_i) == "]" || tb_i >= string_length(tb_fullstring)+1)
			
						switch (tb_thiscolor) {
							case "DEFAULT":		tb_color = tb_drawcolor;		break;
							case "END":			tb_color = tb_drawcolor;		break;
							case "RED":			tb_color = c_red;				break;
							case "YELLOW":		tb_color = c_yellow;			break;
							case "GREEN":		tb_color = c_green;				break;
							case "BLUE":		tb_color = c_blue;				break;
						}
					
					}
				
				#endregion
				
				tb_notaletter = 1;
			
			}
		
			#region If we hit a space, check whether or not the next word will be on a new line
		
				if (tb_letter = " ") {
		
					var tb_spacecheck = tb_i;
					var tb_wordcheck = "";
			
					do {
            
			            tb_spacecheck++;
        
			            if !(string_char_at(tb_fullstring,tb_spacecheck) == " ") {
			                tb_wordcheck += string_char_at(tb_fullstring,tb_spacecheck);
			            }
        
			        } until (tb_spacecheck >= string_length(tb_fullstring) || string_char_at(tb_fullstring,tb_spacecheck) == " ")
        
			        if (ceil((string_width(tb_currentstring+" "+tb_wordcheck)*tb_scale)+tb_padding) <= tb_maxwidth) {

			            draw_text_transformed(tb_xnow,tb_ynow,tb_letter,tb_scale,tb_scale,0);
			            tb_currentstring += tb_letter;
			            tb_xnow= tb_xstart + ceil(string_width(tb_currentstring)*tb_scale)+tb_padding;
        
			        } else {
			
						// If the word won't fit, go to a new line instead (see next code block)
						tb_letter = "#";
				
					}
			
					tb_notaletter = 1;
			
				}
		
			#endregion
		
			#region If we hit a newline character (# or \n)
		
				if (tb_letter == "#") || ((tb_letter=="\\") && (string_char_at(tb_letter,tb_i+1)=="n")) {
			
					tb_xnow = tb_xstart;
					tb_ynow += string_height("MgMg")*tb_scale;
					tb_currentstring = "";
					tb_padding = 0;
				
					tb_notaletter = 1;
			
				}
		
			#endregion
		
			if (tb_notaletter == 0) {
			
				draw_set_color(tb_color);
				draw_set_alpha(tb_drawalpha);
				draw_text_transformed(tb_xnow,tb_ynow,tb_letter,tb_scale,tb_scale,0);
			
				tb_currentstring += tb_letter;
		        tb_xnow = tb_xstart+ceil(string_width(tb_currentstring)*tb_scale)+tb_padding;
			
			}
			
		}

	#endregion


	// Set draw values back to the correct amount.
	draw_set_color(tb_drawcolor);
	draw_set_alpha(tb_drawalpha);
	draw_set_halign(tb_halign);
	draw_set_valign(tb_valign);


}
