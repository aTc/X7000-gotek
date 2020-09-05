// AKAI X7000 QuickDisk gotek adapter 

$fn = 50;

difference(){
    cube([100,3,28]); // front
    {
        
        cube([100,1,3]);  // bottom edge     
        translate([13,-0.5,11])
          {
            cube([21.0,4,9.6]); //oled
            //translate([-7,2,-4]) cube([8+21+2.5+8,3,4+11.5+4]);
          }             
        translate([80,5,13])
        {
            rotate([90,0,0])
            {
                translate([0,0.5,0])    cylinder(h=10,r=2.4); // button R
                translate([0,8,0])      cylinder(h=10,r=1.6); // led
                translate([-7.3,0.5,0])   cylinder(h=10,r=2.4); // button L
                translate([-33,-3.5,0]) cube([16,8,10]);  // USB
            };
        };
    };
};


rotate([0,180,0]) translate([-100,0,-3]) prism(100,1,1); // front edge
translate([100,4,0]) {rotate([0,0,180]) prism(100,1,3);}; //inner edge
translate([2,12+2,0]) { rotate([180,180,0]) prism(2,12,27);}; //left edge support
translate([100,12+2,0]) { rotate([180,180,0]) prism(2,12,27);}; //right edge support

// screw standoff
//front
translate([80,20,0])    difference(){ cylinder(h=8,r=5);cylinder(h=8,r=1.25);}
translate([52,3,0])    cube([5,5,8]);
//middle
translate([80,70,0])    difference(){ cylinder(h=8,r=5);cylinder(h=8,r=1.25);}
translate([30,70,0])    difference(){ cylinder(h=8,r=5);cylinder(h=8,r=1.25);}
 // back
translate([80,91,0])    union(){ cylinder(h=8,r=5);cylinder(h=12,r=1.25);}
translate([30,91,0])    union(){ cylinder(h=8,r=5);cylinder(h=12,r=1.25);}


// supports

translate([0,0,-18])
{
    translate([75,1+12,0])     cube([10,102+4,3]); //Bottom frame R
    translate([25,1+12,0])     cube([10,102+4,3]); //Bottom frame L
    
    translate([0,1+12,0])     cube([100,5,18]); //front
    
    // screw hole front R
    difference(){
        translate([75,18-4,0])  cube([25+10,12,3]);
        union(){
            translate([75+25+5,18+6-4,0]) cylinder(h=10,r=2);
            translate([75+25+10,5,0]) rotate([0,0,45]) cube([10,10,10]); // edge
        };
    };
    
    //Bottom frame back
    difference(){
        translate([-8,113-4,0])    cube([119,12,3]);
        union(){
        translate([105,119-4,0]) cylinder(h=10,r=2); //screw holes
        translate([-2,119-4,0]) cylinder(h=10,r=2);
        };
    };
    
    // screw hole front L
    difference(){
        translate([-8,54-4,0]) cube([25+8,12,3]);
        translate([-2,60-4,0]) cylinder(h=10,r=2);
    };
    
    // bottom frame L support
    translate([0,13,0]) cube([25,37,3]);
    
    // connect screw standoff to bottom frame
    translate([80,20,0])    cylinder(h=18,r=5);
    translate([80,70,0])    cylinder(h=18,r=5);
    translate([30,70,0])    cylinder(h=18,r=5);
    translate([80,91,0])    cylinder(h=18,r=5);
    translate([30,91,0])    cylinder(h=18,r=5);
    
    // extra support
    translate([100,13+21+10,0]) rotate([0,0,180]) prism(25,16+10,18);
    translate([35,13+21+10,0]) rotate([0,0,180]) prism(10,26,18);
    
    

};

// connect frame to front
translate([0,1,0]) rotate([0,180,0]) prism(-100,12,18);


module prism(l, w, h){
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
};
  