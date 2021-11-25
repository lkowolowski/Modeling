/*
 * Jig to hold a model airplane while working on it.
 *
 * Vertical sections slide horizonally. Horizontal dimensions are scalable
 * by adding one or more extension bars.
 *
 * Wing supports clamp magnetically. Be sure to glue some felt on the
 * insides of the wing supports to protect the model
 *
 * ©Louis Kowolowski 2020
 */

module tail_holder () {
	translate ([3*bar_w, 0, 10]) {
		rotate ([0, 180, 0]) {
			tail_holder_bottom ();
		}
	}
	// height is +5 (thickness of top) because its been flipped over
	translate ([0, 0, -7]) {
		tail_holder_top ();
	}
}

module tail_holder_bottom () {
	difference () {
		cube ([3*bar_w, 1.5*bar_screw_head_d, bar_w/4]);

		union () {
			// screw/nut hole
			translate ([1.5*bar_w, 1.5*bar_screw_head_d+0.001, bar_w/8]) {
				rotate ([90, 0, 0]) {
					bar_screw ();
				}
			}
			// left magnet hole
			translate ([0.75*bar_screw_head_d, 1.5*bar_screw_d, bar_w/4-magnet_h+0.001]) {
				cylinder (magnet_h, d=magnet_d, $fn=80);
			}
			// right magnet hole
			translate ([(3*bar_w)-(0.75*bar_screw_head_d), 1.5*bar_screw_d, bar_w/4-magnet_h+0.001]) {
				cylinder (magnet_h, d=magnet_d, $fn=80);
			}
		}
	}
	// left side
	translate ([0, 1.5*bar_screw_head_d, 0]) {
		cube ([bar_w, bar_w, 5]);
	}

	// right side
	translate ([2*bar_w, 1.5*bar_screw_head_d, 0]) {
		cube ([bar_w, bar_w, 5]);
	}

}

module tail_holder_top () {

	difference () {
		cube ([3*bar_w, 1.5*bar_screw_head_d, 5]);
		union () {
			// left magnet hole
			translate ([0.75*bar_screw_head_d, 1.5*bar_screw_d, 5.001-magnet_h]) {
				cylinder (magnet_h, d=magnet_d, $fn=80);
			}
			// right magnet hole
			translate ([(3*bar_w)-(0.75*bar_screw_head_d), 1.5*bar_screw_d, 5.001-magnet_h]) {
				cylinder (magnet_h, d=magnet_d, $fn=80);
			}
		}
	}
	// left side
	translate ([0, 1.5*bar_screw_head_d, 0]) {
		cube ([bar_w, bar_w, 5]);
	}

	// right side
	translate ([2*bar_w, 1.5*bar_screw_head_d, 0]) {
		cube ([bar_w, bar_w, 5]);
	}
}

module nose_holder () {
	difference () {
		union () {
			cube ([bar_w, bar_w, 6]);
			translate ([0, 0, 6]) {
				// rear block to house screw/nut holder and magnets for top
				cube ([bar_screw_head_d, bar_w, 1.5*bar_screw_head_d]);
			}
			translate ([0, 0, 6]) {
				// rear block to house screw/nut holder and magnets for top
				cube ([bar_w, bar_w, 1.5*bar_screw_head_d]);
			}
		}
		union () {
			// screw/nut hole
			translate ([bar_screw_head_d+1, bar_w/2, 10]) {
				rotate ([0, 270, 0]) {
					bar_screw ();
				}
			}
			// angled cut to hold nose centered in jib
			translate ([bar_w/2+.5*bar_screw_head_d+0.001, bar_w/2, bar_w/2-5]) {
				rotate ([270, 210, 90]) {
					Triangle(a=bar_w, b=bar_w, angle=120, height=bar_w-bar_screw_head_d+0.001, centerXYZ=[true,true,true]);
				}
			}
			
		}
	}
}


module wing_holder () {
	wing_holder_bottom ();

	translate ([0, 0, 1.5*bar_screw_head_d+2]) {
		wing_holder_top ();
	}
}

module wing_holder_bottom () {
	// slides up and down the riser to hold the wing at the correct height
	difference () {
		union () {
			cube ([bar_w, bar_w, 6]);
			translate ([0, 0, 6]) {
				// rear block to house screw/nut holder and magnets for top
				// add 1 to height for room above the nut
				cube ([bar_screw_head_d, bar_w, bar_screw_head_d+1]);
			}
		}
		union () {
			// screw/nut hole
			translate ([bar_screw_head_d+1, bar_w/2, 11]) {
				rotate ([0, 270, 0]) {
					bar_screw ();
				}
			}
			// magnet mounting holes
			translate ([magnet_d/2+2, magnet_d, bar_screw_head_d+4.001]) {
				rotate ([0, 0, 90]) {
					cylinder (magnet_h, d=magnet_d, $fn=80);
				}
			}
			// magnet mounting holes
			translate ([magnet_d/2+2, bar_w-magnet_d, bar_screw_head_d+4.001]) {
				rotate ([0, 0, 90]) {
					cylinder (magnet_h, d=magnet_d, $fn=80);
				}
			}
		}
	}
}

