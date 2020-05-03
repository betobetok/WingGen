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
use <AirfoilUtilities.scad>


//conicWing(rootAirfoil="NACA8512", tipAirfoil="NACA0012", rootChord=12, tipChord=5, wingSpan=40, arrow=30, twist=5, dihedral=2);
//mirror([0,0,1]) conicWing(rootAirfoil="NACA6322", rootChord=12, tipChord=5, wingSpan=40, arrow=10, twist=5, dihedral=2);

ellipticWing(airfoil="NACA6312", rootChord=200, wingSpan=600, arrow=0, twist=0, dihedral=1, r=3);
//mirror([0,0,1]) ellipticWing(airfoil="NACA6312", rootChord=12, wingSpan=80, arrow=20, twist=4, dihedral=0, r=3);


//module to make a eliptical wing with a base chord of rootChord and a wing spand of wingSpan and the optional atributes of twist, arrow and dihedral, the value of r determines the aspect ratio of the leding vs trailing edge
module ellipticWing(airfoil, rootChord, wingSpan, arrow=0, twist=0, dihedral=0, r=3){
    
    assert(is_NACA(airfoil) || is_Airfoil(airfoil), "Airfoil not found");  //x wingSpan  y = chord   x = a cos   y = b sin
    
    rotate([dihedral,0,0]) for(n=[0:89]){
        translate([rootChord/2-rootChord*sin(n)/r+wingSpan*cos(n)*sin(arrow),0,wingSpan*cos(n+1)]) rotate([0,0,twist*cos(n+1)]) extrudAirfoil(airfoil, airfoil, rootChord*sin(n), wingSpan*cos(n)-wingSpan*cos(n+1), twist=twist*cos(n)-twist*cos(n+1), conicity=sin(n)/sin(n+1), arrow=arrow, r=r);
    } 
}

//Module to meke a conical or rectangular wing
module conicWing(rootAirfoil, tipAirfoil="", rootChord, tipChord=0, wingSpan, arrow=0, twist=0, dihedral=0, conicity=1){
    tipAirfoil= tipAirfoil!="" ? tipAirfoil : rootAirfoil;
    tipChord= tipChord!=0 ? tipChord : rootChord*conicity;
    conicity= tipChord==rootChord ? 1 : tipChord/rootChord;
    assert((str(rootAirfoil[0],rootAirfoil[1],rootAirfoil[2],rootAirfoil[3])=="NACA" && len(rootAirfoil)==8) || is_Airfoil(rootAirfoil), "root Airfoil not found");
    assert((str(tipAirfoil[0],tipAirfoil[1],tipAirfoil[2],tipAirfoil[3])=="NACA" && len(tipAirfoil)==8) || is_Airfoil(tipAirfoil), "tip Airfoil not found");
    
    rotate([dihedral,0,0]) extrudAirfoil(rootAirfoil, tipAirfoil, rootChord, wingSpan, twist, conicity, arrow);  
}


// Modul to extrud an airfoil with diferente sources
module extrudAirfoil(rootAirfoil, tipAirfoil, chord, wingSpan, twist=0, conicity=1, arrow=0, r=2){
   assert(is_NACA(rootAirfoil) || is_Airfoil(rootAirfoil), "root Airfoil not found");
   assert(is_NACA(tipAirfoil) || is_Airfoil(tipAirfoil), "tip Airfoil not found");
    pointRootAirfoil = is_NACA(rootAirfoil) ? NACA(rootAirfoil) : is_Airfoil(rootAirfoil) ? concat(interpolate(secondLine(airfoil(rootAirfoil), len(airfoil(rootAirfoil))-1)), interpolateI(firstLine(airfoil(rootAirfoil)))) : [0,0];
    pointTipAirfoil = is_NACA(tipAirfoil) ? NACA(tipAirfoil) : is_Airfoil(tipAirfoil) ? concat(interpolate(secondLine(airfoil(tipAirfoil), len(airfoil(tipAirfoil))-1)), interpolateI(firstLine(airfoil(tipAirfoil)))) : [0,0];
    
    pointst=generadorP(rotateASKZ(pointRootAirfoil*chord,0),translateASKX(rotateASKZ(pointTipAirfoil*chord*conicity,twist),(1-conicity)*chord/r+wingSpan*sin(arrow)),0,wingSpan);
    fases = concat(lateral(pointst),[[len(pointst)-2,len(pointst)-1,1,0]],[tapaIn(pointst)],[tapaSu(pointst, len(pointst)-1)]);
    polyhedron(points=pointst,faces=fases, convexity = 10);
}

//Functions
function generadorP(airfoil1, airfoil2, a, b, n=0, airfoil=[])=n>len(airfoil1)-1 ? airfoil : generadorP(airfoil1, airfoil2, a, b, n+1, concat(airfoil,[concat(airfoil1[n],a)], [concat(airfoil2[n],b)]));  // Function to make an array of 3D points with the two airfoils

function lateral(points, n=0, fases=[]) = n>len(points)-3 ? fases : lateral(points, n+2, concat(fases, [[n,n+1,n+3,n+2]])); //Function to generate the array with the number of points that delimitate the lateral faces

function tapaIn(points, n=0, fases=[])=n>len(points)-1 ? fases : tapaIn(points, n+2, concat(fases, n)); //Function to generate the array with the number of points that delimitate the bottom faces
function tapaSu(points, n, fases=[])=n<0 ? fases : tapaSu(points, n-2, concat(fases, n)); //Function to generate the array with the number of points that delimitate the upper faces
 
function rotateASKZ(points, angle, n=0, output=[])= n>len(points)-1 ? output : rotateASKZ(points, angle, n+1, concat(output, [[points[n][0]*cos(angle)-points[n][1]*sin(angle),points[n][1]*cos(angle)+points[n][0]*sin(angle)]])); //Function to rotate 2D just the points of an airfoil

function translateASKX(points, x, n=0, output=[])= n>len(points)-1 ? output : translateASKX(points, x, n+1, concat(output, [[points[n][0]+x,points[n][1]]])); //Function to translate in the x axe just the points of an airfoil

function translateASKY(points, y, n=0, output=[])= n>len(points)-1 ? output : translateASKY(points, y, n+1, concat(output, [[points[n][0],points[n][1]+y]])); //Function to translate in the y axe just the points of an airfoil

function firstLine(points, n=1, output=[])=(points[n+1][0]-points[n][0])>=0 ? concat(output, [points[n]]) : firstLine(points, n+1, concat(output, [points[n]])); //Function to separete the upper points of an airfoil

function secondLine(points, n, output=[])=(points[n-1][0]-points[n][0])>0 ? output : secondLine(points, n-1, concat(output, [points[n]])); //Function to separete the lower points of an airfoil

function interpolate(points, n=1, output=[])=n>1000 ? concat([[0,0]],output) : interpolate(points, n+1, concat(output, [[n/1000, lookup(n/1000,points)]]));
function interpolateI(points, n=999, output=[])=n<=0 ? output : interpolateI(points, n-1, concat(output, [[n/1000, lookup(n/1000,points)]]));

function is_NACA(airfoil) = str(airfoil[0],airfoil[1],airfoil[2],airfoil[3])=="NACA" && len(airfoil)==8 ? true : false; 
