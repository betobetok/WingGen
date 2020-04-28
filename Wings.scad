//////////////////////////////////////////////////////////////////////////////////////////
// LibFile: 	WingsASK.scad                                                           //
//          	UtilidadesPerfil.scad                                                   //
//          	GenNACAXXXX.scad                                                        //
//                                                                                      //
//   Generate a wing with an airfoil from the catalog PerfilesASK                       //
//                                                                                      //
//   by Alberto Solorzano Kraemer, 2020, betobetok@gmail.com                            //
//   https://www.thingiverse.com/...                                                    //    
//   Airfoil data basis from UIUC                                                       //
//   (https://m-selig.ae.illinois.edu/ads/coord_database.html)                          //                                  
//                                                                                      //
//   This file is public domain.  Use it for any purpose, including commercial          //
//   applications.  Attribution would be nice, but is not required.  There is           //
//   no warranty of any kind, including its correctness, usefulness, or safety.         //
//                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////
//                                                                //
//                                                                //
//                    ////    //////   //   //                    //
//                   // //   //        //  //                     //
//                  //  //   //        // //                      //
//                 ///////    //////   ////                       //
//                //    //        //   // //                      //
//               //     //   //////    //  //                     //
//                            __!__                               //
//                      ^----o-(_)-o----^                         //
//                                                                //
////////////////////////////////////////////////////////////////////
/*
	Author: Alberto Solorzano Kraemer ( betobetok@gmail.com )
	License: GPL
    
    File to generate a elliptical or a conic wing with one or two airfoils evolving from one in the root to the other in the tip.
    
    The airfoil wold be a NACA 4 digit airfoil or one of +500  airfoil in the data basis in the Perfiles_ASK.scad file.
   
    Syntax:
    
    Module conicWing  
    Creates a rectangular or conical wing section. tipAirfoil, tipChord, arrow, twist, dihedral and conicity argument are optional. 
    
    Parameters

    rootAirfoil -   Is the airfoil that is used to the root section in the wing.
    tipAirfoil  -   Is the airfoil that is used to the tip section in the wing. When is omitted the rootAirfoil is used in the tip section.
    rootChord   -   Is the chord for the root section of the wing.
    tipChord    -   Is the chord for the tip section of the wing. When is omitted at the same time that conicity the rootChord is used in the tip section and the wing is a rectangular wing. When is omitted but the conicity is typed, the tipCord = conicity*rootChord.
    wingSpan   -   Is the wingspan of the half wing.
    arrow       -   Is the angle of arrow in the wing with positive angle to back. When is omitted, the arrow is null. 
    twist       -   Is the angle of twist in the wing with positive angle in the direction of wash down (-alfa). When is omitted, the twist is null.
    dihedral     -   Is the angle of dihedral in the wing with positive angle to up. When is omitted, the dihedral is null and the wing is planar.
    conicity    -   Is the ratio between rootChord and tipChord (tipChord/rootChord). When is omitted the conicity is exactly tipChord/rootChord

    Usage Examples

    conicWing(rootAirfoil="NACA6322", rootChord=12, tipChord=5, wingSpan=80, twist=5, dihedral=2);
    
    Modulo ellipticWing  
    Creates a elliptical or semi-elliptical wing section. arrow, twist, dihedral and r argument are optional. 
    
    Parameters

    airfoil -   Is the airfoil that is used to the root section in the wing.
    rootChord   -   Is the chord for the root section of the wing.
    wingSpan   -   Is the wingspan of the half wing.
    arrow       -   Is the angle of arrow in the wing with positive angle to back. When is omitted, the arrow is null. 
    twist       -   Is the angle of twist in the wing with positive angle in the direction of wash down (-alfa). When is omitted, the twist is null.
    dihedral     -   Is the angle of dihedral in the wing with positive angle to up. When is omitted, the dihedral is null and the wing is planar.
    r           -   Is the ratio between the front radios and the rear radius for a semi-elliptical surface, when r=1, the wing is a leading elliptical edge,
                    when r=2 the wing is a complete elliptical wing and when r>2 the wing is a semi-elliptical wing wit a leading edge more plane
    
    Usage Examples
    
    ellipticWing(airfoil="NACA6312", rootChord=12, wingSpan=80); 
*/

use <transforms.scad>
use <constants.scad>
use <shapes.scad>
use <GenNACAXXXX.scad>
use <perfilesASK_1_0.scad>
use <Utilidadesperfiles.scad>


//conicWing(rootAirfoil="NACA6322", rootChord=12, tipChord=5, wingSpan=40, arrow=10, twist=5, dihedral=2);
//mirror([0,0,1]) conicWing(rootAirfoil="NACA6322", rootChord=12, tipChord=5, wingSpan=40, arrow=10, twist=5, dihedral=2);

//ellipticWing(airfoil="NACA6312", rootChord=12, wingSpan=80, arrow=0, twist=4, dihedral=0, r=3);
//mirror([0,0,1]) ellipticWing(airfoil="NACA6312", rootChord=12, wingSpan=80, arrow=0, twist=4, dihedral=0, r=3);


