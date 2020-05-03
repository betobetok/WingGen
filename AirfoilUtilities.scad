//////////////////////////////////////////////////////////////////////////////////////////
// LibFile: UtilidadesPerfil.scad                                                       //
//          PerfilesASK_1_0.scad                                                        //
//                                                                                      //
//   Generate a catalog of airfoils and utilities to use this catalog                   //
//                                                                                      //
//   by Alberto Solorzano Kraemer, 2020, betobetok@gmail.com                            //
//   https://www.thingiverse.com/...                                          //    
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
    
    Este archivo permite utilizar el catalog de perfiles almacenado en PerfilesASK_1_0.scad, cada perfil tiene un formato de arreglo de coordenadas perfil=[[0,0][0.01,y]..[x,y]..[1,y][0.99,y]..[x,y][0,0]], cada uno de estos archivos esta clasificado por su name y se puede accesas como modulo independiente mediante un llamado name(cuerda).
    
    Las funciones escritas en este codigo sirven para buscar y ejecutar cada uno de los modulos de los archivos almacenados en la base de datos, de modo que con el modulo buscar(airfoilNum) podemos encontrar y visualizar cada uno de los perfiles almacenados en la base de datos, accesando a ellos a traves del numero de catalog.
   
    El Modulo catalog() despliega todos los perfiles almacenados y los muestra con su numero de catalog y name.
    
    La funcion is_Airfoil(name) regresa 1 si el name se encuentra en la base de datos y 0 si el name no es encontrado, mientras que la funcion name(airfoilNum) regresa el str con el name del perfil correspondiente al numero de catalog intruducido por airfoilNum.
    
*/

use <PerfilesASK_1_0.scad>


module buscar(airfoilNum){
    translate([0,5,0]) airfoil(airfoilNames[airfoilNum-1], 10);
    text(airfoilNames[airfoilNum-1], font = "Liberation Sans", size = 1);
}
module catalog(){
    for(n=[0:len(airfoilNames)-1]){
        translate([n*25-(20*25*floor(n/20)),(10*floor(n/20))+5,0]) airfoil(airfoilNames[n], 10);
        translate([n*25-(20*25*floor(n/20)),(10*floor(n/20)),0]) text(str(n, " - ", airfoilNames[n]), font = "Liberation Sans", size = 1);
    }
}

function is_Airfoil(name, n=0)= name==airfoilNames[n] ? true :  n<len(airfoilNames) ? is_Airfoil(name, n+1) : false;
function name(airfoilNum)= airfoilNames[airfoilNum];


