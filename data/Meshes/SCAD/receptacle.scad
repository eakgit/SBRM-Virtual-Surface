diameter=50;
height=100;
quality=120;
$fn=quality;
numbsides=100; rotation=0;

module hSphere(r=1,t=0.1,ns=numbsides,rot=rotation) {
	difference() {
		sphere(r);
		sphere(r-t);
	}
}
module hTorus(r=1,t=0.1,ns=numbsides,rot=rotation) {
	scale([1,1,2])difference() {
		rotate([0,0,rot]) rotate_extrude(convexity=15,$fn=ns) translate([r*2/3, 0, 0]) circle(r/3,$fn=quality); 
		rotate([0,0,rot]) scale([1,1,1.2])rotate_extrude(convexity=15,$fn=ns) translate([r*2/3, 0, 0]) circle(r/3-t,$fn=quality); 
	}
}
module nTorus(r=1,t=0.1,ns=numbsides,rot=rotation) {
	scale([1,1,2])difference() {
		rotate([0,0,rot]) rotate_extrude(convexity=15,$fn=ns) translate([r*2/3, 0, 0]) circle(r/3,$fn=quality); 
		rotate([0,0,rot]) scale([1,1,1.1])rotate_extrude(convexity=15,$fn=ns) translate([r*2/3, 0, 0]) circle(r/3-t,$fn=quality); 
	}
}

