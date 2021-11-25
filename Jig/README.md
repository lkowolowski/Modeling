# Jig
Jig to hold model airplanes at various heights/angles while you work on it.

# Additional bits you'll need
* (qty) 4 M5x18mm screws for the riser blocks
* (qty) 4 M5x10mm screws for holding the base together
* (qty) 4 M5x16mm butterfly screws for the nose, wing, and tail holders
* (qty) 12 M5 nuts
* (qty) 1 3mm/4mm hex driver (depends on the screw heads)

# Files
Globals.scad - global variables used everywhere

Modules.scad - Where all the modules live. These modules are called by other files to create the individual parts

Bar.scad - These (qty 4) form the base, and need to be held together with (qty) 4 M5x10 screws and (qty) 4 M5 nuts. The base can be expanded in any direction by adding additional bars. For each addition, you'll need another (qty) 2 M5x10 screws and (qty) 2 M5 nuts.

Riser.scad - The riser needs another M5 screw and nut (1 ea.) to hold it in place on the bar.  The riser has (qty) 2 slots to follow the guide on the bar. The riser can be rotated 90° if you want to work with dihedral in the wings.

Wing Holder Bottom.scad - This holds the tip of the wing, or the front/back if the riser has been rotated.  This needs (qty) 1 M5x10 screw and (qty) 1 M5 nut.  This also needs (qty) 2 5x3mm magnets inserted into the holes. Pay attention to polarity for the top and bottom.

Wing Holder Top.scad - This helps to hold the wing in place.  This needs (qty) 2 5x3mm magnets inserted into the holes. Pay attention to polarity for the top and bottom.

Nose Holder.scad - This holds the nose in place. It needs (qty) 1 M5x10 screw and (qty) 1 M5 nut.

Tail Holder Bottom.scad - This holds the tail in place. It needs (qty) 1 M5x10 screw and (qty) 1 M5 nut. This also needs (qty) 2 5x3mm magnets inserted into the holes. Pay attention to polarity for the top and bottom.

Tail Holder Top.scad - This helps to hold the tail in place.  This needs (qty) 2 5x3mm magnets inserted into the holes. Pay attention to polarity for the top and bottom.

# Notes
You should be able to print this on anything that is at least as big as an Ender 3.
