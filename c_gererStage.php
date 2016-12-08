<?php
    $action=$_REQUEST['action'];
    switch($action)
    {
        case 'creerStage':
        { 
          $LesFormateurs = $pdo->getLesFormateurs();
           include("vues/v_creerStage.php");
           break;
        }
        
        case 'accueilAdmin':
        { 
           include("vues/v_accueilAdmin.php");
            break;
        }

        case 'confirmCreation':
        {
            $tarif = $_REQUEST['tarif'];
            $nbPlace = $_REQUEST['nbPlace'];
            $dateDeb = $_REQUEST['dateDeb'];
            $dateFin = $_REQUEST['dateFin'];
            $niveau = $_REQUEST['niveau'];
            $formateur = $_REQUEST['formateur'];
            $lieu = $_REQUEST['lieu'];
            $pdo -> creerStage($tarif,$nbPlace,$lieu,$dateDeb,$dateFin,$niveau,$formateur );
            echo $tarif, $nbPlace , $dateDeb ,  $dateFin, $niveau, $formateur, $lieu;
        }

        case 'supprStage':
        { 
           include("vues/v_supprStage.php");
            break;
        }
        
        case 'confirmSuppr':
        { 
           include("vues/v_accueilAdmin.php");
            break;
        }
    }
 ?>