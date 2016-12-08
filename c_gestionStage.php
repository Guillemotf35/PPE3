<?php
$action = $_REQUEST['action'];
switch($action)
{

	case 'confirmCreatStage':
		{
			$num = $_REQUEST['Tnum'];
			$nom = $_REQUEST['Tnom'];
			$prenom = $_REQUEST['Tprenom'];
			$adresse = $_REQUEST['Tadresse'];
			$codepostal = $_REQUEST['Tcodepostal'];
			$ville = $_REQUEST['Tville'];
			$pdo->creerStage($num,$nom,$prenom,$adresse,$codepostal,$ville);
			header('Location: index.php');		
			break;
		}

	case 'voirFormations':
	{
  		$lesFormations = $pdo->getLesFormations();
		include("vues/v_creationStage.php");
  		break;
	}	

	case 'voirFormateurs':
	{
  		$lesFormations = $pdo->getLesFormateurs();
		include("vues/v_creationStage.php");
  		break;
	}	

	/*case 'voirPanier':
	{
		$n= nbProduitsDuPanier();
		if($n >0)
		{
			$desIdProduit = getLesIdProduitsDuPanier();
			$lesProduitsDuPanier = $pdo->getLesProduitsDuTableau($desIdProduit);
			include("vues/v_panier.php");
		}
		else
		{
			$message = "panier vide !!";
			include ("vues/v_message.php");
		}
		break;
	}
	case 'supprimerUnProduit':
	{
		$n= nbProduitsDuPanier();
		if($n >0)
		{
			$idProduit=$_REQUEST['produit'];
			$SuppProduit= retirerDuPanier($idProduit);
			header('location:index.php?uc=gererPanier&action=voirPanier');
		}

		break;
	}
	case 'passerCommande' :
	    $n= nbProduitsDuPanier();
		if($n>0)
		{
			$nom ='';$rue='';$ville ='';$cp='';$mail='';
			include ("vues/v_commande.php");
		}
		else
		{
			$message = "panier vide !!";
			include ("vues/v_message.php");
		}
		break;
	case 'confirmerCommande'	:
	{
		$n= nbProduitsDuPanier();
		if($n >0)
		{
			$desIdProduit = getLesIdProduitsDuPanier();

			$nom =$_REQUEST['nom'];
			$rue =$_REQUEST['rue'];
			$ville =$_REQUEST['ville'];
			$cp =$_REQUEST['cp'];
			$mail =$_REQUEST['mail'];

			$erreurs = getErreursSaisieCommande($nom, $rue, $ville, $cp, $mail);

			if(empty($erreurs)){
				$pdo -> creerCommande($nom, $rue, $ville, $cp, $mail, $desIdProduit);
				$message = "Votre commande nous est parvennu, vous recevrez votre commande dans les plus bref délais ! la biz";
				include('vues/v_message.php');
				supprimerPanier();
			}
			else 
			{
				$message = "La Saisie de votre commande est incorrect. Veuillez S'il vous plait remplir correctement votre commande";
				include('vues/v_message.php');
			}
		}
		break;

	}*/
}


?>