module receptacle0(ns=numbsides,rot=rotation) {
	intersection() { translate([0,0,0.5])cube(1,center=true);
		scale([1/122,1/122,1/112])translate([0,0,-2.64])difference() {
			scale([1,1,2]) translate([0,0,((30+6)*2*0.813)/2]) union() {
				difference() {
					rotate([0,0,rot]) rotate_extrude(convexity = 10,$fn=ns) translate([31, 0, 0]) circle(30,$fn=quality); 
					rotate([0,0,rot]) scale([1,1,1.08])rotate_extrude(convexity = 10,$fn=ns) translate([31, 0, 0]) circle(24,$fn=quality); 
					cylinder(31*2.5,31*1.35,31*1.35,center=true,$fn=ns);
				}
				translate([0,0,22.95])cylinder(5,31*1.352,31*1.352,$fn=ns);
				translate([0,0,0-27.95])cylinder(4.9,31*1.352,31*1.352,$fn=ns);
			}
			translate([0,0,108])cylinder(9.1,42,36,center=true,$fn=ns);
			translate([0,0,112])cylinder(9,38,41,center=true,$fn=ns);
		}
	}
}
module receptacle1(ns=numbsides,rot=rotation) {
	intersection() { translate([0,0,0.5])cube(1,center=true);
		scale([1/2,1/2,1/2])translate([0,0,0.5]) union() {
			difference() {
				hTorus(1,0.1,ns,rot);
				cylinder(1.8,0.83,0.83,center=true,$fn=ns);
			}
			scale([1.67,1.67,1]) translate([0,0,-0.5275]) cylinder(0.1,0.498,0.498,center=true,$fn=ns);
		
			difference() {
				union() {
					scale([1.67,1.67,1]) translate([0,0,0.96])  {
						intersection() {
							hTorus(1,0.1,ns,rot);
							cylinder(1.5,0.5,0.5,center=true,$fn=ns);
						}
					}
					rotate([0,0,rot]) translate([0,0,1.442])rotate_extrude(convexity = 10,$fn=ns) translate([0.83, 0, 0]) scale([0.4,1,1])circle(0.1,$fn=quality); 
				}
				union() {
					translate([0,0,0.6])cylinder(0.5,0.85,0.61,center=true,$fn=ns);
					translate([0,0,0.05])cylinder(0.6,0.85,0.85,center=true,$fn=ns);
				}
			}
		}
	}
}
module receptacle2(ns=numbsides,rot=rotation) {
	intersection() { translate([0,0,0.5])cube(1,center=true);
		scale([1/2,1/2,1/3])translate([0,0,0.5]) union() {
			difference() {
				hTorus(1,0.1,ns,rot);
				cylinder(1.8,0.83,0.83,center=true,$fn=ns);
			}
			scale([1.67,1.67,1]) translate([0,0,-0.5275]) cylinder(0.1,0.498,0.498,center=true,$fn=ns);
		
			difference() {
				scale([1,1,2]) union() {
					scale([1.67,1.67,1]) translate([0,0,0.96+((2-1)*-0.29)])  {
						intersection() {
							hTorus(1,0.1,ns,rot);
							cylinder(1.5,0.5,0.5,center=true,$fn=ns);
						}
					}
					rotate([0,0,rot]) translate([0,0,1.442+((2-1)*-0.29)])rotate_extrude(convexity = 10,$fn=ns) translate([0.83, 0, 0]) scale([0.4,1,1])circle(0.1,$fn=quality); 
				}
				union() {
					translate([0,0,0.6])cylinder(0.5,0.85,0.61,center=true,$fn=ns);
					translate([0,0,0.05])cylinder(0.6,0.85,0.85,center=true,$fn=ns);
				}
			}
		}
	}
}
module receptacle3(ns=numbsides,rot=rotation) {
	intersection() { translate([0,0,0.5])cube(1,center=true);
		scale([1/2,1/2,1/1.75])translate([0,0,0.5]) union() {
			difference() {
				hTorus(1,0.1,ns,rot);
				cylinder(1.8,0.83,0.83,center=true,$fn=ns);
			}
			scale([1.67,1.67,1]) translate([0,0,-0.5275]) cylinder(0.1,0.498,0.498,center=true,$fn=ns);
		
			difference() {
				scale([1,1,0.7]) union() {
					scale([1.67,1.67,1]) translate([0,0,1.215])  {
						intersection() {
							hTorus(1,0.1,ns,rot);
							cylinder(1.5,0.5,0.5,center=true,$fn=ns);
						}
					}
					rotate([0,0,rot]) translate([0,0,1.697])rotate_extrude(convexity = 10,$fn=ns) translate([0.83, 0, 0]) scale([0.4,1,1])circle(0.1,$fn=quality); 
				}
				union() {
					translate([0,0,0.6])cylinder(0.5,0.85,0.61,center=true,$fn=ns);
					translate([0,0,0.05])cylinder(0.6,0.85,0.85,center=true,$fn=ns);
				}
			}
		}
	}
}
module receptacle4(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.5,0.5,0.47])translate([0,0,0.57]) union() {
			difference() {
				hTorus(1,0.1,ns,rot);
				translate([0,0,-1.38])cylinder(1.8,0.83,0.83,center=true,$fn=ns);
				cylinder(1.8,0.65,0.65,center=true,$fn=ns);
				translate([0,0,0.5])cylinder(1,1.1,1.1,center=true,$fn=ns);
			}
			scale([1.67,1.67,1]) translate([0,0,-0.5275]) cylinder(0.1,0.498,0.498,center=true,$fn=ns);
			translate([0,0,0.75])difference() {
				cylinder(1.5,1,1,center=true,$fn=ns);
				cylinder(2,0.9,0.9,center=true,$fn=ns);
			}
			rotate([0,0,rot]) translate([0,0,1.5])rotate_extrude(convexity = 10,$fn=ns) translate([0.95, 0, 0]) circle(0.05,$fn=quality); 
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}
module receptacle5(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.39,0.39,0.445])translate([0,0,0.5752]) union() {
			difference() {
				hTorus(1,0.1,ns,rot);
				translate([0,0,-1.38])cylinder(1.8,0.83,0.83,center=true,$fn=ns);
				cylinder(1.8,0.65,0.65,center=true,$fn=ns);
				translate([0,0,0.5])cylinder(1,1.1,1.1,center=true,$fn=ns);
			}
			scale([1.67,1.67,1]) translate([0,0,-0.5275]) cylinder(0.1,0.498,0.498,center=true,$fn=ns);
			translate([0,0,0.5])difference() {
				cylinder(1,1,1,center=true,$fn=ns);
				cylinder(2,0.9,0.9,center=true,$fn=ns);
			}
			rotate([0,0,rot]) translate([0,0,1.61])rotate_extrude(convexity = 10,$fn=ns) translate([1.24, 0, 0]) scale([1,3,1])circle(0.025,$fn=quality); 
			scale([2.515,2.515,2])translate([0,0,0.25]) intersection() {
					nTorus(1,0.041,ns,rot);
					cylinder(1.5,0.5,0.5,center=true,$fn=ns);
					translate([0,0,0.5])cylinder(0.5,1,1,center=true,$fn=ns);
				}
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}
module receptacle6(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.39,0.39,0.57])translate([0,0,0.5752]) union() {
			difference() {
				hTorus(1,0.1,ns,rot);
				translate([0,0,-1.38])cylinder(1.8,0.83,0.83,center=true,$fn=ns);
				cylinder(1.8,0.65,0.65,center=true,$fn=ns);
				translate([0,0,0.5])cylinder(1,1.1,1.1,center=true,$fn=ns);
			}
			scale([1.67,1.67,1]) translate([0,0,-0.5275]) cylinder(0.1,0.498,0.498,center=true,$fn=ns);
			translate([0,0,0.25])difference() {
				cylinder(0.5,1,1,center=true,$fn=ns);
				cylinder(2,0.9,0.9,center=true,$fn=ns);
			}
			rotate([0,0,rot]) translate([0,0,1.11])rotate_extrude(convexity = 10,$fn=ns) translate([1.24, 0, 0]) scale([1,3,1])circle(0.025,$fn=quality); 
			scale([2.515,2.515,2])translate([0,0,0]) intersection() {
					nTorus(1,0.041,ns,rot);
					cylinder(1.5,0.5,0.5,center=true,$fn=ns);
					translate([0,0,0.5])cylinder(0.5,1,1,center=true,$fn=ns);
				}
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}
module receptacle7(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.39,0.39,0.8])translate([0,0,0.5752]) union() {
			difference() {
				hTorus(1,0.1,ns,rot);
				translate([0,0,-1.38])cylinder(1.8,0.83,0.83,center=true,$fn=ns);
				cylinder(1.8,0.65,0.65,center=true,$fn=ns);
				translate([0,0,0.5])cylinder(1,1.1,1.1,center=true,$fn=ns);
			}
			scale([1.67,1.67,1]) translate([0,0,-0.5275]) cylinder(0.1,0.498,0.498,center=true,$fn=ns);
			rotate([0,0,rot]) translate([0,0,0.61])rotate_extrude(convexity = 10,$fn=ns) translate([1.24, 0, 0]) scale([1,3,1])circle(0.025,$fn=quality); 
			scale([2.515,2.515,2])translate([0,0,-0.25]) intersection() {
					nTorus(1,0.041,ns,rot);
					cylinder(1.5,0.5,0.5,center=true,$fn=ns);
					translate([0,0,0.5])cylinder(0.5,1,1,center=true,$fn=ns);
				}
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}
module receptacle8(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.5,0.5,0.48])translate([0,0,0.5]) union() {
			translate([0,0,0.25])difference() {
				cylinder(1.5,1,1,center=true,$fn=ns);
				cylinder(2,0.9,0.9,center=true,$fn=ns);
			}
			translate([0,0,-0.45]) cylinder(0.1,1,1,center=true,$fn=ns);
			translate([0,0,1])rotate([180,0,0])difference() {
				hTorus(1,0.1,ns,rot);
				translate([0,0,-1.25])cylinder(1.8,0.83,0.83,center=true,$fn=ns);
				cylinder(1.8,0.65,0.65,center=true,$fn=ns);
				translate([0,0,0.5])cylinder(1,1.1,1.1,center=true,$fn=ns);
			}
			rotate([0,0,rot]) translate([0,0,1.493])rotate_extrude(convexity = 10,$fn=ns) translate([0.83, 0, 0]) scale([1,3.5,1])circle(0.025,$fn=quality); 
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}

