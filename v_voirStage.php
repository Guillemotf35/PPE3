<!DOCTYPE html>
<html>
<body>
   <p><h1>Les stages :</h1></p><BR/>

   <a href="index.php">Accueil</a></br></br>

        <table border=3 cellspacing=1 >
            <tr>
            <td>Num : </td>
            <td>Nom : </td>
            <td>Nombres de places : </td>
            <td>Lieu : </td>
            <td>Date Début : </td>
            <td>Date Fin : </td>
            <td>Niveau : </td>
            <td>Formateur : </td>
            <td> S'incrire </td>
            </tr> 
            
        <?php
		
        foreach($LesStages as $LeStage)
        {
            $num = $LeStage['idStage'];
 			$tarif = $LeStage['tarif'];
            $nbPlaces = $LeStage['nbPlace'];
 			$lieu = $LeStage['lieu'];
 			$dateDeb = $LeStage['dateDeb'];
            $dateFin = $LeStage['dateFin'];
            $niveau = $LeStage['libelle'];
            $formateur = $LeStage['nom'];
            ?>

            <tr>
                <td width=150><?php echo $num ?></a></td>
                <td width=150><?php echo $tarif ?></td>
                <td width=300><?php echo $nbPlaces ?></td>
                <td width=100><?php echo $lieu ?></td>
                <td width=100><?php echo $dateDeb ?></td>
                <td width=100><?php echo $dateFin ?></td>
                <td width=100><?php echo $niveau ?></td>
                <td width=100><?php echo $formateur ?></td>
            </tr>
            <?php 
        }
        ?>

        </table>
        </br>
</body>
</html>
