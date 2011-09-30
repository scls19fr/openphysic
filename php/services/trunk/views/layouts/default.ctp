<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<?php echo $html->charset(); ?>
	<title><?php __("Gestion des services :: $title_for_layout"); ?></title>
	<?php
		echo $html->meta('icon');

		echo $html->css('cake.generic');
		
		echo $html->charset('utf-8');

		echo $scripts_for_layout;
	?>
</head>
<body>
	<div id="container">
		<div id="header">
			<h1><?= $html->link('Gestion prévisionnelle des services d\'enseignement', array('controller' => 'pages', 'action'=>'') ); ?></h1>
		</div>

		<div id="content">
		
		<div id="user_menu">
			<?php if(!empty($loggedIn)): ?>
			| <?php e($html->link(__('Page principale', true), array('controller' => 'pages', 'action' => 'home'))); ?>
			| <?php e($html->link(__('Déconnecter', true) , array('controller' => 'users', 'action' => 'logout'))); ?>
			| <?php e(sprintf(__("Vous &ecirc;tes <b>%s</b> (%s)", true), $html->link($loggeduser['User']['username'], array('controller' => 'users', 'action' => 'view', $loggeduser['User']['id'])), $loggeduser['Group']['name'])); // $loggeduser['User']['role'] ou $loggeduser['Group']['name']?> 
			<?php else: ?> 
			| <?php e($html->link(__('Connecter', true) , array('controller' => 'users', 'action' => 'login'))); ?>
			<?php endif; ?>
			 |
		</div>
		
			<?php $session->flash('auth'); ?>
			<?php $session->flash(); ?>

			<?php echo $content_for_layout; ?>

		</div>
		<div id="footer">
			<?php echo $html->link(
					$html->image('celles.net.power.gif', array('alt'=> __("Made by: celles.net", true), 'border'=>"0")),
					'http://www.celles.net/',
					array('target'=>'_blank'), null, false
				);
			?>
			<?php echo $html->link(
					$html->image('cake.power.gif', array('alt'=> __("CakePHP: the rapid development php framework", true), 'border'=>"0")),
					'http://www.cakephp.org/',
					array('target'=>'_blank'), null, false
				);
			?>
		</div>
	</div>
	<?php echo $cakeDebug; ?>
</body>
</html>