module wing_holder_top () {
	difference () {
		cube ([bar_w, bar_w, 6]);
		union () {
			// magnet mounting holes
			translate ([bar_w-magnet_d, magnet_d, -1*0.001]) {
				rotate ([0, 0, 90]) {
					cylinder (magnet_h, d=magnet_d, $fn=80);
				}
			}
			// magnet mounting holes
			translate ([bar_w-magnet_d, bar_w-magnet_d, -1*0.001]) {
				rotate ([0, 0, 90]) {
					cylinder (magnet_h, d=magnet_d, $fn=80);
				}
			}
		}
	}
}

module riser () {
	/* vertical bar that will slide forward/backward on the base and hold the
	 * horizontal rest(s) for the model
	 */
	difference () {
		// base
		cube ([riser_w, riser_w, riser_w/4]);	
		union () {
			// slot at bottom for guide on bar
			translate ([riser_w/4, -1*0.001, -1*0.01]) {
				cube ([riser_w/2, riser_w+1, 5.01]);
			}
			// cross slot at bottom for guide on bar
			translate ([-0.001, riser_w/4, -1*0.01]) {
				cube ([riser_w+1, riser_w/2, 5.01]);
			}
			// screw hole
			translate ([riser_w/2, riser_w/2, -1*bar_screw_head_h]) {
				bar_screw ();
			}
		}
	}
	difference () {
		// vartical riser
		translate ([0, 0, riser_w/4]) {
			cube ([riser_w, riser_w/8, riser_l]);
		}
		// screw slot
		translate ([riser_w/2-bar_screw_d/2, -1, riser_w]) {
			cube ([bar_screw_d, riser_w/4+1, riser_l-riser_w]);
		}
	}
}

module bar_screw () {
	// Model of a screw and hex head/nut

	// screw head
	cylinder(bar_screw_head_h, d=bar_screw_head_d, $fn=6);
	translate ([0, 0, 0]) {
		// screw body
		cylinder(bar_screw_h, d=bar_screw_d, $fn=80);
	}
}

module bar () {
	/* lower base unit. Comes together as a cross. Each bar can be extended with
	 * additional bars.
	 * Raised section acts as a guide for the riser. Slot down the middle is for
	 * a clamping butterfly screw.
	 */
	difference () {
		union () {
			cube ([bar_l, bar_w, bar_h]);
			translate ([0, bar_w/4, 0]) {
				// guide slot
				cube ([bar_l, bar_w/2, bar_h+5]);
			}
		}
		translate ([1, bar_w/2-bar_screw_d/2, -0.001]) {
			cube ([bar_l-2, bar_screw_d, bar_screw_h]);
		}
		translate ([1, bar_w/2-bar_screw_head_d/2, -0.001]) {
			 cube ([bar_l, bar_screw_head_d, bar_screw_head_h+1]);
		}
	}
	// upper extension
	difference () {
		translate ([bar_l, 0, bar_h/2]) {
			cube ([bar_w/4, bar_w, bar_h/2]);
		}
		union () {
			// 2 screw holes
			// left
			translate ([bar_l+bar_w/8, bar_w/8, -1*0.001]) {
				bar_screw ();
			}
			// right
			translate ([bar_l+bar_w/8, bar_w-bar_w/8, -1*0.001]) {
				bar_screw ();
			}
		}
	}
	// lower extension
	difference () {
		translate ([-1*bar_w/4, 0, 0]) {
			cube ([bar_w/4, bar_w, bar_h/2]);
		}
		union () {
			// 2 screw holes
			// left
			translate ([-1*bar_w/4+bar_w/8, bar_w/8, -1*0.001]) {
				bar_screw ();
			}
			// right
			translate ([-1*bar_w/4+bar_w/8, bar_w-bar_w/8, -1*0.001]) {
				bar_screw ();
			}
		}
	}

}

module Triangle(
			a, b, angle, height=1, heights=undef,
			center=undef, centerXYZ=[false,false,false]) {
	// Calculate Heights at each point
	heightAB = ((heights==undef) ? height : heights[0])/2;
	heightBC = ((heights==undef) ? height : heights[1])/2;
	heightCA = ((heights==undef) ? height : heights[2])/2;
	centerZ = (center || (center==undef && centerXYZ[2]))?0:max(heightAB,heightBC,heightCA);

	// Calculate Offsets for centering
	offsetX = (center || (center==undef && centerXYZ[0]))?((cos(angle)*a)+b)/3:0;
	offsetY = (center || (center==undef && centerXYZ[1]))?(sin(angle)*a)/3:0;
	
	pointAB1 = [-offsetX,-offsetY, centerZ-heightAB];
	pointAB2 = [-offsetX,-offsetY, centerZ+heightAB];
	pointBC1 = [b-offsetX,-offsetY, centerZ-heightBC];
	pointBC2 = [b-offsetX,-offsetY, centerZ+heightBC];
	pointCA1 = [(cos(angle)*a)-offsetX,(sin(angle)*a)-offsetY, centerZ-heightCA];
	pointCA2 = [(cos(angle)*a)-offsetX,(sin(angle)*a)-offsetY, centerZ+heightCA];

	polyhedron(
		points=[	pointAB1, pointBC1, pointCA1,
					pointAB2, pointBC2, pointCA2 ],
		faces=[	
			[0, 1, 2],
			[3, 5, 4],
			[0, 3, 1],
			[1, 3, 4],
			[1, 4, 2],
			[2, 4, 5],
			[2, 5, 0],
			[0, 5, 3] ] );
}

