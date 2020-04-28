# WingGen
enerate a wing with an airfoil from the catalog PerfilesASK
LibFile: 	WingsASK.scad                                                            
          	UtilidadesPerfil.scad                                                    
          	GenNACAXXXX.scad                                                         

   Generate a wing with an airfoil from the catalog PerfilesASK                       
                                                                                      
   by Alberto Solorzano Kraemer, 2020, betobetok@gmail.com                            
   https://www.thingiverse.com/...                                                    
   Airfoil data basis from UIUC                                                       
   (https://m-selig.ae.illinois.edu/ads/coord_database.html)                              
                                                                                      
   This file is public domain.  Use it for any purpose, including commercial          
   applications.  Attribution would be nice, but is not required.  There is           
   no warranty of any kind, including its correctness, usefulness, or safety.         

Author: Alberto Solorzano Kraemer ( betobetok@gmail.com )
    
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
    It creates an elliptical or semi-elliptical wing section. arrow, twist, dihedral, and r argument are optional. 
    
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