module receptacle9(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.5,0.5,0.48])translate([0,0,0.5]) union() {
			translate([0,0,0.25])difference() {
				cylinder(2.5,1,1,center=true,$fn=ns);
				cylinder(2.6,0.9,0.9,center=true,$fn=ns);
			}
			translate([0,0,-0.45]) cylinder(0.1,1,1,center=true,$fn=ns);
			rotate([0,0,rot]) translate([0,0,1.5])rotate_extrude(convexity = 10,$fn=ns) translate([0.95, 0, 0]) circle(0.05,$fn=quality); 
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}

module receptacle10(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.5,0.5,0.48])translate([0,0,0.5]) union() {
			scale([2,2,2])translate([0,0,0.25]) intersection() {
					nTorus(1,0.041,ns,rot);
					cylinder(1.5,0.5,0.5,center=true,$fn=ns);
					translate([0,0,0.5])cylinder(0.5,1,1,center=true,$fn=ns);
				}
			translate([0,0,0.25])difference() {
				cylinder(1.5,0.795,0.795,center=true,$fn=ns);
				cylinder(2.1,0.717,0.717,center=true,$fn=ns);
			}
			translate([0,0,-0.45]) cylinder(0.1,0.795,0.795,center=true,$fn=ns);
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}
module receptacle11(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.5,0.5,0.48])translate([0,0,0.5]) union() {
			scale([2,2,2])translate([0,0,0.25]) intersection() {
					nTorus(1,0.041,ns,rot);
					cylinder(1.5,0.5,0.5,center=true,$fn=ns);
					translate([0,0,-0.5])cylinder(0.5,1,1,center=true,$fn=ns);
				}
			translate([0,0,0.75])difference() {
				cylinder(1.5,0.795,0.795,center=true,$fn=ns);
				cylinder(2.1,0.717,0.717,center=true,$fn=ns);
			}
			translate([0,0,-0.45]) cylinder(0.1,0.95,0.9,center=true,$fn=ns);
			rotate([0,0,rot]) translate([0,0,1.5])rotate_extrude(convexity = 10,$fn=ns) translate([0.76, 0, 0]) circle(0.035,$fn=quality); 
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}
module receptacle12(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.5,0.5,0.48])translate([0,0,0.5]) union() {
			translate([0,0,0.25])difference() {
				cylinder(2.5,0.5,1,center=true,$fn=ns);
				cylinder(2.6,0.4,0.9,center=true,$fn=ns);
			}
			translate([0,0,-0.45]) cylinder(0.1,0.55,0.55,center=true,$fn=ns);
			rotate([0,0,rot]) translate([0,0,1.5])rotate_extrude(convexity = 10,$fn=ns) translate([0.947, 0, 0]) circle(0.052,$fn=quality); 
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}
module receptacle13(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.5,0.5,0.48])translate([0,0,0.5]) union() {
			translate([0,0,0.25])difference() {
				cylinder(2.5,1,0.6,center=true,$fn=ns);
				cylinder(2.6,0.9,0.5,center=true,$fn=ns);
			}
			translate([0,0,-0.45]) cylinder(0.1,0.9,0.9,center=true,$fn=ns);
			rotate([0,0,rot]) translate([0,0,1.5])rotate_extrude(convexity = 10,$fn=ns) translate([0.554, 0, 0]) circle(0.045,$fn=quality); 
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}

