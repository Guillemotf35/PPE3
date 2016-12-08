<?php
/** 
 * Classe d'accès aux données. 
 
 * Utilise les services de la classe PDO
 * pour l'application resa_loire
 * Les attributs sont tous statiques,
 * les 4 premiers pour la connexion
 * $monPdo de type PDO 
 * $monPdoGestionEntraineur qui contiendra l'unique instance de la classe
 *
 */

class PdoGestionEntraineur
{   		
      	private static $serveur='mysql:host=localhost';
      	private static $bdd='dbname=gestionentraineur';   		
      	private static $user='root' ;    		
      	private static $mdp='' ;	
		private static $monPdo;
		private static $monPdoGestionEntraineur = null;
/**
 * Constructeur privé, crée l'instance de PDO qui sera sollicitée
 * pour toutes les méthodes de la classe
 */				
	private function __construct()
	{
    		PdoGestionEntraineur::$monPdo = new PDO(PdoGestionEntraineur::$serveur.';'.PdoGestionEntraineur::$bdd, PdoGestionEntraineur::$user, PdoGestionEntraineur::$mdp); 
			PdoGestionEntraineur::$monPdo->query("SET CHARACTER SET utf8");
	}
	public function _destruct(){
		PdoGestionEntraineur::$monPdo = null;
	}
/**
 * Fonction statique qui crée l'unique instance de la classe
 *
 
 * Appel : $instancePdoresa_loire = PdoGestionEntraineur::getPdoresa_loire();
 * @return l'unique objet de la classe PdoGestionEntraineur
 */
	public  static function getPdoGestionEntraineur()
	{
		if(PdoGestionEntraineur::$monPdoGestionEntraineur == null)
		{
			PdoGestionEntraineur::$monPdoGestionEntraineur= new PdoGestionEntraineur();
		}
		return PdoGestionEntraineur::$monPdoGestionEntraineur;  
	}

	public function getLesFormations()
	{
		$req = "SELECT * from formation";
		$res = PdoGestionEntraineur::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}

	public function getLesFormateurs()
	{
		$req = "SELECT * from formateur";
		$res = PdoGestionEntraineur::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}



}
?>