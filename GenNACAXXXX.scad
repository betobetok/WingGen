//////////////////////////////////////////////////////////////////////////////////////////
// LibFile: GenNACAXXXX.scad                                                            //
//                                                                                      //
//   Generat a NACA 4 digits airfoil                                                    //
//                                                                                      //
//   by Alberto Solorzano Kraemer, 2020, betobetok@gmail.com                            //
//   https://www.thingiverse.com/thing:4314863                                          //    
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
    
    Programa para generar perfiles NACA de la serie de 4 digitos tipo NACA(X1)(X2)(X3)(X4) donde:
    
    (X1) = Curvatura maxima en porcentaje de la cuerda 
    (X2) = Posicion de la curvatura maxima en decenas de porcentaje de la cuerda 
    (X3 y X4) = Espesor maximo en porcentaje de la cuerda 
    
    Ejemplo; NACA2412
    12% de espesor
    2% de curvatura ubicada en el 40% de la cuerda
    
    Para usar el software se puede llamar el modulo "GenNACA" o utilizar la funcion NACA
   
    sintaxis:
    
    Modulo     
    GenNACA()                                       : Genera un perfil NACA0012 con cuerda 10 y envergadura 0.1
    GenNACA(name="NACAXXXX")                        : Genera un perfil deacuerdo al nombre "name" con cuerda 10 y envergadura 0.1
    GenNACA(name="NACAXXXX",cuerda=X)               : Genera un perfil deacuerdo al nombre "name" con cuerda X y envergadura 0.1
    GenNACA(name="NACAXXXX",cuerda=X,extrucion=Y)   : Genera un perfil deacuerdo al nombre "name" con cuerda X y envergadura Y
    
    Funcion
    NACA()                          : Regresa las coordenadas del perfil NACA0012 en un arreglo [[0,0][x,-y]....[1,-y][0.9,y]....[x,y][0,0]]
    NACA(name="NACAXXXX")           : Regresa las coordenadas del perfil name en un arreglo [[0,0][x,-y]....[1,-y][0.9,y]....[x,y][0,0]]
*/

//EJEMPLOS:
GenNACA(name="NACA0012", cuerda=60, extrucion=50);
//echo(NACA(name="NACA0014"));

module GenNACA(name="NACA0012", cuerda=10, extrucion=0.1){
   assert((str(name[0],name[1],name[2],name[3])=="NACA" && len(name)==8), "Airfoil name must have NACA und 4 digits");
   linear_extrude(height = extrucion, center = true, convexity = 20) polygon(points=cuerda*NACA(name));
}


function NACA(name="NACA0012") = concat(thicknessb((((ord(name[6])-48)*10)+ord(name[7])-48)/100, (ord(name[5])-48)/10, (ord(name[4])-48)/100), thicknessa((((ord(name[6])-48)*10)+ord(name[7])-48)/100, (ord(name[5])-48)/10, (ord(name[4])-48)/100));

function thicknessa(t, p, m, x=1000, esp=[])= x==0 ? esp : thicknessa(t, p, m, x-1, concat(esp,[[(x/1000)-sin(theta(x/1000, p, m))*yt(t,x/1000),chamber(x/1000, p, m)+cos(theta(x/1000, p, m))*yt(t, x/1000)]]));

function thicknessb(t, p, m, x=1, esp=[[0,0]])= x==1000 ? esp : thicknessb(t, p, m, x+1, concat(esp,[[(x/1000)+sin(theta(x/1000, p, m))*yt(t,x/1000),chamber(x/1000, p, m)-cos(theta(x/1000, p, m))*yt(t, x/1000)]]));

function chamber(x, p, m) = x<=p ? (m/(pow(p,2)))*(2*p*(x)-pow(x,2)) : (m/(pow((1-p),2)))*((1-2*p)+2*p*x-pow(x,2));

function theta(x, p, m) = x<=p ? atan((2*m/(pow(p,2)))*(p-x)) : atan((2*m/(pow((1-p),2)))*(p-x));

function yt(t,x) = 5*t*((0.2969*pow(x,0.5))-(0.1260*x)-(0.3516*pow(x,2))+(0.2843*pow(x,3))-(0.1015*pow(x,4)));