module receptacle14(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.5,0.5,0.48])translate([0,0,0.5]) union() {
			scale([2,2,2])translate([0,0,0.25]) intersection() {
					nTorus(1,0.041,ns,rot);
					cylinder(1.5,0.5,0.5,center=true,$fn=ns);
					translate([0,0,0.5])cylinder(0.5,1,1,center=true,$fn=ns);
				}
			translate([0,0,0.5])difference() {
				cylinder(1,0.795,0.795,center=true,$fn=ns);
				cylinder(2.1,0.717,0.717,center=true,$fn=ns);
			}
			scale([2,2,2])translate([0,0,0.25]) intersection() {
					nTorus(1,0.041,ns,rot);
					cylinder(1.5,0.5,0.5,center=true,$fn=ns);
					translate([0,0,-0.5])cylinder(0.5,1,1,center=true,$fn=ns);
				}
			translate([0,0,-0.45]) cylinder(0.1,0.95,0.9,center=true,$fn=ns);
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}
module receptacle11b(ns=numbsides,rot=rotation) {
	intersection() {
		scale([0.5,0.5,0.48])translate([0,0,0.5]) union() {
			translate([0,0,0.75])difference() {
				cylinder(1.5,0.795,0.795,center=true,$fn=ns);
				cylinder(2.1,0.717,0.717,center=true,$fn=ns);
			}
			rotate([0,0,rot]) translate([0,0,1.5])rotate_extrude(convexity = 10,$fn=ns) translate([0.76, 0, 0]) circle(0.035,$fn=quality); 
		}
		translate([0,0,0.5]) cube(1,center=true);
	}
}
rotationList=[0,0,0,30,0,-18,30,90/7,0,-10,18,90/11,0,-90/13,90/7,6,0,0,0,0,0,0];
module drawReceptacle(number=0,sides=3) {
	ns=(sides<3)?100:sides;
	rotby=(ns>20)?0:rotationList[ns];

		if (number==1) { receptacle3(ns,rotby);
	} else if (number==2) { receptacle1(ns,rotby);
	} else if (number==3) { receptacle2(ns,rotby);
	} else if (number==4) { receptacle5(ns,rotby);
	} else if (number==5) { receptacle6(ns,rotby);
	} else if (number==6) { receptacle7(ns,rotby);
	} else if (number==7) { receptacle4(ns,rotby);
	} else if (number==8) { receptacle8(ns,rotby);
	} else if (number==9) { receptacle9(ns,rotby);
	} else if (number==10) { receptacle10(ns,rotby);
	} else if (number==11) { receptacle11(ns,rotby);
	} else if (number==12) { receptacle14(ns,rotby);
	} else if (number==13) { receptacle12(ns,rotby);
	} else if (number==14) { receptacle13(ns,rotby);
	} else { 
		 receptacle0(ns,rotby);
	}	
}

