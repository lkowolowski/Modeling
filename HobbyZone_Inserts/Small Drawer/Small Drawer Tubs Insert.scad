/*
 * © 2021 Louis Kowolowski
 *
 * Insert for small hobbyzone drawer to hold pe tools like saws, umm scribers,
 * and misc bits
 */
difference () {
	// whole insert as a cube
	color ("grey") cube ([79, 128, 55]);

	union () {
		// Bulk storage area
		translate ([1, 1, 2]) {
			color ("grey") cube ([77, 41, 54]);
		}

		translate ([1, 43, 2]) {
			color ("grey") cube ([77, 41, 54]);
		}

		translate ([1, 85, 2]) {
			color ("grey") cube ([77, 41, 54]);
		}

		translate ([39.5, -1, 54]) {
			rotate ([0, 90, 90]) {
				cylinder (5, d=31, $fn=80, true);
			}
		}
	}
}
