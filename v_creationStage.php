<!DOCTYPE html>
<html>
<body>
 <a href="index.php?uc=gererStage&action=accueilAdmin">Accueil</a></br></br>
   <p><h1>Creer un stage :</h1></p><BR/>

   <form action="index.php?uc=gererStage&action=confirmCreation" method="post"> 

<table>
<tbody>
	<tr><td>Date de début : </td><td><input type="date" " name="dateDeb"></br>
	<tr><td>Date de fin : </td><td><input type="date" " name="dateFin"></br>
	<tr><td>Nombre de place :</td><td><input type="text" size="20" name="nbPlace"></br>
	<tr><td>Tarif Ligue :</td><td><input type="text" size="20" name="tarifL"></br>
	<tr><td>Tarif Hors-Ligue :</td><td><input type="text" size="20" name="tarifHL"></br>
	<tr><td>Lieu :</td><td><input type="text" size="20" name="lieu"></br>
	<tr><td>Categorie :</td><td><input type="text" size="20" name="categorie"></br>
	<tr><td>Formation :</td><td>
	

	<?php
foreach($lesFormations as $uneFormation) 
{
	$idFormation = $uneFormation['idFormation'];
	$libFormation = $uneFormation['libelle'];
	?>
	
   <input type="radio" name=stage value="Option 1"/>  <?php echo $libFormation ?>       |

<?php
}
?>
	 
	</br>
	<tr><td>Formateur :</td><td>		<select name="formateur">
				
					<?php
						foreach($LesFormateurs as $LeFormateur)
       					{
       						$num = $LeFormateur['idFormateur'];
       					    $nom = $LeFormateur['nom'];
 							$prenom = $LeFormateur['prenom'];
						
						?><option value=<?php echo $num ?>><?php
 							echo $nom;
       					    echo $prenom ;
       					?></option>
       				<?php
       					}
       				?>
       				
						</select>
</table>
</tbody>
	</br>

	<tr><td></td><td> <input type="submit" value="Valider">
</form>

</body>
</html>