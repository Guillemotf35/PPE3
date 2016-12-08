<?php
/** 
 * Classe d'accès aux données. 
 * Utilise les services de la classe PDO
 * pour l'application JardiPlants
 * Les attributs sont tous statiques,
 * les 4 premiers pour la connexion
 * $monPdo de type PDO 
 * $monPdoGsb qui contiendra l'unique instance de la classe
 *
*/

class pdoGestionEntr
{   		
      	private static $serveur='mysql:host=localhost';
      	private static $bdd='dbname=gestionentraineur';   		
      	private static $user='root' ;    		
      	private static $mdp='' ;	
		private static $monPdo;
		private static $monpdoGestionEntr = null;
/**
 * Constructeur privé, crée l'instance de PDO qui sera sollicitée
 * pour toutes les méthodes de la classe
 */				
	private function __construct()
	{
    		pdoGestionEntr::$monPdo = new PDO(pdoGestionEntr::$serveur.';'.pdoGestionEntr::$bdd, pdoGestionEntr::$user, pdoGestionEntr::$mdp); 
			pdoGestionEntr::$monPdo->query("SET CHARACTER SET utf8");
	}
	public function _destruct(){
		pdoGestionEntr::$monPdo = null;
	}
/**
 * Fonction statique qui crée l'unique instance de la classe
 *
 * Appel : $instancepdoGestionEntr = pdoGestionEntr::getpdoGestionEntr();
 * @return l'unique objet de la classe pdoGestionEntr
 */
	public  static function getpdoGestionEntr()
	{
		if(pdoGestionEntr::$monpdoGestionEntr == null)
		{
			pdoGestionEntr::$monpdoGestionEntr= new pdoGestionEntr();
		}
		return pdoGestionEntr::$monpdoGestionEntr;  
	}

	public function getLesStages()
	{
		$req = ('SELECT * FROM stage, formateur, niveau WHERE formateur.idFormateur=stage.idFormateur AND niveau.idNiveau=stage.idNiveau');
		$res = pdoGestionEntr::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}

		public function getLesAdmins($login, $mdp)
	{
		$req = "select * from admin WHERE login='$login' AND mdp='$mdp'";
		$res = pdoGestionEntr::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}

	public function getLesFormateurs()
	{
		$req = "select * from formateur ";
		$res = pdoGestionEntr::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}


		public function getLesReservations()
	{
		$req = "select * from reservation,salle,client WHERE salle.idSalle=reservation.idSalle AND client.idClient=reservation.idClient ORDER BY idReservation";
		$res = pdoGestionEntr::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}

		public function getLaReservation($idReservation)
	{
		$req = "select * from reservation WHERE idReservation='$idReservation'";
		$res = pdoGestionEntr::$monPdo->query($req);
		$lesLignes = $res->fetch();
		return $lesLignes;
	}

		public function getLesClients()
	{
		$req = "select * from client";
		$res = pdoGestionEntr::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}

		public function getLeClient($idClient)
	{
		$req = "select * from client WHERE idSalle=$idClient";
		$res = pdoGestionEntr::$monPdo->query($req);
		$lesLignes = $res->fetch();
		return $lesLignes;
	}

		public function getLaSalleNom($nom)
	{
	    $req="select distinct * from salle where nomSalle LIKE '%$nom%'";
		$res = pdoGestionEntr::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes; 
	}

	public function getLaSalleDate($date)
	{
	    $req="select distinct * from salle, reservation where date='$date' AND reservation.idSalle=salle.idSalle";
		$res = pdoGestionEntr::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes; 
	}

//		public function getLesSallesDispo()
//	{
//		$req = "SELECT * FROM salle WHERE idSalle <> (SELECT idSalle FROM reservation WHERE validation=1)";
//		$res = pdoGestionEntr::$monPdo->query($req);
//		$lesLignes = $res->fetchAll();
//		return $lesLignes;
//	}

	public function creerStage($tarif,$nbPlace,$lieu,$dateDeb,$dateFin,$niveau,$formateur)
	{
		$req = "INSERT INTO stage(idStage,tarif,nbPlace,lieu,dateDeb,dateFin,idNiveau,idFormateur) VALUES('','$tarif','$nbPlace','$lieu','$dateDeb','$dateFin','$niveau','$formateur')";
		$res = pdoGestionEntr::$monPdo->exec($req);
	}

	public function confirmerReservation($num)
	{
		$req = "UPDATE reservation SET validation = 1 where idReservation = $num";
		$res = pdoGestionEntr::$monPdo->exec($req);
	}

	public function supprimerReservation($num)
	{
		$req = "DELETE FROM reservation WHERE idReservation = $num ";
		$res = pdoGestionEntr::$monPdo->exec($req);
	}

	public function ajouterConnexion($login,$mdp)
	{
		$requete ="SELECT count('idConnexion') FROM entraineur";
		$res1 = pdoGestionEntr::$monPdo->exec($requete);
		$res1 += 1;
		$req = "INSERT INTO connexion(idConnexion,login,mdp,idEntraineur) VALUES('','$login','$mdp','$res1')";
		$res = pdoGestionEntr::$monPdo->exec($req);
	}

	public function ajouterEntraineur($nom,$prenom,$adresse,$codepostal,$ville,$telFixe,$telPort,$club,$licence,$mail)
	{
		$req = "INSERT INTO entraineur(idEntr,nom,prenom,adresse,codepostal,ville,telFixe,telPort,club,numLicence,mail) 
		VALUES('','$nom','$prenom','$adresse',$codepostal,'$ville',$telFixe,$telPort,'$club','$licence','$mail')";
		echo $req;
		$res = pdoGestionEntr::$monPdo->exec($req);
	}
}

?>