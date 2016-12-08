<?php
session_start();
//require_once("util/fonctions.inc.php");
require_once("modele/class.PdoGestionEntraineur.inc.php");
/*include("vues/v_entete.php") ;
include("vues/v_bandeau.php") ;*/

if(!isset($_REQUEST['uc']))
     $uc = 'accueil';
else
	$uc = $_REQUEST['uc'];

$pdo = PdoGestionEntraineur::getPdoGestionEntraineur();	 
switch($uc)
{
	case 'accueil':
		{include("vues/v_creationStage.php");break;}
	/*case 'voirProduits' :
		{include("controleurs/c_voirProduits.php");break;}*/
	case 'gererStage' :
		{ include("controleurs/c_gestionStage.php");break; }
}
//include("vues/v_pied.php") ;
?>

