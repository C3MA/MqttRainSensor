// Adapter for the Rainsensor "Rain Detector" #M152 from Kemo
$fn=120;
adapterHeight=15;

cornderRadius=3;

module adapter() { difference() {
    minkowski() {
            cube([45,65, adapterHeight/2]);
            cylinder(r=cornderRadius, h=adapterHeight/2);
    }
    union() {
        // fitting for bottom
        translate([1.5, 1.5, 0]) {
            minkowski() {
                    cube([42,62, 1.5]);
                    cylinder(r=cornderRadius, h=1.5);
            }
        }
        // Some room inside
        translate([3, 11, 0]) {
            cube([40, 42, adapterHeight]);
        }
        translate([9, 3, 0]) {
            cube([8, 11, adapterHeight]);
        }
        translate([27, 3, 0]) {
            cube([8, 11, adapterHeight]);
        }
        translate([9, 51, 0]) {
            cube([8, 11, adapterHeight]);
        }
        translate([27, 51, 0]) {
            cube([8, 11, adapterHeight]);
        }
        
        // Holes for the screws
        translate([5, 5, 0]) {
            cylinder(r=3, h=adapterHeight*2, center=true);
        }
        translate([40, 5, 0]) {
            cylinder(r=3, h=adapterHeight*2, center=true);
        }
        translate([22, 6, 0]) {
            cylinder(r=3.5, h=adapterHeight*2, center=true);
        }
        translate([5, 60, 0]) {
            cylinder(r=3, h=adapterHeight*2, center=true);
        }
        translate([40, 60, 0]) {
            cylinder(r=3, h=adapterHeight*2, center=true);
        }
        translate([22, 59, 0]) {
            cylinder(r=3.5, h=adapterHeight*2, center=true);
        }
        
        // fitting for top        
        translate([0, 0, adapterHeight-1.5]) difference() {
            minkowski() {
                    cube([45,65, 1.5/2]);
                    cylinder(r=cornderRadius, h=1.5/2);
            }
            // fitting for bottom
            translate([1.5, 1.5, 0]) {
                minkowski() {
                        cube([42,62, 1.5]);
                        cylinder(r=cornderRadius, h=1.5);
                }
            }
        }
        
    }
}   }

adapter();
