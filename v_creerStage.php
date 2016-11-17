<!DOCTYPE html>
<html>
<body>
 <a href="index.php?uc=gererStage&action=accueilAdmin">Accueil</a></br></br>
   <p><h1>Creer un stage :</h1></p><BR/>

   <form action="index.php?uc=gererStage&action=confirmCreation" method="post"> 

	Tarif :				<input type="text" size="20" name="tarif"></br>
	Lieu : 				<input type="text" size="20" name="lieu"></br>
	Nombre de place :	<input type="text" size="20" name="nbPlace"></br>
	Date de début : 	<input type="date" " name="dateDeb"></br>
	Date de fin : 		<input type="date" " name="dateFin"></br>
	Niveau : 			<select name="niveau">
							<option value="1"> Département </option>
							<option value="2"> Région </option> 
						</select>
	</br>
	Formateur : 		<select name="formateur">
				
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
	</br>

	<tr><td></td><td> <input type="submit" value="Valider">
</form>

</body>
</html>
