source "$LIBS_DIR/_myLibrary.sh"

# Change the Video Driver in a retroarch config file
function retroarch_set_video {
	
	echo "Updating: $1"

	case $2 in
		"opengl")
				store "$retroConf" "video_driver" "gl"
				store "$retroConf" "video_shader" ":\\\shaders\\\retroarch.glslp"
				;;
		"vulkan")
				store "$retroConf" "video_driver" "vulkan"
				store "$retroConf" "video_shader" ":\\\shaders\\\retroarch.slangp"
				;;
		"d3d11")
				store "$retroConf" "video_driver" "d3d11"
				store "$retroConf" "video_shader" ""
				;;
		*)
				echo "Unknow Video Driver"
				;;
	esac
}

# Change the Menu Driver in a retroarch config file
function retroarch_set_menu {
	
	echo "Updating: $1"

	case $2 in
		"xmb")
				store "$retroConf" "menu_driver" "xmb"
				;;
		"glui")
				store "$retroConf" "menu_driver" "glui"
				;;
		"rgui")
				store "$retroConf" "menu_driver" "rgui"
				;;
		*)
				echo "Unknow Menu Driver"
				;;
	esac
}

# Change the Frame Options in a retroarch config file
function retroarch_set_frame {
	
	echo "Updating: $1"

	case $2 in
		"lag-reduction")
				store "$retroConf" "menu_driver" "xmb"
				;;
		*)
				echo "Unknow Menu Driver"
				;;
	esac
}

# Change 4DO speficic options in a retroarch-core config file
function sys_4do {
	
	echo "Updating: $1"

	case $2 in
		"hack-crashburn")
				store "$retroConf" "4do_hack_timing_1" "$3"
				;;
		"hack-dinopark")
				store "$retroConf" "4do_hack_timing_3" "$3"
				;;
		"hack-microcosm")
				store "$retroConf" "4do_hack_timing_5" "$3"
				;;
		"hack-aitd")
				store "$retroConf" "4do_hack_timing_6" "$3"
				;;
		"hack-samurai")
				store "$retroConf" "4do_hack_graphics_step_y" "$3"
				;;
		*)
				echo "Unknow 4DO Core Options"
				;;
	esac
}