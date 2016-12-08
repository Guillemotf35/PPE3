<?php
    $action=$_REQUEST['action'];
    switch($action)
    {
        case 'voirLesStages':
        { 
           $LesStages = $pdo->getLesStages();
           include("vues/v_voirStage.php");
           break;
        }


        case 'validerGerer':
        { 
           $num=$_REQUEST['num'];
           $pdo->confirmerReservation($num);
           include("vues/v_confirmerRes.php");
            break;
         }

        case 'supprimerGerer':
        {
            $num = $_REQUEST['num'];
            $pdo->supprimerReservation($num);
            include("vues/v_annulerRes.php");
            break;
        }
    }
 ?>