module airfoil(name, cuerda){ 
if(name=="Abrial17") Abrial17(cuerda);
if(name=="AS5045") AS5045(cuerda);
if(name=="AS5046") AS5046(cuerda);
if(name=="AS5048") AS5048(cuerda);
if(name=="AV_17_8cmo0012") AV_17_8cmo0012(cuerda);
if(name=="avx_planeur_perso_60Le") avx_planeur_perso_60Le(cuerda);
if(name=="avx_nitro__pour_60F3F") avx_nitro__pour_60F3F(cuerda);
if(name=="AZ2003az_emp") AZ2003az_emp(cuerda);
if(name=="AZ2003az_ext_") AZ2003az_ext_(cuerda);
if(name=="AZ2003az_moy") AZ2003az_moy(cuerda);
if(name=="AZ2004AZ_9_") AZ2004AZ_9_(cuerda);
if(name=="AZ_2005_Emplanture") AZ_2005_Emplanture(cuerda);
if(name=="AZ_2005") AZ_2005(cuerda);
if(name=="AZ_2005_moy") AZ_2005_moy(cuerda);
if(name=="az2007_8_14_emplanture") az2007_8_14_emplanture(cuerda);
if(name=="az2007_8_12_extremite") az2007_8_12_extremite(cuerda);
if(name=="az2007_8_13_milieu") az2007_8_13_milieu(cuerda);
if(name=="profilAile1") profilAile1(cuerda);
if(name=="profilAile2") profilAile2(cuerda);
if(name=="profilAile3") profilAile3(cuerda);
if(name=="AZcombat1") AZcombat1(cuerda);
if(name=="salazEmplanture") salazEmplanture(cuerda);
if(name=="salaz_moyExtremite") salaz_moyExtremite(cuerda);
if(name=="salazV3_empAZ") salazV3_empAZ(cuerda);
if(name=="salazV3_extAZ") salazV3_extAZ(cuerda);
if(name=="BE5030FVNC2datF1G") BE5030FVNC2datF1G(cuerda);
if(name=="BE5045FVNC2datF1G") BE5045FVNC2datF1G(cuerda);
if(name=="BE5655FVNC2datF1G") BE5655FVNC2datF1G(cuerda);
if(name=="BE656865") BE656865(cuerda);
if(name=="BE6699") BE6699(cuerda);
if(name=="Borge_b3") Borge_b3(cuerda);
if(name=="cap21") cap21(cuerda);
if(name=="CB2012chbaron") CB2012chbaron(cuerda);
if(name=="CB2195_25d") CB2195_25d(cuerda);
if(name=="CB2195chbaron") CB2195chbaron(cuerda);
if(name=="CB2513chbaron") CB2513chbaron(cuerda);
if(name=="CB2514chbaron") CB2514chbaron(cuerda);
if(name=="CB2515chbaron") CB2515chbaron(cuerda);
if(name=="CB3013chbaron") CB3013chbaron(cuerda);
if(name=="CB3512chbaron") CB3512chbaron(cuerda);
if(name=="CJ3209") CJ3209(cuerda);
if(name=="cristalcb85_15_7") cristalcb85_15_7(cuerda);
if(name=="DP168_837_DS") DP168_837_DS(cuerda);
if(name=="DP172_816_DS") DP172_816_DS(cuerda);
if(name=="DP172_832_DS") DP172_832_DS(cuerda);
if(name=="DP177_823_DS") DP177_823_DS(cuerda);
if(name=="DP179_837_DS") DP179_837_DS(cuerda);
if(name=="DP182_821_DS") DP182_821_DS(cuerda);
if(name=="DP187_907_DS") DP187_907_DS(cuerda);
if(name=="DP189_783") DP189_783(cuerda);
if(name=="DP200_855_DS") DP200_855_DS(cuerda);
if(name=="DP205_865_DS") DP205_865_DS(cuerda);
if(name=="DP206_867_DS") DP206_867_DS(cuerda);
if(name=="DP247_948_DS") DP247_948_DS(cuerda);
if(name=="DS19coords") DS19coords(cuerda);
if(name=="DS21") DS21(cuerda);
if(name=="DU86_137_25According") DU86_137_25According(cuerda);
if(name=="Profil") Profil(cuerda);
if(name=="EpplerEB380") EpplerEB380(cuerda);
if(name=="EH10_70") EH10_70(cuerda);
if(name=="Eiffel13") Eiffel13(cuerda);
if(name=="Eiffel33") Eiffel33(cuerda);
if(name=="Eiffel33") Eiffel33(cuerda);
if(name=="Eiffel371") Eiffel371(cuerda);
if(name=="Eiffel385") Eiffel385(cuerda);
if(name=="Eiffel400") Eiffel400(cuerda);
if(name=="Eiffel428") Eiffel428(cuerda);
if(name=="Eiffel430") Eiffel430(cuerda);
if(name=="FAD05_CNCFranckAguerre") FAD05_CNCFranckAguerre(cuerda);
if(name=="FAD05Flat_bottom") FAD05Flat_bottom(cuerda);
if(name=="FAD06_FranckAguerre_Pour_60et") FAD06_FranckAguerre_Pour_60et(cuerda);
if(name=="FAD07H2") FAD07H2(cuerda);
if(name=="FAD13FranckAguerre") FAD13FranckAguerre(cuerda);
if(name=="FAD14FranckAguerre") FAD14FranckAguerre(cuerda);
if(name=="FAD15H2") FAD15H2(cuerda);
if(name=="FAD16La") FAD16La(cuerda);
if(name=="FAD17special") FAD17special(cuerda);
if(name=="FAD18_FranckAguerre_Performances_pour_60etF3F") FAD18_FranckAguerre_Performances_pour_60etF3F(cuerda);
if(name=="FAD21FranckAguerre") FAD21FranckAguerre(cuerda);
if(name=="FAD23FranckAguerre") FAD23FranckAguerre(cuerda);
if(name=="FAD24FranckAguerre") FAD24FranckAguerre(cuerda);
if(name=="FAD04105") FAD04105(cuerda);
if(name=="EMX_07designed") EMX_07designed(cuerda);
if(name=="Profilspecial") Profilspecial(cuerda);
if(name=="HL73_650BHoreni") HL73_650BHoreni(cuerda);
if(name=="HL743512BHoreni") HL743512BHoreni(cuerda);
if(name=="HL74_351BHoreni") HL74_351BHoreni(cuerda);
if(name=="HL74_550BHoreni") HL74_550BHoreni(cuerda);
if(name=="HL75_541BHoreni") HL75_541BHoreni(cuerda);
if(name=="HL75_K_3BHoreni") HL75_K_3BHoreni(cuerda);
if(name=="HL80_133BHoreni") HL80_133BHoreni(cuerda);
if(name=="HM1001NF_Leistungsprofil") HM1001NF_Leistungsprofil(cuerda);
if(name=="HM10011NF_Leistungsprofil") HM10011NF_Leistungsprofil(cuerda);
if(name=="HM391_2Ein") HM391_2Ein(cuerda);
if(name=="MH391_1Ein") MH391_1Ein(cuerda);
if(name=="HM50dieser") HM50dieser(cuerda);
if(name=="HM50Tdieser") HM50Tdieser(cuerda);
if(name=="HM51Hammarskiold_Mattias") HM51Hammarskiold_Mattias(cuerda);
if(name=="HM55NF_Leistungsprofil") HM55NF_Leistungsprofil(cuerda);
if(name=="HM56NF_Leistungsprofil") HM56NF_Leistungsprofil(cuerda);
if(name=="HN_003Planeur35m") HN_003Planeur35m(cuerda);
if(name=="HN_032F3F") HN_032F3F(cuerda);
if(name=="HN_033F3B") HN_033F3B(cuerda);
if(name=="HN_034F3B") HN_034F3B(cuerda);
if(name=="HN_035F3B") HN_035F3B(cuerda);
if(name=="HN_036F3F") HN_036F3F(cuerda);
if(name=="HN_038F3F") HN_038F3F(cuerda);
if(name=="HN_1004HLG") HN_1004HLG(cuerda);
if(name=="HN1015") HN1015(cuerda);
if(name=="HN_1023Planeur35m") HN_1023Planeur35m(cuerda);
if(name=="HN_1027HLG") HN_1027HLG(cuerda);
if(name=="HN_1029HLG") HN_1029HLG(cuerda);
if(name=="HN1032") HN1032(cuerda);
if(name=="HN_1033AHLG") HN_1033AHLG(cuerda);
if(name=="HN_1033HLG") HN_1033HLG(cuerda);
if(name=="HN_1036Planeur") HN_1036Planeur(cuerda);
if(name=="HN_1038F3F") HN_1038F3F(cuerda);
if(name=="HN_1051Planeur") HN_1051Planeur(cuerda);
if(name=="HN_1054Planeur") HN_1054Planeur(cuerda);
if(name=="HN_1069aPlaneur35m") HN_1069aPlaneur35m(cuerda);
if(name=="HN_1069bPlaneur35m") HN_1069bPlaneur35m(cuerda);
if(name=="HN_1069cPlaneur35m") HN_1069cPlaneur35m(cuerda);
if(name=="HN1069") HN1069(cuerda);
if(name=="HN_1070HLG") HN_1070HLG(cuerda);
if(name=="HN_1091aPlaneur35m") HN_1091aPlaneur35m(cuerda);
if(name=="HN_1091bPlaneur35m") HN_1091bPlaneur35m(cuerda);
if(name=="HN_1091Planeur35m") HN_1091Planeur35m(cuerda);
if(name=="HN_153SAile") HN_153SAile(cuerda);
if(name=="HN_163F3B") HN_163F3B(cuerda);
if(name=="HN_163TAF3B") HN_163TAF3B(cuerda);
if(name=="HN_163TBF3B") HN_163TBF3B(cuerda);
if(name=="HN_184F3B") HN_184F3B(cuerda);
if(name=="HN_184MPlaneur") HN_184MPlaneur(cuerda);
if(name=="HN_188Planeur35m") HN_188Planeur35m(cuerda);
if(name=="HN_203Planeur35m") HN_203Planeur35m(cuerda);
if(name=="HN_211F3F_F3B") HN_211F3F_F3B(cuerda);
if(name=="HN_216F3B") HN_216F3B(cuerda);
if(name=="HN_216TAF3B") HN_216TAF3B(cuerda);
if(name=="HN_217F3J") HN_217F3J(cuerda);
if(name=="HN_227F3J") HN_227F3J(cuerda);
if(name=="HN_239F3J") HN_239F3J(cuerda);
if(name=="HN_274SAile") HN_274SAile(cuerda);
if(name=="HN_275SAile") HN_275SAile(cuerda);
if(name=="HN_276SAAile") HN_276SAAile(cuerda);
if(name=="HN_304Planeur35m") HN_304Planeur35m(cuerda);
if(name=="HN_304TAPlaneur35m") HN_304TAPlaneur35m(cuerda);
if(name=="HN_309Planeur35m") HN_309Planeur35m(cuerda);
if(name=="HN_30sAile") HN_30sAile(cuerda);
if(name=="HN_311SAile") HN_311SAile(cuerda);
if(name=="HN_312SAile") HN_312SAile(cuerda);
if(name=="HN_315SAile") HN_315SAile(cuerda);
if(name=="HN_316SAile") HN_316SAile(cuerda);
if(name=="HN_319Planeur35m") HN_319Planeur35m(cuerda);
if(name=="HN_321F3F") HN_321F3F(cuerda);
if(name=="HN_326F3F") HN_326F3F(cuerda);
if(name=="HN327F3B") HN327F3B(cuerda);
if(name=="HN_333F3J") HN_333F3J(cuerda);
if(name=="HN_33S") HN_33S(cuerda);
if(name=="HN_350F3B") HN_350F3B(cuerda);
if(name=="HN_350M01F3J") HN_350M01F3J(cuerda);
if(name=="HN_350M02F3J") HN_350M02F3J(cuerda);
if(name=="HN_352F3F") HN_352F3F(cuerda);
if(name=="HN_354ABASIC") HN_354ABASIC(cuerda);
if(name=="HN_354F3B") HN_354F3B(cuerda);
if(name=="HN_354EF3B") HN_354EF3B(cuerda);
if(name=="HN_354ESF3F") HN_354ESF3F(cuerda);
if(name=="HN_354OCF3J") HN_354OCF3J(cuerda);
if(name=="HN_354SMF3J") HN_354SMF3J(cuerda);
if(name=="HN_354SRF3F") HN_354SRF3F(cuerda);
if(name=="HN_360F3J") HN_360F3J(cuerda);
if(name=="HN_374F3B_F3F") HN_374F3B_F3F(cuerda);
if(name=="HN380") HN380(cuerda);
if(name=="HN_409Planeur35m") HN_409Planeur35m(cuerda);
if(name=="HN_411Planeur35m") HN_411Planeur35m(cuerda);
if(name=="HN_417F3J") HN_417F3J(cuerda);
if(name=="HN_418Planeur") HN_418Planeur(cuerda);
if(name=="HN_419HLG") HN_419HLG(cuerda);
if(name=="HN_424Planeur") HN_424Planeur(cuerda);
if(name=="HN_436F3F") HN_436F3F(cuerda);
if(name=="HN_446F3F") HN_446F3F(cuerda);
if(name=="HN450Planeur") HN450Planeur(cuerda);
if(name=="HN_450SPlaneur") HN_450SPlaneur(cuerda);
if(name=="HN_452F3B_F3F") HN_452F3B_F3F(cuerda);
if(name=="HN_456F3F") HN_456F3F(cuerda);
if(name=="HN_462F3F") HN_462F3F(cuerda);
if(name=="HN_464Planeur") HN_464Planeur(cuerda);
if(name=="HN_465F3J") HN_465F3J(cuerda);
if(name=="HN_470F3F") HN_470F3F(cuerda);
if(name=="HN_470jtF3J_F3B") HN_470jtF3J_F3B(cuerda);
if(name=="HN_470sAile") HN_470sAile(cuerda);
if(name=="HN_474Planeur35m") HN_474Planeur35m(cuerda);
if(name=="HN_475Planeur35m") HN_475Planeur35m(cuerda);
if(name=="HN_477S") HN_477S(cuerda);
if(name=="HN_478S") HN_478S(cuerda);
if(name=="HN_480") HN_480(cuerda);
if(name=="HN_483") HN_483(cuerda);
if(name=="HN_484") HN_484(cuerda);
if(name=="HN_507F3J") HN_507F3J(cuerda);
if(name=="HN_707") HN_707(cuerda);
if(name=="HN_785F3B") HN_785F3B(cuerda);
if(name=="HN_785SRF3F") HN_785SRF3F(cuerda);
if(name=="HN_801BASIC") HN_801BASIC(cuerda);
if(name=="HN_802") HN_802(cuerda);
if(name=="HN803") HN803(cuerda);
if(name=="HN_805F3F") HN_805F3F(cuerda);
if(name=="HN_808Planeur35m") HN_808Planeur35m(cuerda);
if(name=="HN_832Planeur35m") HN_832Planeur35m(cuerda);
if(name=="HN_832TAPlaneur35m") HN_832TAPlaneur35m(cuerda);
if(name=="HN838") HN838(cuerda);
if(name=="HN839D") HN839D(cuerda);
if(name=="HN840S") HN840S(cuerda);
if(name=="HN_951Planeur35m") HN_951Planeur35m(cuerda);
if(name=="HN955") HN955(cuerda);
if(name=="HN_956Planeur35m") HN_956Planeur35m(cuerda);
if(name=="HN959") HN959(cuerda);
if(name=="HN_961SAAile") HN_961SAAile(cuerda);
if(name=="HN968S") HN968S(cuerda);
if(name=="HN969") HN969(cuerda);
if(name=="HN_971Planeur35m") HN_971Planeur35m(cuerda);
if(name=="HN_972Planeur35m") HN_972Planeur35m(cuerda);
if(name=="HN_973F3J") HN_973F3J(cuerda);
if(name=="HN_974Planeur35m") HN_974Planeur35m(cuerda);
if(name=="HN_975Planeur35m") HN_975Planeur35m(cuerda);
if(name=="HN_975TAPlaneur35m") HN_975TAPlaneur35m(cuerda);
if(name=="HN_976SAile") HN_976SAile(cuerda);
if(name=="HN978") HN978(cuerda);
if(name=="HN_979HLG") HN_979HLG(cuerda);
if(name=="HN979DHLG") HN979DHLG(cuerda);
if(name=="HN_980Planeur35m") HN_980Planeur35m(cuerda);
if(name=="HN_981F3B") HN_981F3B(cuerda);
if(name=="HN984") HN984(cuerda);
if(name=="HN_989F3B") HN_989F3B(cuerda);
if(name=="HN_990F3B") HN_990F3B(cuerda);
if(name=="HN_997AHLG") HN_997AHLG(cuerda);
if(name=="HN_997BHLG") HN_997BHLG(cuerda);
if(name=="HN_998HLG") HN_998HLG(cuerda);
if(name=="HN_999HLG") HN_999HLG(cuerda);
if(name=="HortenStandard") HortenStandard(cuerda);
if(name=="HS17_9") HS17_9(cuerda);
if(name=="HS20_80") HS20_80(cuerda);
if(name=="HS30_8") HS30_8(cuerda);
if(name=="HS30_90") HS30_90(cuerda);
if(name=="HS3412b") HS3412b(cuerda);
if(name=="HS35_12") HS35_12(cuerda);
if(name=="HS510") HS510(cuerda);
if(name=="HS520") HS520(cuerda);
if(name=="HS522") HS522(cuerda);
if(name=="HS602") HS602(cuerda);
if(name=="HortenII") HortenII(cuerda);
if(name=="Phoenix") Phoenix(cuerda);
if(name=="n1000119") n1000119(cuerda);
if(name=="S5020") S5020(cuerda);
if(name=="Sipkill17_10") Sipkill17_10(cuerda);
if(name=="ISA571") ISA571(cuerda);
if(name=="ISA960") ISA960(cuerda);
if(name=="ISA961") ISA961(cuerda);
if(name=="ISA962") ISA962(cuerda);
if(name=="JedeslskyEJ1") JedeslskyEJ1(cuerda);
if(name=="JEDELSKYEJ") JEDELSKYEJ(cuerda);
if(name=="jwl0299_0") jwl0299_0(cuerda);
if(name=="jwl03075_09") jwl03075_09(cuerda);
if(name=="jwl0318_07") jwl0318_07(cuerda);
if(name=="jwl04111_35") jwl04111_35(cuerda);
if(name=="jwl04286_25") jwl04286_25(cuerda);
if(name=="jwl04388_21") jwl04388_21(cuerda);
if(name=="jwl04410_25") jwl04410_25(cuerda);
if(name=="jwl04592_27") jwl04592_27(cuerda);
if(name=="jwl04692_26") jwl04692_26(cuerda);
if(name=="jwl06579_17") jwl06579_17(cuerda);
if(name=="jwl06687_19") jwl06687_19(cuerda);
if(name=="jwl067115_17") jwl067115_17(cuerda);
if(name=="jwl06895_17") jwl06895_17(cuerda);
if(name=="jwl06911_0") jwl06911_0(cuerda);
if(name=="jwl07485_12") jwl07485_12(cuerda);
if(name=="jwl07588_176") jwl07588_176(cuerda);
if(name=="jwl07610_3") jwl07610_3(cuerda);
if(name=="jwl07710_2") jwl07710_2(cuerda);
if(name=="jwl0788_1") jwl0788_1(cuerda);
if(name=="jwl0799_7_2_7") jwl0799_7_2_7(cuerda);
if(name=="jwl08081_17") jwl08081_17(cuerda);
if(name=="jwl08111_13") jwl08111_13(cuerda);
if(name=="jwl82") jwl82(cuerda);
if(name=="jwl0977_7_1_6") jwl0977_7_1_6(cuerda);
if(name=="jwl1069_0") jwl1069_0(cuerda);
if(name=="HG40") HG40(cuerda);
if(name=="HG41") HG41(cuerda);
if(name=="HG42") HG42(cuerda);
if(name=="HG43") HG43(cuerda);
if(name=="M7372") M7372(cuerda);
if(name=="M77") M77(cuerda);
if(name=="mb7136F5B") mb7136F5B(cuerda);
if(name=="mb714F5B") mb714F5B(cuerda);
if(name=="mc813F5B") mc813F5B(cuerda);
if(name=="md8135F5B") md8135F5B(cuerda);
if(name=="md814F5B") md814F5B(cuerda);
if(name=="MG05Marcel") MG05Marcel(cuerda);
if(name=="MG06Marcel") MG06Marcel(cuerda);
if(name=="MG8") MG8(cuerda);
if(name=="MH102") MH102(cuerda);
if(name=="MH104") MH104(cuerda);
if(name=="MH106") MH106(cuerda);
if(name=="MH108") MH108(cuerda);
if(name=="MH110") MH110(cuerda);
if(name=="MH112") MH112(cuerda);
if(name=="MH113") MH113(cuerda);
if(name=="MH114") MH114(cuerda);
if(name=="MH115") MH115(cuerda);
if(name=="MH116") MH116(cuerda);
if(name=="MH117") MH117(cuerda);
if(name=="MH120") MH120(cuerda);
if(name=="MH121") MH121(cuerda);
if(name=="MH126") MH126(cuerda);
if(name=="MH16") MH16(cuerda);
if(name=="MH17") MH17(cuerda);
if(name=="MH18BMartin") MH18BMartin(cuerda);
if(name=="MH23Martin") MH23Martin(cuerda);
if(name=="MH24Martin") MH24Martin(cuerda);
if(name=="MH25Martin") MH25Martin(cuerda);
if(name=="MH26") MH26(cuerda);
if(name=="MH27Martin") MH27Martin(cuerda);
if(name=="MH28") MH28(cuerda);
if(name=="MH31") MH31(cuerda);
if(name=="MH33") MH33(cuerda);
if(name=="MH34") MH34(cuerda);
if(name=="MH44") MH44(cuerda);
if(name=="MH46") MH46(cuerda);
if(name=="MH49") MH49(cuerda);
if(name=="MH50") MH50(cuerda);
if(name=="MH51") MH51(cuerda);
if(name=="MH52") MH52(cuerda);
if(name=="MH53") MH53(cuerda);
if(name=="MH54") MH54(cuerda);
if(name=="MH64") MH64(cuerda);
if(name=="MH78") MH78(cuerda);
if(name=="MH91") MH91(cuerda);
if(name=="MH92") MH92(cuerda);
if(name=="MH93") MH93(cuerda);
if(name=="MID10") MID10(cuerda);
if(name=="MID011_3") MID011_3(cuerda);
if(name=="MID011_4") MID011_4(cuerda);
if(name=="MID011_0") MID011_0(cuerda);
if(name=="MID12_1") MID12_1(cuerda);
if(name=="MID12") MID12(cuerda);
if(name=="MID13") MID13(cuerda);
if(name=="MID15") MID15(cuerda);
if(name=="MID20") MID20(cuerda);
if(name=="MID21") MID21(cuerda);
if(name=="MID22") MID22(cuerda);
if(name=="MID27") MID27(cuerda);
if(name=="MID29") MID29(cuerda);
if(name=="MID101") MID101(cuerda);
if(name=="MID101") MID101(cuerda);
if(name=="MID103b") MID103b(cuerda);
if(name=="MID103") MID103(cuerda);
if(name=="MID103") MID103(cuerda);
if(name=="MID104") MID104(cuerda);
if(name=="MID105") MID105(cuerda);
if(name=="MID106") MID106(cuerda);
if(name=="MID107") MID107(cuerda);
if(name=="MID108a") MID108a(cuerda);
if(name=="MID108b") MID108b(cuerda);
if(name=="MID110") MID110(cuerda);
if(name=="MID111") MID111(cuerda);
if(name=="MID112") MID112(cuerda);
if(name=="MID113") MID113(cuerda);
if(name=="MID114") MID114(cuerda);
if(name=="MID115_7") MID115_7(cuerda);
if(name=="MID115") MID115(cuerda);
if(name=="MID116") MID116(cuerda);
if(name=="MID117") MID117(cuerda);
if(name=="MID118") MID118(cuerda);
if(name=="MID120") MID120(cuerda);
if(name=="MID122") MID122(cuerda);
if(name=="MID151a") MID151a(cuerda);
if(name=="MID151b") MID151b(cuerda);
if(name=="MID151") MID151(cuerda);
if(name=="MID153a") MID153a(cuerda);
if(name=="MID153b") MID153b(cuerda);
if(name=="MID153") MID153(cuerda);
if(name=="MID173") MID173(cuerda);
if(name=="MID304") MID304(cuerda);
if(name=="Mid309") Mid309(cuerda);
if(name=="MID311") MID311(cuerda);
if(name=="MID_31F3J") MID_31F3J(cuerda);
if(name=="MID321a") MID321a(cuerda);
if(name=="MID321b") MID321b(cuerda);
if(name=="mid321") mid321(cuerda);
if(name=="mid321d") mid321d(cuerda);
if(name=="MID321e") MID321e(cuerda);
if(name=="MID322") MID322(cuerda);
if(name=="MID327") MID327(cuerda);
if(name=="MID327") MID327(cuerda);
if(name=="MID327_18") MID327_18(cuerda);
if(name=="MID327") MID327(cuerda);
if(name=="MID_32F3J") MID_32F3J(cuerda);
if(name=="MID_33F3J") MID_33F3J(cuerda);
if(name=="MID343") MID343(cuerda);
if(name=="MID_34F3J") MID_34F3J(cuerda);
if(name=="MID_36F5Js") MID_36F5Js(cuerda);
if(name=="MID371AW") MID371AW(cuerda);
if(name=="MID371") MID371(cuerda);
if(name=="MID_37F5Js") MID_37F5Js(cuerda);
if(name=="MID_38F5Js") MID_38F5Js(cuerda);
if(name=="MID393") MID393(cuerda);
if(name=="MID393") MID393(cuerda);
if(name=="MID_39F5Js") MID_39F5Js(cuerda);
if(name=="MID403") MID403(cuerda);
if(name=="MID405e") MID405e(cuerda);
if(name=="MID405w2") MID405w2(cuerda);
if(name=="MID406w2") MID406w2(cuerda);
if(name=="MID415") MID415(cuerda);
if(name=="MID455") MID455(cuerda);
if(name=="MIDH2A") MIDH2A(cuerda);
if(name=="MIDH2B") MIDH2B(cuerda);
if(name=="MIDH2D") MIDH2D(cuerda);
if(name=="mjp711f_3Flying") mjp711f_3Flying(cuerda);
if(name=="mjp712") mjp712(cuerda);
if(name=="mjz1211") mjz1211(cuerda);
if(name=="ms1_9_8_7f3i") ms1_9_8_7f3i(cuerda);
if(name=="MS25_11GPVFlapped") MS25_11GPVFlapped(cuerda);
if(name=="MS25_13GPVFlapped") MS25_13GPVFlapped(cuerda);
if(name=="MS25_15GPVFlapped") MS25_15GPVFlapped(cuerda);
if(name=="ms2_95f3i") ms2_95f3i(cuerda);
if(name=="MS3_11GPVFlapped") MS3_11GPVFlapped(cuerda);
if(name=="MS3_11Retrom_scherrer") MS3_11Retrom_scherrer(cuerda);
if(name=="MS3_13GPVFlapped") MS3_13GPVFlapped(cuerda);
if(name=="MS3_13Retrom_scherrer") MS3_13Retrom_scherrer(cuerda);
if(name=="MS3_14Retrom_scherrer") MS3_14Retrom_scherrer(cuerda);
if(name=="MS3_15GPVFlapped") MS3_15GPVFlapped(cuerda);
if(name=="MS3_15Retrom_scherrer") MS3_15Retrom_scherrer(cuerda);
if(name=="MS3_3_11G") MS3_3_11G(cuerda);
if(name=="MS3_3_11GPT") MS3_3_11GPT(cuerda);
if(name=="MS3_3_13GPmiddle") MS3_3_13GPmiddle(cuerda);
if(name=="MS3_3_15GProot") MS3_3_15GProot(cuerda);
if(name=="MS535_1profil") MS535_1profil(cuerda);
if(name=="MS535_2profil") MS535_2profil(cuerda);
if(name=="MS535_3Vprofil") MS535_3Vprofil(cuerda);
if(name=="msa812F5B") msa812F5B(cuerda);
if(name=="mve8516F3B") mve8516F3B(cuerda);
if(name=="mve8516f") mve8516f(cuerda);
if(name=="VANE15") VANE15(cuerda);
if(name=="NACA64_212") NACA64_212(cuerda);
if(name=="NACA23009") NACA23009(cuerda);
if(name=="NACA23015") NACA23015(cuerda);
if(name=="NACA63A612") NACA63A612(cuerda);
if(name=="NACA64A410") NACA64A410(cuerda);
if(name=="NACA_K6EEmplanture") NACA_K6EEmplanture(cuerda);
if(name=="NACA_K6Mmediane") NACA_K6Mmediane(cuerda);
if(name=="NACA_K6SSaumon") NACA_K6SSaumon(cuerda);
if(name=="Prisedair") Prisedair(cuerda);
if(name=="NN18_17") NN18_17(cuerda);
if(name=="Pegasecoap") Pegasecoap(cuerda);
if(name=="avionsRC") avionsRC(cuerda);
if(name=="PW106") PW106(cuerda);
if(name=="PW1211") PW1211(cuerda);
if(name=="PW51plank") PW51plank(cuerda);
if(name=="PW75") PW75(cuerda);
if(name=="RITZ1_30_10") RITZ1_30_10(cuerda);
if(name=="Ritz1_30_12") Ritz1_30_12(cuerda);
if(name=="Ritz2_30_10") Ritz2_30_10(cuerda);
if(name=="Ritz2_30_12") Ritz2_30_12(cuerda);
if(name=="Ritz3_30_10") Ritz3_30_10(cuerda);
if(name=="AIR100_2") AIR100_2(cuerda);
if(name=="RhodeSt") RhodeSt(cuerda);
if(name=="RhodeSt") RhodeSt(cuerda);
if(name=="Ritz3_30_12") Ritz3_30_12(cuerda);
if(name=="Ritz3_30_15") Ritz3_30_15(cuerda);
if(name=="AirfoilRK40") AirfoilRK40(cuerda);
if(name=="Rs001m60Reinhard") Rs001m60Reinhard(cuerda);
if(name=="Rs001m75Reinhard") Rs001m75Reinhard(cuerda);
if(name=="Rs001tReinhard") Rs001tReinhard(cuerda);
if(name=="Rs004atReinhard") Rs004atReinhard(cuerda);
if(name=="RC_MilanUrs") RC_MilanUrs(cuerda);
if(name=="MU85_173") MU85_173(cuerda);
if(name=="SB95105_2") SB95105_2(cuerda);
if(name=="SB95115_2") SB95115_2(cuerda);
if(name=="SB9595_2") SB9595_2(cuerda);
if(name=="SB96105_30") SB96105_30(cuerda);
if(name=="SB96116_30") SB96116_30(cuerda);
if(name=="SB96") SB96(cuerda);
if(name=="SB96DTRAINER") SB96DTRAINER(cuerda);
if(name=="SB96LM") SB96LM(cuerda);
if(name=="SB96MU") SB96MU(cuerda);
if(name=="SB96V_935_125") SB96V_935_125(cuerda);
if(name=="SB96VS_975_125") SB96VS_975_125(cuerda);
if(name=="SB97") SB97(cuerda);
if(name=="SB97EP_92_19") SB97EP_92_19(cuerda);
if(name=="SB97EPW_8_2") SB97EPW_8_2(cuerda);
if(name=="SB97FW") SB97FW(cuerda);
if(name=="SB98F3J_8_35") SB98F3J_8_35(cuerda);
if(name=="SB98") SB98(cuerda);
if(name=="SB98") SB98(cuerda);
if(name=="SB98") SB98(cuerda);
if(name=="ASW22733m") ASW22733m(cuerda);
if(name=="ASW_733mde") ASW_733mde(cuerda);
if(name=="SB99blkmMilieu") SB99blkmMilieu(cuerda);
if(name=="SB99blkrEmplanture") SB99blkrEmplanture(cuerda);
if(name=="SB99blksSaumon") SB99blksSaumon(cuerda);
if(name=="SB99") SB99(cuerda);
if(name=="SBC3profil") SBC3profil(cuerda);
if(name=="SibniaS_16") SibniaS_16(cuerda);
if(name=="SM8016m") SM8016m(cuerda);
if(name=="SM8516m") SM8516m(cuerda);
if(name=="STROM98Wurzelprofil") STROM98Wurzelprofil(cuerda);
if(name=="SU_26Ml") SU_26Ml(cuerda);
if(name=="EdgeRoot") EdgeRoot(cuerda);
if(name=="EdgeTip") EdgeTip(cuerda);
if(name=="NACA09210") NACA09210(cuerda);
if(name=="TP100plank") TP100plank(cuerda);
if(name=="TP202_10Th") TP202_10Th(cuerda);
if(name=="TP202_9Th") TP202_9Th(cuerda);
if(name=="TP204polyvalent") TP204polyvalent(cuerda);
if(name=="TP210_10Th") TP210_10Th(cuerda);
if(name=="TP210_11Th") TP210_11Th(cuerda);
if(name=="TP28_0opt_26") TP28_0opt_26(cuerda);
if(name=="TP28_4Voltige") TP28_4Voltige(cuerda);
if(name=="TP28_60Voltige") TP28_60Voltige(cuerda);
if(name=="TP28_LVoltige") TP28_LVoltige(cuerda);
if(name=="TP28_milieuTh") TP28_milieuTh(cuerda);
if(name=="TP28_saumonSYMETRIX") TP28_saumonSYMETRIX(cuerda);
if(name=="TP29_5Profil") TP29_5Profil(cuerda);
if(name=="TP29_6Profil") TP29_6Profil(cuerda);
if(name=="TP29_7Profil") TP29_7Profil(cuerda);
if(name=="TP29_1_85MU28") TP29_1_85MU28(cuerda);
if(name=="TP29_8Profil") TP29_8Profil(cuerda);
if(name=="TP29_9Saumon") TP29_9Saumon(cuerda);
if(name=="TP36_95MU28") TP36_95MU28(cuerda);
if(name=="TP36_95_TP29_85MU28") TP36_95_TP29_85MU28(cuerda);
if(name=="TP42Emplanture") TP42Emplanture(cuerda);
if(name=="TP50_DSperfo") TP50_DSperfo(cuerda);
if(name=="TP60J") TP60J(cuerda);
if(name=="TP66Emplanture") TP66Emplanture(cuerda);
if(name=="TP66_SSaumon") TP66_SSaumon(cuerda);
if(name=="TP73_60inch") TP73_60inch(cuerda);
if(name=="TP96_05ThPlaton") TP96_05ThPlaton(cuerda);
if(name=="TP96_075Th") TP96_075Th(cuerda);
if(name=="TP96_125Th") TP96_125Th(cuerda);
if(name=="TP96_1Th") TP96_1Th(cuerda);
if(name=="TP_CIEL_SVoltige") TP_CIEL_SVoltige(cuerda);
if(name=="EmplantureTPr_95_96_95") EmplantureTPr_95_96_95(cuerda);
if(name=="Profilevolution") Profilevolution(cuerda);
if(name=="tt54profil") tt54profil(cuerda);
if(name=="UplinkDLG") UplinkDLG(cuerda);
if(name=="ZAGI8") ZAGI8(cuerda);
if(name=="ZAGI10") ZAGI10(cuerda);
if(name=="ZAGI12") ZAGI12(cuerda);
if(name=="Zone_21for") Zone_21for(cuerda);
if(name=="Zone_25for") Zone_25for(cuerda);
if(name=="Zone_36for") Zone_36for(cuerda);
if(name=="Zone_40for") Zone_40for(cuerda);
if(name=="Zone_46for") Zone_46for(cuerda);
if(name=="s3021") s3021(cuerda);
if(name=="s3016") s3016(cuerda);
}

