<dl>
	<dt>Présentation :</dt>
	<dd>Cette application a pour objectif de gérer les stages.</dd>
</dl>

		

<h2>Menu</h2>
<ul>
  <li><?php echo $html->link("filieres", array('controller'=>'filieres') ); ?> :: Liste de toutes les filieres</li>
  <li><?php echo $html->link("enseignants", array('controller'=>'enseignants') ); ?> :: Liste de tous les enseignants</li>
  <li><?php echo $html->link("stagiaires", array('controller'=>'stagiaires') ); ?> :: Liste de tous les stagiaires</li>
  <li><?php echo $html->link("entreprises", array('controller'=>'entreprises') ); ?> :: Liste de tous les entreprises</li>
  <li><?php echo $html->link("stages", array('controller'=>'stages') ); ?> :: Liste de tous les stages</li>
  <li><?php echo $html->link("tuteurs", array('controller'=>'tuteurs') ); ?> :: Liste de tous les tuteurs</li>
  <li><?php echo $html->link("users", array('controller'=>'users') ); ?> :: Liste de tous les utilisateurs de l'application</li>
</ul>



<h3><?php echo $html->link('A propos de...', array('controller'=>'pages', 'action'=>'about') ); ?></h3>