module all() {
	distance=1;
	offset=-7;
	scale(50) {
		for (n=[1:15]) {
			translate([offset+distance*n,0,0]) { 
				drawReceptacle(n,0); 
				for (r=[3:5]) { 
					translate([0,distance*r-2,0]) drawReceptacle(n,r); 
				} 
			}
		}
	}
}
module sides() {
	angle=360/19;
	distance=1;
	scale(50) {
		for (r=[2:16]) { 
			translate([6+((r-2)%5*distance),(r-2)/5*distance,0]) drawReceptacle(2,r); 
			translate([6+((r-2)%5*distance),4+((r-2)/5*distance),0]) drawReceptacle(13,r); 
			translate([(r-2)%5*distance,(r-2)/5*distance,0]) drawReceptacle(0,r); 
			translate([(r-2)%5*distance,4+((r-2)/5*distance),0]) drawReceptacle(7,r); 
		} 
	}
}
module HexHexPot() {
	difference() {
		scale(100) receptacle9(20,0);
		intersection() {
			union() {
				for (i=[0:9]) {	
					for (j=[0:11]) {	
						translate([0,0,4.3+j*8.25]) rotate([90,0,9+(i*36)+18*(j%2)]) cylinder(100,6,6,$fn=6);
					}
				}
			}
			translate([0,0,50])cube([100,100,90],center=true);
		}
	}
}
module StarPot() {
	difference() {
		scale(100) receptacle8();
		intersection() {
			union() {
				for (i=[0:8]) {	
					for (j=[0:6]) {	
						translate([0,0,5+j*15]) rotate([90,0,10+(i*40)+20*(j%2)]) cylinder(100,5,5,$fn=6);
						for (k=[0:5]) {
							translate([0,0,5+j*15]) rotate([90,0,10+(i*40)+20*(j%2)]) rotate([0,0,-30+k*60])translate([7.5,0,0])cylinder(100,3,3,$fn=3);
						}
					}
				}
			}
			translate([0,0,50])cylinder(90,60,60,center=true);
		}
	}
}
module PentStarPot() {
	difference() {
		scale(100) receptacle3();
		intersection() {
			union() {
				for (i=[0:8]) {	
					for (j=[0:6]) {	
						translate([0,0,5+j*15]) rotate([90,20,10+(i*40)+20*(j%2)]) cylinder(60,5,5,$fn=5);
						for (k=[0:4]) {
							translate([0,0,5+j*15]) rotate([90,20,10+(i*40)+20*(j%2)]) rotate([0,0,-36+k*72])translate([9,0,0])cylinder(60,2,2,$fn=12);
						}
	//					translate([0,0,17.5+j*15]) scale([1,1,1.5])rotate([90,0,4+(i*40)+20*(j%2)]) cylinder(60,3,3,$fn=4);
	//					translate([0,0,5+j*15]) scale([1,1,1.5])rotate([90,0,-4+(i*40)-20*(j%2)]) cylinder(60,2,2,$fn=4);
					}
				}
			}
			translate([0,0,50])cylinder(90,59,59,center=true);
		}
	}
}
module MoonPot() {
	difference() {
		scale(100) receptacle3();
/*		intersection() {
			union() {
				for (i=[0:8]) {	
					for (j=[0:6]) {	
						translate([0,0,5+j*15]) rotate([90,20,10+(i*40)+20*(j%2)]) cylinder(60,5,5,$fn=5);
						for (k=[0:4]) {
							translate([0,0,5+j*15]) rotate([90,20,10+(i*40)+20*(j%2)]) rotate([0,0,-36+k*72])translate([9,0,0])cylinder(60,2,2,$fn=12);
						}
					}
				}
			}
			translate([0,0,50])cylinder(90,59,59,center=true);
		}*/
		for (i=[0:17]) {	
			rotate([0,0,i*20]) {
				import_stl("moonslots.stl",convexity=4);
//				translate([0,0,35]) rotate([90,0,0]) scale([1,3.5,1]) difference() { cylinder(60,8.5,8.5,$fn=36); translate([4,0,0])cylinder(60,10,10,$fn=36); }
//				translate([0,0,76]) rotate([90,0,0]) scale([1,2,1]) difference() { cylinder(60,8.5,8.5,$fn=36); translate([-4,0,0])cylinder(60,10,10,$fn=36); }
			}
		}
	}
}
sides();
//all();
//scale(100) receptacle14();