function airfoil(name)= 
name=="Abrial17" ? Abrial17() :
name=="AS5045" ? AS5045() :
name=="AS5046" ? AS5046() :
name=="AS5048" ? AS5048() :
name=="AV_17_8cmo0012" ? AV_17_8cmo0012() :
name=="avx_planeur_perso_60Le" ? avx_planeur_perso_60Le() :
name=="avx_nitro__pour_60F3F" ? avx_nitro__pour_60F3F() :
name=="AZ2003az_emp" ? AZ2003az_emp() :
name=="AZ2003az_ext_" ? AZ2003az_ext_() :
name=="AZ2003az_moy" ? AZ2003az_moy() :
name=="AZ2004AZ_9_" ? AZ2004AZ_9_() :
name=="AZ_2005_Emplanture" ? AZ_2005_Emplanture() :
name=="AZ_2005" ? AZ_2005() :
name=="AZ_2005_moy" ? AZ_2005_moy() :
name=="az2007_8_14_emplanture" ? az2007_8_14_emplanture() :
name=="az2007_8_12_extremite" ? az2007_8_12_extremite() :
name=="az2007_8_13_milieu" ? az2007_8_13_milieu() :
name=="profilAile1" ? profilAile1() :
name=="profilAile2" ? profilAile2() :
name=="profilAile3" ? profilAile3() :
name=="AZcombat1" ? AZcombat1() :
name=="salazEmplanture" ? salazEmplanture() :
name=="salaz_moyExtremite" ? salaz_moyExtremite() :
name=="salazV3_empAZ" ? salazV3_empAZ() :
name=="salazV3_extAZ" ? salazV3_extAZ() :
name=="BE5030FVNC2datF1G" ? BE5030FVNC2datF1G() :
name=="BE5045FVNC2datF1G" ? BE5045FVNC2datF1G() :
name=="BE5655FVNC2datF1G" ? BE5655FVNC2datF1G() :
name=="BE656865" ? BE656865() :
name=="BE6699" ? BE6699() :
name=="Borge_b3" ? Borge_b3() :
name=="cap21" ? cap21() :
name=="CB2012chbaron" ? CB2012chbaron() :
name=="CB2195_25d" ? CB2195_25d() :
name=="CB2195chbaron" ? CB2195chbaron() :
name=="CB2513chbaron" ? CB2513chbaron() :
name=="CB2514chbaron" ? CB2514chbaron() :
name=="CB2515chbaron" ? CB2515chbaron() :
name=="CB3013chbaron" ? CB3013chbaron() :
name=="CB3512chbaron" ? CB3512chbaron() :
name=="CJ3209" ? CJ3209() :
name=="cristalcb85_15_7" ? cristalcb85_15_7() :
name=="DP168_837_DS" ? DP168_837_DS() :
name=="DP172_816_DS" ? DP172_816_DS() :
name=="DP172_832_DS" ? DP172_832_DS() :
name=="DP177_823_DS" ? DP177_823_DS() :
name=="DP179_837_DS" ? DP179_837_DS() :
name=="DP182_821_DS" ? DP182_821_DS() :
name=="DP187_907_DS" ? DP187_907_DS() :
name=="DP189_783" ? DP189_783() :
name=="DP200_855_DS" ? DP200_855_DS() :
name=="DP205_865_DS" ? DP205_865_DS() :
name=="DP206_867_DS" ? DP206_867_DS() :
name=="DP247_948_DS" ? DP247_948_DS() :
name=="DS19coords" ? DS19coords() :
name=="DS21" ? DS21() :
name=="DU86_137_25According" ? DU86_137_25According() :
name=="Profil" ? Profil() :
name=="EpplerEB380" ? EpplerEB380() :
name=="EH10_70" ? EH10_70() :
name=="Eiffel13" ? Eiffel13() :
name=="Eiffel33" ? Eiffel33() :
name=="Eiffel33" ? Eiffel33() :
name=="Eiffel371" ? Eiffel371() :
name=="Eiffel385" ? Eiffel385() :
name=="Eiffel400" ? Eiffel400() :
name=="Eiffel428" ? Eiffel428() :
name=="Eiffel430" ? Eiffel430() :
name=="FAD05_CNCFranckAguerre" ? FAD05_CNCFranckAguerre() :
name=="FAD05Flat_bottom" ? FAD05Flat_bottom() :
name=="FAD06_FranckAguerre_Pour_60et" ? FAD06_FranckAguerre_Pour_60et() :
name=="FAD07H2" ? FAD07H2() :
name=="FAD13FranckAguerre" ? FAD13FranckAguerre() :
name=="FAD14FranckAguerre" ? FAD14FranckAguerre() :
name=="FAD15H2" ? FAD15H2() :
name=="FAD16La" ? FAD16La() :
name=="FAD17special" ? FAD17special() :
name=="FAD18_FranckAguerre_Performances_pour_60etF3F" ? FAD18_FranckAguerre_Performances_pour_60etF3F() :
name=="FAD21FranckAguerre" ? FAD21FranckAguerre() :
name=="FAD23FranckAguerre" ? FAD23FranckAguerre() :
name=="FAD24FranckAguerre" ? FAD24FranckAguerre() :
name=="FAD04105" ? FAD04105() :
name=="EMX_07designed" ? EMX_07designed() :
name=="Profilspecial" ? Profilspecial() :
name=="HL73_650BHoreni" ? HL73_650BHoreni() :
name=="HL743512BHoreni" ? HL743512BHoreni() :
name=="HL74_351BHoreni" ? HL74_351BHoreni() :
name=="HL74_550BHoreni" ? HL74_550BHoreni() :
name=="HL75_541BHoreni" ? HL75_541BHoreni() :
name=="HL75_K_3BHoreni" ? HL75_K_3BHoreni() :
name=="HL80_133BHoreni" ? HL80_133BHoreni() :
name=="HM1001NF_Leistungsprofil" ? HM1001NF_Leistungsprofil() :
name=="HM10011NF_Leistungsprofil" ? HM10011NF_Leistungsprofil() :
name=="HM391_2Ein" ? HM391_2Ein() :
name=="MH391_1Ein" ? MH391_1Ein() :
name=="HM50dieser" ? HM50dieser() :
name=="HM50Tdieser" ? HM50Tdieser() :
name=="HM51Hammarskiold_Mattias" ? HM51Hammarskiold_Mattias() :
name=="HM55NF_Leistungsprofil" ? HM55NF_Leistungsprofil() :
name=="HM56NF_Leistungsprofil" ? HM56NF_Leistungsprofil() :
name=="HN_003Planeur35m" ? HN_003Planeur35m() :
name=="HN_032F3F" ? HN_032F3F() :
name=="HN_033F3B" ? HN_033F3B() :
name=="HN_034F3B" ? HN_034F3B() :
name=="HN_035F3B" ? HN_035F3B() :
name=="HN_036F3F" ? HN_036F3F() :
name=="HN_038F3F" ? HN_038F3F() :
name=="HN_1004HLG" ? HN_1004HLG() :
name=="HN1015" ? HN1015() :
name=="HN_1023Planeur35m" ? HN_1023Planeur35m() :
name=="HN_1027HLG" ? HN_1027HLG() :
name=="HN_1029HLG" ? HN_1029HLG() :
name=="HN1032" ? HN1032() :
name=="HN_1033AHLG" ? HN_1033AHLG() :
name=="HN_1033HLG" ? HN_1033HLG() :
name=="HN_1036Planeur" ? HN_1036Planeur() :
name=="HN_1038F3F" ? HN_1038F3F() :
name=="HN_1051Planeur" ? HN_1051Planeur() :
name=="HN_1054Planeur" ? HN_1054Planeur() :
name=="HN_1069aPlaneur35m" ? HN_1069aPlaneur35m() :
name=="HN_1069bPlaneur35m" ? HN_1069bPlaneur35m() :
name=="HN_1069cPlaneur35m" ? HN_1069cPlaneur35m() :
name=="HN1069" ? HN1069() :
name=="HN_1070HLG" ? HN_1070HLG() :
name=="HN_1091aPlaneur35m" ? HN_1091aPlaneur35m() :
name=="HN_1091bPlaneur35m" ? HN_1091bPlaneur35m() :
name=="HN_1091Planeur35m" ? HN_1091Planeur35m() :
name=="HN_153SAile" ? HN_153SAile() :
name=="HN_163F3B" ? HN_163F3B() :
name=="HN_163TAF3B" ? HN_163TAF3B() :
name=="HN_163TBF3B" ? HN_163TBF3B() :
name=="HN_184F3B" ? HN_184F3B() :
name=="HN_184MPlaneur" ? HN_184MPlaneur() :
name=="HN_188Planeur35m" ? HN_188Planeur35m() :
name=="HN_203Planeur35m" ? HN_203Planeur35m() :
name=="HN_211F3F_F3B" ? HN_211F3F_F3B() :
name=="HN_216F3B" ? HN_216F3B() :
name=="HN_216TAF3B" ? HN_216TAF3B() :
name=="HN_217F3J" ? HN_217F3J() :
name=="HN_227F3J" ? HN_227F3J() :
name=="HN_239F3J" ? HN_239F3J() :
name=="HN_274SAile" ? HN_274SAile() :
name=="HN_275SAile" ? HN_275SAile() :
name=="HN_276SAAile" ? HN_276SAAile() :
name=="HN_304Planeur35m" ? HN_304Planeur35m() :
name=="HN_304TAPlaneur35m" ? HN_304TAPlaneur35m() :
name=="HN_309Planeur35m" ? HN_309Planeur35m() :
name=="HN_30sAile" ? HN_30sAile() :
name=="HN_311SAile" ? HN_311SAile() :
name=="HN_312SAile" ? HN_312SAile() :
name=="HN_315SAile" ? HN_315SAile() :
name=="HN_316SAile" ? HN_316SAile() :
name=="HN_319Planeur35m" ? HN_319Planeur35m() :
name=="HN_321F3F" ? HN_321F3F() :
name=="HN_326F3F" ? HN_326F3F() :
name=="HN327F3B" ? HN327F3B() :
name=="HN_333F3J" ? HN_333F3J() :
name=="HN_33S" ? HN_33S() :
name=="HN_350F3B" ? HN_350F3B() :
name=="HN_350M01F3J" ? HN_350M01F3J() :
name=="HN_350M02F3J" ? HN_350M02F3J() :
name=="HN_352F3F" ? HN_352F3F() :
name=="HN_354ABASIC" ? HN_354ABASIC() :
name=="HN_354F3B" ? HN_354F3B() :
name=="HN_354EF3B" ? HN_354EF3B() :
name=="HN_354ESF3F" ? HN_354ESF3F() :
name=="HN_354OCF3J" ? HN_354OCF3J() :
name=="HN_354SMF3J" ? HN_354SMF3J() :
name=="HN_354SRF3F" ? HN_354SRF3F() :
name=="HN_360F3J" ? HN_360F3J() :
name=="HN_374F3B_F3F" ? HN_374F3B_F3F() :
name=="HN380" ? HN380() :
name=="HN_409Planeur35m" ? HN_409Planeur35m() :
name=="HN_411Planeur35m" ? HN_411Planeur35m() :
name=="HN_417F3J" ? HN_417F3J() :
name=="HN_418Planeur" ? HN_418Planeur() :
name=="HN_419HLG" ? HN_419HLG() :
name=="HN_424Planeur" ? HN_424Planeur() :
name=="HN_436F3F" ? HN_436F3F() :
name=="HN_446F3F" ? HN_446F3F() :
name=="HN450Planeur" ? HN450Planeur() :
name=="HN_450SPlaneur" ? HN_450SPlaneur() :
name=="HN_452F3B_F3F" ? HN_452F3B_F3F() :
name=="HN_456F3F" ? HN_456F3F() :
name=="HN_462F3F" ? HN_462F3F() :
name=="HN_464Planeur" ? HN_464Planeur() :
name=="HN_465F3J" ? HN_465F3J() :
name=="HN_470F3F" ? HN_470F3F() :
name=="HN_470jtF3J_F3B" ? HN_470jtF3J_F3B() :
name=="HN_470sAile" ? HN_470sAile() :
name=="HN_474Planeur35m" ? HN_474Planeur35m() :
name=="HN_475Planeur35m" ? HN_475Planeur35m() :
name=="HN_477S" ? HN_477S() :
name=="HN_478S" ? HN_478S() :
name=="HN_480" ? HN_480() :
name=="HN_483" ? HN_483() :
name=="HN_484" ? HN_484() :
name=="HN_507F3J" ? HN_507F3J() :
name=="HN_707" ? HN_707() :
name=="HN_785F3B" ? HN_785F3B() :
name=="HN_785SRF3F" ? HN_785SRF3F() :
name=="HN_801BASIC" ? HN_801BASIC() :
name=="HN_802" ? HN_802() :
name=="HN803" ? HN803() :
name=="HN_805F3F" ? HN_805F3F() :
name=="HN_808Planeur35m" ? HN_808Planeur35m() :
name=="HN_832Planeur35m" ? HN_832Planeur35m() :
name=="HN_832TAPlaneur35m" ? HN_832TAPlaneur35m() :
name=="HN838" ? HN838() :
name=="HN839D" ? HN839D() :
name=="HN840S" ? HN840S() :
name=="HN_951Planeur35m" ? HN_951Planeur35m() :
name=="HN955" ? HN955() :
name=="HN_956Planeur35m" ? HN_956Planeur35m() :
name=="HN959" ? HN959() :
name=="HN_961SAAile" ? HN_961SAAile() :
name=="HN968S" ? HN968S() :
name=="HN969" ? HN969() :
name=="HN_971Planeur35m" ? HN_971Planeur35m() :
name=="HN_972Planeur35m" ? HN_972Planeur35m() :
name=="HN_973F3J" ? HN_973F3J() :
name=="HN_974Planeur35m" ? HN_974Planeur35m() :
name=="HN_975Planeur35m" ? HN_975Planeur35m() :
name=="HN_975TAPlaneur35m" ? HN_975TAPlaneur35m() :
name=="HN_976SAile" ? HN_976SAile() :
name=="HN978" ? HN978() :
name=="HN_979HLG" ? HN_979HLG() :
name=="HN979DHLG" ? HN979DHLG() :
name=="HN_980Planeur35m" ? HN_980Planeur35m() :
name=="HN_981F3B" ? HN_981F3B() :
name=="HN984" ? HN984() :
name=="HN_989F3B" ? HN_989F3B() :
name=="HN_990F3B" ? HN_990F3B() :
name=="HN_997AHLG" ? HN_997AHLG() :
name=="HN_997BHLG" ? HN_997BHLG() :
name=="HN_998HLG" ? HN_998HLG() :
name=="HN_999HLG" ? HN_999HLG() :
name=="HortenStandard" ? HortenStandard() :
name=="HS17_9" ? HS17_9() :
name=="HS20_80" ? HS20_80() :
name=="HS30_8" ? HS30_8() :
name=="HS30_90" ? HS30_90() :
name=="HS3412b" ? HS3412b() :
name=="HS35_12" ? HS35_12() :
name=="HS510" ? HS510() :
name=="HS520" ? HS520() :
name=="HS522" ? HS522() :
name=="HS602" ? HS602() :
name=="HortenII" ? HortenII() :
name=="Phoenix" ? Phoenix() :
name=="n1000119" ? n1000119() :
name=="S5020" ? S5020() :
name=="Sipkill17_10" ? Sipkill17_10() :
name=="ISA571" ? ISA571() :
name=="ISA960" ? ISA960() :
name=="ISA961" ? ISA961() :
name=="ISA962" ? ISA962() :
name=="JedeslskyEJ1" ? JedeslskyEJ1() :
name=="JEDELSKYEJ" ? JEDELSKYEJ() :
name=="jwl0299_0" ? jwl0299_0() :
name=="jwl03075_09" ? jwl03075_09() :
name=="jwl0318_07" ? jwl0318_07() :
name=="jwl04111_35" ? jwl04111_35() :
name=="jwl04286_25" ? jwl04286_25() :
name=="jwl04388_21" ? jwl04388_21() :
name=="jwl04410_25" ? jwl04410_25() :
name=="jwl04592_27" ? jwl04592_27() :
name=="jwl04692_26" ? jwl04692_26() :
name=="jwl06579_17" ? jwl06579_17() :
name=="jwl06687_19" ? jwl06687_19() :
name=="jwl067115_17" ? jwl067115_17() :
name=="jwl06895_17" ? jwl06895_17() :
name=="jwl06911_0" ? jwl06911_0() :
name=="jwl07485_12" ? jwl07485_12() :
name=="jwl07588_176" ? jwl07588_176() :
name=="jwl07610_3" ? jwl07610_3() :
name=="jwl07710_2" ? jwl07710_2() :
name=="jwl0788_1" ? jwl0788_1() :
name=="jwl0799_7_2_7" ? jwl0799_7_2_7() :
name=="jwl08081_17" ? jwl08081_17() :
name=="jwl08111_13" ? jwl08111_13() :
name=="jwl82" ? jwl82() :
name=="jwl0977_7_1_6" ? jwl0977_7_1_6() :
name=="jwl1069_0" ? jwl1069_0() :
name=="HG40" ? HG40() :
name=="HG41" ? HG41() :
name=="HG42" ? HG42() :
name=="HG43" ? HG43() :
name=="M7372" ? M7372() :
name=="M77" ? M77() :
name=="mb7136F5B" ? mb7136F5B() :
name=="mb714F5B" ? mb714F5B() :
name=="mc813F5B" ? mc813F5B() :
name=="md8135F5B" ? md8135F5B() :
name=="md814F5B" ? md814F5B() :
name=="MG05Marcel" ? MG05Marcel() :
name=="MG06Marcel" ? MG06Marcel() :
name=="MG8" ? MG8() :
name=="MH102" ? MH102() :
name=="MH104" ? MH104() :
name=="MH106" ? MH106() :
name=="MH108" ? MH108() :
name=="MH110" ? MH110() :
name=="MH112" ? MH112() :
name=="MH113" ? MH113() :
name=="MH114" ? MH114() :
name=="MH115" ? MH115() :
name=="MH116" ? MH116() :
name=="MH117" ? MH117() :
name=="MH120" ? MH120() :
name=="MH121" ? MH121() :
name=="MH126" ? MH126() :
name=="MH16" ? MH16() :
name=="MH17" ? MH17() :
name=="MH18BMartin" ? MH18BMartin() :
name=="MH23Martin" ? MH23Martin() :
name=="MH24Martin" ? MH24Martin() :
name=="MH25Martin" ? MH25Martin() :
name=="MH26" ? MH26() :
name=="MH27Martin" ? MH27Martin() :
name=="MH28" ? MH28() :
name=="MH31" ? MH31() :
name=="MH33" ? MH33() :
name=="MH34" ? MH34() :
name=="MH44" ? MH44() :
name=="MH46" ? MH46() :
name=="MH49" ? MH49() :
name=="MH50" ? MH50() :
name=="MH51" ? MH51() :
name=="MH52" ? MH52() :
name=="MH53" ? MH53() :
name=="MH54" ? MH54() :
name=="MH64" ? MH64() :
name=="MH78" ? MH78() :
name=="MH91" ? MH91() :
name=="MH92" ? MH92() :
name=="MH93" ? MH93() :
name=="MID10" ? MID10() :
name=="MID011_3" ? MID011_3() :
name=="MID011_4" ? MID011_4() :
name=="MID011_0" ? MID011_0() :
name=="MID12_1" ? MID12_1() :
name=="MID12" ? MID12() :
name=="MID13" ? MID13() :
name=="MID15" ? MID15() :
name=="MID20" ? MID20() :
name=="MID21" ? MID21() :
name=="MID22" ? MID22() :
name=="MID27" ? MID27() :
name=="MID29" ? MID29() :
name=="MID101" ? MID101() :
name=="MID101" ? MID101() :
name=="MID103b" ? MID103b() :
name=="MID103" ? MID103() :
name=="MID103" ? MID103() :
name=="MID104" ? MID104() :
name=="MID105" ? MID105() :
name=="MID106" ? MID106() :
name=="MID107" ? MID107() :
name=="MID108a" ? MID108a() :
name=="MID108b" ? MID108b() :
name=="MID110" ? MID110() :
name=="MID111" ? MID111() :
name=="MID112" ? MID112() :
name=="MID113" ? MID113() :
name=="MID114" ? MID114() :
name=="MID115_7" ? MID115_7() :
name=="MID115" ? MID115() :
name=="MID116" ? MID116() :
name=="MID117" ? MID117() :
name=="MID118" ? MID118() :
name=="MID120" ? MID120() :
name=="MID122" ? MID122() :
name=="MID151a" ? MID151a() :
name=="MID151b" ? MID151b() :
name=="MID151" ? MID151() :
name=="MID153a" ? MID153a() :
name=="MID153b" ? MID153b() :
name=="MID153" ? MID153() :
name=="MID173" ? MID173() :
name=="MID304" ? MID304() :
name=="Mid309" ? Mid309() :
name=="MID311" ? MID311() :
name=="MID_31F3J" ? MID_31F3J() :
name=="MID321a" ? MID321a() :
name=="MID321b" ? MID321b() :
name=="mid321" ? mid321() :
name=="mid321d" ? mid321d() :
name=="MID321e" ? MID321e() :
name=="MID322" ? MID322() :
name=="MID327" ? MID327() :
name=="MID327" ? MID327() :
name=="MID327_18" ? MID327_18() :
name=="MID327" ? MID327() :
name=="MID_32F3J" ? MID_32F3J() :
name=="MID_33F3J" ? MID_33F3J() :
name=="MID343" ? MID343() :
name=="MID_34F3J" ? MID_34F3J() :
name=="MID_36F5Js" ? MID_36F5Js() :
name=="MID371AW" ? MID371AW() :
name=="MID371" ? MID371() :
name=="MID_37F5Js" ? MID_37F5Js() :
name=="MID_38F5Js" ? MID_38F5Js() :
name=="MID393" ? MID393() :
name=="MID393" ? MID393() :
name=="MID_39F5Js" ? MID_39F5Js() :
name=="MID403" ? MID403() :
name=="MID405e" ? MID405e() :
name=="MID405w2" ? MID405w2() :
name=="MID406w2" ? MID406w2() :
name=="MID415" ? MID415() :
name=="MID455" ? MID455() :
name=="MIDH2A" ? MIDH2A() :
name=="MIDH2B" ? MIDH2B() :
name=="MIDH2D" ? MIDH2D() :
name=="mjp711f_3Flying" ? mjp711f_3Flying() :
name=="mjp712" ? mjp712() :
name=="mjz1211" ? mjz1211() :
name=="ms1_9_8_7f3i" ? ms1_9_8_7f3i() :
name=="MS25_11GPVFlapped" ? MS25_11GPVFlapped() :
name=="MS25_13GPVFlapped" ? MS25_13GPVFlapped() :
name=="MS25_15GPVFlapped" ? MS25_15GPVFlapped() :
name=="ms2_95f3i" ? ms2_95f3i() :
name=="MS3_11GPVFlapped" ? MS3_11GPVFlapped() :
name=="MS3_11Retrom_scherrer" ? MS3_11Retrom_scherrer() :
name=="MS3_13GPVFlapped" ? MS3_13GPVFlapped() :
name=="MS3_13Retrom_scherrer" ? MS3_13Retrom_scherrer() :
name=="MS3_14Retrom_scherrer" ? MS3_14Retrom_scherrer() :
name=="MS3_15GPVFlapped" ? MS3_15GPVFlapped() :
name=="MS3_15Retrom_scherrer" ? MS3_15Retrom_scherrer() :
name=="MS3_3_11G" ? MS3_3_11G() :
name=="MS3_3_11GPT" ? MS3_3_11GPT() :
name=="MS3_3_13GPmiddle" ? MS3_3_13GPmiddle() :
name=="MS3_3_15GProot" ? MS3_3_15GProot() :
name=="MS535_1profil" ? MS535_1profil() :
name=="MS535_2profil" ? MS535_2profil() :
name=="MS535_3Vprofil" ? MS535_3Vprofil() :
name=="msa812F5B" ? msa812F5B() :
name=="mve8516F3B" ? mve8516F3B() :
name=="mve8516f" ? mve8516f() :
name=="VANE15" ? VANE15() :
name=="NACA64_212" ? NACA64_212() :
name=="NACA23009" ? NACA23009() :
name=="NACA23015" ? NACA23015() :
name=="NACA63A612" ? NACA63A612() :
name=="NACA64A410" ? NACA64A410() :
name=="NACA_K6EEmplanture" ? NACA_K6EEmplanture() :
name=="NACA_K6Mmediane" ? NACA_K6Mmediane() :
name=="NACA_K6SSaumon" ? NACA_K6SSaumon() :
name=="Prisedair" ? Prisedair() :
name=="NN18_17" ? NN18_17() :
name=="Pegasecoap" ? Pegasecoap() :
name=="avionsRC" ? avionsRC() :
name=="PW106" ? PW106() :
name=="PW1211" ? PW1211() :
name=="PW51plank" ? PW51plank() :
name=="PW75" ? PW75() :
name=="RITZ1_30_10" ? RITZ1_30_10() :
name=="Ritz1_30_12" ? Ritz1_30_12() :
name=="Ritz2_30_10" ? Ritz2_30_10() :
name=="Ritz2_30_12" ? Ritz2_30_12() :
name=="Ritz3_30_10" ? Ritz3_30_10() :
name=="AIR100_2" ? AIR100_2() :
name=="RhodeSt" ? RhodeSt() :
name=="RhodeSt" ? RhodeSt() :
name=="Ritz3_30_12" ? Ritz3_30_12() :
name=="Ritz3_30_15" ? Ritz3_30_15() :
name=="AirfoilRK40" ? AirfoilRK40() :
name=="Rs001m60Reinhard" ? Rs001m60Reinhard() :
name=="Rs001m75Reinhard" ? Rs001m75Reinhard() :
name=="Rs001tReinhard" ? Rs001tReinhard() :
name=="Rs004atReinhard" ? Rs004atReinhard() :
name=="RC_MilanUrs" ? RC_MilanUrs() :
name=="MU85_173" ? MU85_173() :
name=="SB95105_2" ? SB95105_2() :
name=="SB95115_2" ? SB95115_2() :
name=="SB9595_2" ? SB9595_2() :
name=="SB96105_30" ? SB96105_30() :
name=="SB96116_30" ? SB96116_30() :
name=="SB96" ? SB96() :
name=="SB96DTRAINER" ? SB96DTRAINER() :
name=="SB96LM" ? SB96LM() :
name=="SB96MU" ? SB96MU() :
name=="SB96V_935_125" ? SB96V_935_125() :
name=="SB96VS_975_125" ? SB96VS_975_125() :
name=="SB97" ? SB97() :
name=="SB97EP_92_19" ? SB97EP_92_19() :
name=="SB97EPW_8_2" ? SB97EPW_8_2() :
name=="SB97FW" ? SB97FW() :
name=="SB98F3J_8_35" ? SB98F3J_8_35() :
name=="SB98" ? SB98() :
name=="SB98" ? SB98() :
name=="SB98" ? SB98() :
name=="ASW22733m" ? ASW22733m() :
name=="ASW_733mde" ? ASW_733mde() :
name=="SB99blkmMilieu" ? SB99blkmMilieu() :
name=="SB99blkrEmplanture" ? SB99blkrEmplanture() :
name=="SB99blksSaumon" ? SB99blksSaumon() :
name=="SB99" ? SB99() :
name=="SBC3profil" ? SBC3profil() :
name=="SibniaS_16" ? SibniaS_16() :
name=="SM8016m" ? SM8016m() :
name=="SM8516m" ? SM8516m() :
name=="STROM98Wurzelprofil" ? STROM98Wurzelprofil() :
name=="SU_26Ml" ? SU_26Ml() :
name=="EdgeRoot" ? EdgeRoot() :
name=="EdgeTip" ? EdgeTip() :
name=="NACA09210" ? NACA09210() :
name=="TP100plank" ? TP100plank() :
name=="TP202_10Th" ? TP202_10Th() :
name=="TP202_9Th" ? TP202_9Th() :
name=="TP204polyvalent" ? TP204polyvalent() :
name=="TP210_10Th" ? TP210_10Th() :
name=="TP210_11Th" ? TP210_11Th() :
name=="TP28_0opt_26" ? TP28_0opt_26() :
name=="TP28_4Voltige" ? TP28_4Voltige() :
name=="TP28_60Voltige" ? TP28_60Voltige() :
name=="TP28_LVoltige" ? TP28_LVoltige() :
name=="TP28_milieuTh" ? TP28_milieuTh() :
name=="TP28_saumonSYMETRIX" ? TP28_saumonSYMETRIX() :
name=="TP29_5Profil" ? TP29_5Profil() :
name=="TP29_6Profil" ? TP29_6Profil() :
name=="TP29_7Profil" ? TP29_7Profil() :
name=="TP29_1_85MU28" ? TP29_1_85MU28() :
name=="TP29_8Profil" ? TP29_8Profil() :
name=="TP29_9Saumon" ? TP29_9Saumon() :
name=="TP36_95MU28" ? TP36_95MU28() :
name=="TP36_95_TP29_85MU28" ? TP36_95_TP29_85MU28() :
name=="TP42Emplanture" ? TP42Emplanture() :
name=="TP50_DSperfo" ? TP50_DSperfo() :
name=="TP60J" ? TP60J() :
name=="TP66Emplanture" ? TP66Emplanture() :
name=="TP66_SSaumon" ? TP66_SSaumon() :
name=="TP73_60inch" ? TP73_60inch() :
name=="TP96_05ThPlaton" ? TP96_05ThPlaton() :
name=="TP96_075Th" ? TP96_075Th() :
name=="TP96_125Th" ? TP96_125Th() :
name=="TP96_1Th" ? TP96_1Th() :
name=="TP_CIEL_SVoltige" ? TP_CIEL_SVoltige() :
name=="EmplantureTPr_95_96_95" ? EmplantureTPr_95_96_95() :
name=="Profilevolution" ? Profilevolution() :
name=="tt54profil" ? tt54profil() :
name=="UplinkDLG" ? UplinkDLG() :
name=="ZAGI8" ? ZAGI8() :
name=="ZAGI10" ? ZAGI10() :
name=="ZAGI12" ? ZAGI12() :
name=="Zone_21for" ? Zone_21for() :
name=="Zone_25for" ? Zone_25for() :
name=="Zone_36for" ? Zone_36for() :
name=="Zone_40for" ? Zone_40for() :
name=="Zone_46for" ? Zone_46for() :
name=="s3021" ? s3021() :
name=="s3016" ? s3016() : "Not Finde";