//module to make a eliptical wing with a base chord of rootChord and a wing spand of wingSpan and the optional atributes of twist, arrow and dihedral, the value of r determines the aspect ratio of the leding vs trailing edge
module ellipticWing(airfoil, rootChord, wingSpan, arrow=0, twist=0, dihedral=0, r=3){
    
    assert((str(airfoil[0],airfoil[1],airfoil[2],airfoil[3])=="NACA" && len(airfoil)==8) || is_Airfoil(airfoil), "Airfoil not found");
    
    if(str(airfoil[0],airfoil[1],airfoil[2],airfoil[3])=="NACA"){
        rotate([0,0,twist]) for(n=[0:89]){
            chain_hull(){
                translate([-rootChord*sin(n)/r+wingSpan*cos(n)*sin(arrow),wingSpan*cos(n)*sin(dihedral),wingSpan*cos(n)]) rotate([0,0,-n*twist/90]) GenNACA(airfoil, cuerda=rootChord*sin(n));
                translate([-rootChord*sin(n+1)/r+wingSpan*cos(n+1)*sin(arrow),wingSpan*cos(n+1)*sin(dihedral),wingSpan*cos(n+1)]) rotate([0,0,-(n+1)*twist/90]) GenNACA(airfoil, cuerda=rootChord*sin(n+1));
            }
        }  
    }else {
        rotate([0,0,twist]) for(n=[0:89]){
            chain_hull(){
                translate([-rootChord*sin(n)/r+wingSpan*cos(n)*sin(arrow),wingSpan*cos(n)*sin(dihedral),wingSpan*cos(n)]) linear_extrude(height = 0.1, center = false, convexity = 10) rotate([0,0,-(n)*twist/90]) perfil(airfoil, rootChord*sin(n));
                translate([-rootChord*sin(n+1)/r+wingSpan*cos(n+1)*sin(arrow),wingSpan*cos(n+1)*sin(dihedral),wingSpan*cos(n+1)]) linear_extrude(height = 0.1, center = false, convexity = 10) rotate([0,0,-(n+1)*twist/90]) perfil(airfoil, rootChord*sin(n+1));
            }
        }  
    }  
}

//Module to meke a conical or rectangular wing
module conicWing(rootAirfoil, tipAirfoil="", rootChord, tipChord=0, wingSpan, arrow=0, twist=0, dihedral=0, conicity=1){
    tipAirfoil= tipAirfoil!="" ? tipAirfoil : rootAirfoil;
    tipChord= tipChord!=0 ? tipChord : rootChord*conicity;
    conicity= tipChord==rootChord ? 1 : tipChord/rootChord;
    assert((str(rootAirfoil[0],rootAirfoil[1],rootAirfoil[2],rootAirfoil[3])=="NACA" && len(rootAirfoil)==8) || is_Airfoil(rootAirfoil), "Airfoil not found");
    assert((str(tipAirfoil[0],tipAirfoil[1],tipAirfoil[2],tipAirfoil[3])=="NACA" && len(tipAirfoil)==8) || is_Airfoil(tipAirfoil), "Airfoil not found");
    
    if(str(rootAirfoil[0],rootAirfoil[1],rootAirfoil[2],rootAirfoil[3])=="NACA" && str(tipAirfoil[0],tipAirfoil[1],tipAirfoil[2],tipAirfoil[3])=="NACA"){
        chain_hull(){
            translate([0,0,0]) GenNACA(rootAirfoil, cuerda=rootChord);
            translate([wingSpan*sin(arrow),wingSpan*sin(dihedral),wingSpan*cos(arrow)]) rotate([0,0,twist]) GenNACA(tipAirfoil, cuerda=tipChord);
        }  
    }else if(is_Airfoil(rootAirfoil) && str(tipAirfoil[0],tipAirfoil[1],tipAirfoil[2],tipAirfoil[3])=="NACA"){
        chain_hull(){
            translate([0,0,0]) linear_extrude(height = 0.1, center = false, convexity = 10) perfil(rootAirfoil, rootChord);
            translate([wingSpan*sin(arrow),wingSpan*sin(dihedral),wingSpan*cos(arrow)]) rotate([0,0,twist]) GenNACA(tipAirfoil, cuerda=tipChord);
        }  
    }else if(str(rootAirfoil[0],rootAirfoil[1],rootAirfoil[2],rootAirfoil[3])=="NACA" && is_Airfoil(tipAirfoil)){
        chain_hull(){
            translate([0,0,0]) GenNACA(rootAirfoil, cuerda=rootChord);
            translate([wingSpan*sin(arrow),wingSpan*sin(dihedral),wingSpan*cos(arrow)]) rotate([0,0,twist]) linear_extrude(height = 0.1, center = false, convexity = 10) perfil(tipAirfoil, tipChord);
        }
    }else if(is_Airfoil(rootAirfoil) && is_Airfoil(tipAirfoil)){
        chain_hull(){
            translate([0,0,0]) linear_extrude(height = 0.1, center = false, convexity = 10) perfil(rootAirfoil, rootChord);
            translate([wingSpan*sin(arrow),wingSpan*sin(dihedral),wingSpan*cos(dihedral)]) rotate([0,0,twist]) linear_extrude(height = 0.1, center = false, convexity = 10) perfil(tipAirfoil, tipChord);
        }
    }  
}

// module mixWing() to be done