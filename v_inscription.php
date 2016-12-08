<!DOCTYPE html>
<html>
<body>
   <p><h1> S'inscrire : </h1></p></BR>
   <a href="index.php">Accueil</a></br></br>

   <form action="index.php?uc=connexion=ajoutEntraineur" method="post"> 
      <table>  
         <tr><td>Login :</td>                   <td><input type="text" name="login"></td></tr>
         <tr><td>Mot de passe : </td>           <td><input type="text" name="mdp"></td></tr> 
         <tr><td>Nom :                          <td><input type="text" name="nom"></td></tr>
         <tr><td>Prénom : </td>                 <td><input type="text" name="prenom"></td></tr>
         <tr><td>Club : </td>                   <td><input type="text" name="club"></td></tr>
         <tr><td>Licence : </td>                <td><input type="text" name="licence"></td></tr>
         <tr><td>Ville : </td>                  <td><input type="text" name="ville"></td></tr>
         <tr><td>Code postal : </td>            <td><input type="text" name="codepostal"></td></tr>
         <tr><td>Téléphone fixe : </td>         <td><input type="text" name="fixe"></td></tr>
         <tr><td>Téléphone portable : </td>     <td><input type="text" name="port"></td></tr>
         <tr><td>E-mail : </td>                 <td><input type="text" name="mail"></td></tr>
         <tr><td></td><td><input type="submit" value="S'inscrire"></td></tr>
      </table>
   </form>
</body>