airfoilNames=["Abrial17", "AS5045", "AS5046", "AS5048", "AV_17_8cmo0012", "avx_planeur_perso_60Le", "avx_nitro__pour_60F3F", "AZ2003az_emp", "AZ2003az_ext_", "AZ2003az_moy", "AZ2004AZ_9_", "AZ_2005_Emplanture", "AZ_2005", "AZ_2005_moy", "az2007_8_14_emplanture", "az2007_8_12_extremite", "az2007_8_13_milieu", "profilAile1", "profilAile2", "profilAile3", "AZcombat1", "salazEmplanture", "salaz_moyExtremite", "salazV3_empAZ", "salazV3_extAZ", "BE5030FVNC2datF1G", "BE5045FVNC2datF1G", "BE5655FVNC2datF1G", "BE656865", "BE6699", "Borge_b3", "cap21", "CB2012chbaron", "CB2195_25d", "CB2195chbaron", "CB2513chbaron", "CB2514chbaron", "CB2515chbaron", "CB3013chbaron", "CB3512chbaron", "CJ3209", "cristalcb85_15_7", "DP168_837_DS", "DP172_816_DS", "DP172_832_DS", "DP177_823_DS", "DP179_837_DS", "DP182_821_DS", "DP187_907_DS", "DP189_783", "DP200_855_DS", "DP205_865_DS", "DP206_867_DS", "DP247_948_DS", "DS19coords", "DS21", "DU86_137_25According", "Profil", "EpplerEB380", "EH10_70", "Eiffel13", "Eiffel33", "Eiffel33", "Eiffel371", "Eiffel385", "Eiffel400", "Eiffel428", "Eiffel430", "FAD05_CNCFranckAguerre", "FAD05Flat_bottom", "FAD06_FranckAguerre_Pour_60et", "FAD07H2", "FAD13FranckAguerre", "FAD14FranckAguerre", "FAD15H2", "FAD16La", "FAD17special", "FAD18_FranckAguerre_Performances_pour_60etF3F", "FAD21FranckAguerre", "FAD23FranckAguerre", "FAD24FranckAguerre", "FAD04105", "EMX_07designed", "Profilspecial", "HL73_650BHoreni", "HL743512BHoreni", "HL74_351BHoreni", "HL74_550BHoreni", "HL75_541BHoreni", "HL75_K_3BHoreni", "HL80_133BHoreni", "HM1001NF_Leistungsprofil", "HM10011NF_Leistungsprofil", "HM391_2Ein", "MH391_1Ein", "HM50dieser", "HM50Tdieser", "HM51Hammarskiold_Mattias", "HM55NF_Leistungsprofil", "HM56NF_Leistungsprofil", "HN_003Planeur35m", "HN_032F3F", "HN_033F3B", "HN_034F3B", "HN_035F3B", "HN_036F3F", "HN_038F3F", "HN_1004HLG", "HN1015", "HN_1023Planeur35m", "HN_1027HLG", "HN_1029HLG", "HN1032", "HN_1033AHLG", "HN_1033HLG", "HN_1036Planeur", "HN_1038F3F", "HN_1051Planeur", "HN_1054Planeur", "HN_1069aPlaneur35m", "HN_1069bPlaneur35m", "HN_1069cPlaneur35m", "HN1069", "HN_1070HLG", "HN_1091aPlaneur35m", "HN_1091bPlaneur35m", "HN_1091Planeur35m", "HN_153SAile", "HN_163F3B", "HN_163TAF3B", "HN_163TBF3B", "HN_184F3B", "HN_184MPlaneur", "HN_188Planeur35m", "HN_203Planeur35m", "HN_211F3F_F3B", "HN_216F3B", "HN_216TAF3B", "HN_217F3J", "HN_227F3J", "HN_239F3J", "HN_274SAile", "HN_275SAile", "HN_276SAAile", "HN_304Planeur35m", "HN_304TAPlaneur35m", "HN_309Planeur35m", "HN_30sAile", "HN_311SAile", "HN_312SAile", "HN_315SAile", "HN_316SAile", "HN_319Planeur35m", "HN_321F3F", "HN_326F3F", "HN327F3B", "HN_333F3J", "HN_33S", "HN_350F3B", "HN_350M01F3J", "HN_350M02F3J", "HN_352F3F", "HN_354ABASIC", "HN_354F3B", "HN_354EF3B", "HN_354ESF3F", "HN_354OCF3J", "HN_354SMF3J", "HN_354SRF3F", "HN_360F3J", "HN_374F3B_F3F", "HN380", "HN_409Planeur35m", "HN_411Planeur35m", "HN_417F3J", "HN_418Planeur", "HN_419HLG", "HN_424Planeur", "HN_436F3F", "HN_446F3F", "HN450Planeur", "HN_450SPlaneur", "HN_452F3B_F3F", "HN_456F3F", "HN_462F3F", "HN_464Planeur", "HN_465F3J", "HN_470F3F", "HN_470jtF3J_F3B", "HN_470sAile", "HN_474Planeur35m", "HN_475Planeur35m", "HN_477S", "HN_478S", "HN_480", "HN_483", "HN_484", "HN_507F3J", "HN_707", "HN_785F3B", "HN_785SRF3F", "HN_801BASIC", "HN_802", "HN803", "HN_805F3F", "HN_808Planeur35m", "HN_832Planeur35m", "HN_832TAPlaneur35m", "HN838", "HN839D", "HN840S", "HN_951Planeur35m", "HN955", "HN_956Planeur35m", "HN959", "HN_961SAAile", "HN968S", "HN969", "HN_971Planeur35m", "HN_972Planeur35m", "HN_973F3J", "HN_974Planeur35m", "HN_975Planeur35m", "HN_975TAPlaneur35m", "HN_976SAile", "HN978", "HN_979HLG", "HN979DHLG", "HN_980Planeur35m", "HN_981F3B", "HN984", "HN_989F3B", "HN_990F3B", "HN_997AHLG", "HN_997BHLG", "HN_998HLG", "HN_999HLG", "HortenStandard", "HS17_9", "HS20_80", "HS30_8", "HS30_90", "HS3412b", "HS35_12", "HS510", "HS520", "HS522", "HS602", "HortenII", "Phoenix", "n1000119", "S5020", "Sipkill17_10", "ISA571", "ISA960", "ISA961", "ISA962", "JedeslskyEJ1", "JEDELSKYEJ", "jwl0299_0", "jwl03075_09", "jwl0318_07", "jwl04111_35", "jwl04286_25", "jwl04388_21", "jwl04410_25", "jwl04592_27", "jwl04692_26", "jwl06579_17", "jwl06687_19", "jwl067115_17", "jwl06895_17", "jwl06911_0", "jwl07485_12", "jwl07588_176", "jwl07610_3", "jwl07710_2", "jwl0788_1", "jwl0799_7_2_7", "jwl08081_17", "jwl08111_13", "jwl82", "jwl0977_7_1_6", "jwl1069_0", "HG40", "HG41", "HG42", "HG43", "M7372", "M77", "mb7136F5B", "mb714F5B", "mc813F5B", "md8135F5B", "md814F5B", "MG05Marcel", "MG06Marcel", "MG8", "MH102", "MH104", "MH106", "MH108", "MH110", "MH112", "MH113", "MH114", "MH115", "MH116", "MH117", "MH120", "MH121", "MH126", "MH16", "MH17", "MH18BMartin", "MH23Martin", "MH24Martin", "MH25Martin", "MH26", "MH27Martin", "MH28", "MH31", "MH33", "MH34", "MH44", "MH46", "MH49", "MH50", "MH51", "MH52", "MH53", "MH54", "MH64", "MH78", "MH91", "MH92", "MH93", "MID10", "MID011_3", "MID011_4", "MID011_0", "MID12_1", "MID12", "MID13", "MID15", "MID20", "MID21", "MID22", "MID27", "MID29", "MID101", "MID101", "MID103b", "MID103", "MID103", "MID104", "MID105", "MID106", "MID107", "MID108a", "MID108b", "MID110", "MID111", "MID112", "MID113", "MID114", "MID115_7", "MID115", "MID116", "MID117", "MID118", "MID120", "MID122", "MID151a", "MID151b", "MID151", "MID153a", "MID153b", "MID153", "MID173", "MID304", "Mid309", "MID311", "MID_31F3J", "MID321a", "MID321b", "mid321", "mid321d", "MID321e", "MID322", "MID327", "MID327", "MID327_18", "MID327", "MID_32F3J", "MID_33F3J", "MID343", "MID_34F3J", "MID_36F5Js", "MID371AW", "MID371", "MID_37F5Js", "MID_38F5Js", "MID393", "MID393", "MID_39F5Js", "MID403", "MID405e", "MID405w2", "MID406w2", "MID415", "MID455", "MIDH2A", "MIDH2B", "MIDH2D", "mjp711f_3Flying", "mjp712", "mjz1211", "ms1_9_8_7f3i", "MS25_11GPVFlapped", "MS25_13GPVFlapped", "MS25_15GPVFlapped", "ms2_95f3i", "MS3_11GPVFlapped", "MS3_11Retrom_scherrer", "MS3_13GPVFlapped", "MS3_13Retrom_scherrer", "MS3_14Retrom_scherrer", "MS3_15GPVFlapped", "MS3_15Retrom_scherrer", "MS3_3_11G", "MS3_3_11GPT", "MS3_3_13GPmiddle", "MS3_3_15GProot", "MS535_1profil", "MS535_2profil", "MS535_3Vprofil", "msa812F5B", "mve8516F3B", "mve8516f", "VANE15", "NACA64_212", "NACA23015", "NACA63A612", "NACA64A410", "NACA_K6EEmplanture", "NACA_K6Mmediane", "NACA_K6SSaumon", "Prisedair", "NN18_17", "Pegasecoap", "avionsRC", "PW106", "PW1211", "PW51plank", "PW75", "RITZ1_30_10", "Ritz1_30_12", "Ritz2_30_10", "Ritz2_30_12", "Ritz3_30_10", "AIR100_2", "RhodeSt", "RhodeSt", "Ritz3_30_12", "Ritz3_30_15", "AirfoilRK40", "Rs001m60Reinhard", "Rs001m75Reinhard", "Rs001tReinhard", "Rs004atReinhard", "RC_MilanUrs", "MU85_173", "SB95105_2", "SB95115_2", "SB9595_2", "SB96105_30", "SB96116_30", "SB96", "SB96DTRAINER", "SB96LM", "SB96MU", "SB96V_935_125", "SB96VS_975_125", "SB97", "SB97EP_92_19", "SB97EPW_8_2", "SB97FW", "SB98F3J_8_35", "SB98", "SB98", "SB98", "ASW22733m", "ASW_733mde", "SB99blkmMilieu", "SB99blkrEmplanture", "SB99blksSaumon", "SB99", "SBC3profil", "SibniaS_16", "SM8016m", "SM8516m", "STROM98Wurzelprofil", "SU_26Ml", "EdgeRoot", "EdgeTip", "NACA09210", "TP100plank", "TP202_10Th", "TP202_9Th", "TP204polyvalent", "TP210_10Th", "TP210_11Th", "TP28_0opt_26", "TP28_4Voltige", "TP28_60Voltige", "TP28_LVoltige", "TP28_milieuTh", "TP28_saumonSYMETRIX", "TP29_5Profil", "TP29_6Profil", "TP29_7Profil", "TP29_1_85MU28", "TP29_8Profil", "TP29_9Saumon", "TP36_95MU28", "TP36_95_TP29_85MU28", "TP42Emplanture", "TP50_DSperfo", "TP60J", "TP66Emplanture", "TP66_SSaumon", "TP73_60inch", "TP96_05ThPlaton", "TP96_075Th", "TP96_125Th", "TP96_1Th", "TP_CIEL_SVoltige", "EmplantureTPr_95_96_95", "Profilevolution", "tt54profil", "UplinkDLG", "ZAGI8", "ZAGI10", "ZAGI12", "Zone_21for", "Zone_25for", "Zone_36for", "Zone_40for", "Zone_46for", "s3021", "s3016"];