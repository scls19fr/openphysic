<dl>
	<dt>Présentation :</dt>
	<dd>Cette application est un wiki.</dd>
</dl>

		

<h2>Menu</h2>
<ul>
  <li><?php echo $html->link("wikipages", array('controller'=>'wikipages') ); ?> :: Liste de toutes les pages du wiki</li>
  <li><?php echo $html->link("users", array('controller'=>'users') ); ?> :: Liste de tous les utilisateurs de l'application</li>
</ul>



<h3><?php echo $html->link('A propos de...', array('controller'=>'pages', 'action'=>'about') ); ?></h3>