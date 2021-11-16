/*
 * © 2021 Louis Kowolowski
 *
 * Insert for small hobbyzone drawer to hold pe tools like saws, umm scribers,
 * and misc bits
 */
difference () {
	// whole insert as a cube
	color ("grey") cube ([79, 128, 10]);

	union () {
		// pe tool slots are 1mm wide
		// Full length slots
		for (i = [ 1:2:20 ] ) {
			translate ([i, 1, 2]) {
				color ("blue") cube ([1, 126, 9]);
			}
		}
		// scriber slots are 2mm wide
		for (i = [ 21:3:37 ] ) {
			translate ([i, 1, 2]) {
				color ("blue") cube ([2, 126, 9]);
			}
		}
		// Bulk storage area
		translate ([42, 1, 2]) {
			color ("grey") cube ([36, 126, 9]);
		}

		// low cutout to easily get things with fingers
		// Front cuts
		for (i= [ 11:15:124 ] ) {
			translate ([2, i, 24]) {
				rotate ([0, 90, 0]) {
					cylinder (h=35, d=32, center=false, $fn=80);
				}
			}
		}
	}
}
// Front half is shallower than back half (not including scriber/misc
// area) for shorter tools so they don't get lost
translate ([1, 1, 2]) {
	color ("green") cube ([20, 62, 2]);
}
// handle to lift insert out of drawer
translate ([38, 54, 0]) {
	color ("grey") cube ([4, 20, 25]);
}
