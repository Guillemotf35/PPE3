<?php
    $action=$_REQUEST['action'];
    switch($action)
    {
        case 'connexion':
        { 
           include("vues/v_connexion.php");
           break;
        }
        
        case 'verifconn':
        { 
            $login=$_REQUEST['login'];
            $mdp=$_REQUEST['mdp'];
            $LesAdmins = $pdo->getLesAdmins($login,$mdp);

            if(!isset($LesAdmins['login'],$LesAdmins['mdp'])){
             include("vues/v_accueilAdmin.php");
             }
             else{
              echo "Login ou mot de passe incorret."; 
              ?>
              <a href="index.php?uc=connexion&action=connexion"> Veuillez réessayer !</a> 
              <?php
            
             }
          
            break;
         }

        case 'inscription':
        {
           include("vues/v_inscription.php");
           break;
        }

        case 'ajoutEntraineur':
        {
          $login=$_REQUEST['login'];
          $mdp=$_REQUEST['mdp'];
          $nom=$_REQUEST['nom'];
          $prenom=$_REQUEST['prenom'];
          $club=$_REQUEST['club'];
          $licence=$_REQUEST['licence'];
          $ville=$_REQUEST['ville'];
          $cp=$_REQUEST['codepostal'];
          $fixe=$_REQUEST['fixe'];
          $port=$_REQUEST['port'];
          $mail=$_REQUEST['mail'];
          $pdo->ajouterEntraineur($nom,$prenom,$adresse,$cp,$ville,$fixe,$port,$club,$licence,$mail);
          $pdo->ajouterConnexion($login,$mdp);
          break;
        }
    }
 ?>