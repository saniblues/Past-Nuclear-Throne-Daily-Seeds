#define step
	if array_length_1d(instances_matching(CustomDraw,"name","bandithud")) = 0{
		with(instances_matching(CustomDraw,"name","bandithud")){
			instance_destroy();
		}
		with(script_bind_draw(bandithud,-10001)){
			name = "bandithud";
			persistent = true;
		}
	}
	
#define bandithud 
	with(instances_matching_gt(Player,"my_health",0)){
		draw_set_projection(2,index);
		// Starting position of the HUD. 
		var xst = view_xview_nonsync + 22, yst = view_yview_nonsync + 6, wid = 84, hig = 8;
		
		// In Multiplayer, shift the HUD leftward slightly
		// I don't know if this differs between versions so we're just using a convenient variable
		var _leftShift_Amount = 17; 
		if player_is_active(1) xst -= _leftShift_Amount;
		// As this code was gutted from Bandit (vagabonds), it will simply draw a yellow screen over the HUD
		//   Contextually it will overlay it when he's using his active, indicating he has full damage immunity,
		//   but that is not important. Play vagabonds, "please"
		{
			var strength = 0;
			// Lower hud
			draw_set_color(c_red);
			draw_set_blend_mode(bm_add);
			draw_rectangle(xst - strength,yst - (strength * 0.33),xst + wid + strength, yst + hig + (strength * 0.33), 0);
			draw_set_blend_mode(bm_normal);
			// Upper hud and text
			var xst = view_xview_nonsync + 21, yst = view_yview_nonsync + 5, wid = 85, hig = 10;
			if player_is_active(1) xst -= _leftShift_Amount;
			draw_set_color(c_yellow);
			draw_rectangle(xst - strength,yst - (strength * 0.33),xst + wid + strength, yst + hig + (strength * 0.33), 1);
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_blend_mode(bm_normal);
		}
	}