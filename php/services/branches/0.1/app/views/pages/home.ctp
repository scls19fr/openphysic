<dl>
	<dt>Présentation :</dt>
	<dd>Cette application a pour objectif de r&eacute;aliser une gestion pr&eacute;visionnelle des services d'enseignement.</dd>
</dl>
		

<h2>Menu</h2>
<ul>
  <li><?php echo $html->link("filieres", array('controller'=>'filieres') ); ?> :: Liste de toutes les filières</li>
  <li><?php echo $html->link("statuts", array('controller'=>'statuts') ); ?> :: Liste de tous les statuts</li>
  <li><?php echo $html->link("persos", array('controller'=>'persos') ); ?> :: Liste de tous les personnels</li>
</ul>


<h2>Menu dev</h2>
<ul>
  <li><?php echo $html->link("matieres", array('controller'=>'matieres') ); ?> :: Liste de toutes les matières</li>
  <!--
  <ul>
    <li><?php echo $html->link("matieres", array('controller'=>'matieres', 'action'=>'filiere', 1) ); ?> :: Liste des matières de la filière "id=1" </li>
  </ul>
  -->
  <li><?php echo $html->link("matieres_persos", array('controller'=>'matieres_persos') ); ?> :: Occupation des personnels</li>
  <li><?php echo $html->link("users", array('controller'=>'users') ); ?> :: Liste de toutes les utilisateurs</li>
  <li><?php echo $html->link("groups", array('controller'=>'groups') ); ?> :: Liste de toutes les groupes d'utilisateurs</li>
</ul>

<h3><?php echo $html->link('A propos de...', array('controller'=>'pages', 'action'=>'about') ); ?></h3>