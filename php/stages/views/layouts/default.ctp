<?php
/* SVN FILE: $Id: default.ctp 7945 2008-12-19 02:16:01Z gwoo $ */
/**
 *
 * PHP versions 4 and 5
 *
 * CakePHP(tm) :  Rapid Development Framework (http://www.cakephp.org)
 * Copyright 2005-2008, Cake Software Foundation, Inc. (http://www.cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @filesource
 * @copyright     Copyright 2005-2008, Cake Software Foundation, Inc. (http://www.cakefoundation.org)
 * @link          http://www.cakefoundation.org/projects/info/cakephp CakePHP(tm) Project
 * @package       cake
 * @subpackage    cake.cake.console.libs.templates.skel.views.layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 * @version       $Revision: 7945 $
 * @modifiedby    $LastChangedBy: gwoo $
 * @lastmodified  $Date: 2008-12-18 18:16:01 -0800 (Thu, 18 Dec 2008) $
 * @license       http://www.opensource.org/licenses/mit-license.php The MIT License
 */
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<?php echo $html->charset(); ?>
	<title>
		<?php __('Stages: gestion des stages:'); ?>
		<?php echo $title_for_layout; ?>
	</title>
	<?php
		echo $html->meta('icon');

		echo $html->css('cake.generic');

		echo $scripts_for_layout;
	?>
</head>
<body>
	<div id="container">
		<div id="header">
			<h1><?php echo $html->link(__('Stages: gestion des stages', true), array('controller'=>'pages')); ?></h1>
		</div>
		
		<div id="content">

		<div id="user_menu" style="text-align: right;">
			<?php if(!empty($loggedIn)): ?>
			| <?php e($html->link(__('Page principale', true), array('controller' => 'pages', 'action' => 'home'))); ?>
			| <?php e($html->link(__('Déconnecter', true) , array('controller' => 'users', 'action' => 'logout'))); ?>
			| <?php e(sprintf(__("Vous &ecirc;tes <b>%s</b>", true), $html->link($loggeduser['User']['username'], array('controller' => 'users', 'action' => 'view', $loggeduser['User']['id'])))); ?> 
			<?php else: ?> 
			| <?php e($html->link(__('Connecter', true) , array('controller' => 'users', 'action' => 'login'))); ?>
			<?php endif; ?>
			 |
		</div>
		
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