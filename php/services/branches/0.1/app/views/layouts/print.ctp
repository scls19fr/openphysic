<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<?php echo $html->charset()."\n"; ?>
	<title><?php __("Gestion des services :: $title_for_layout")."\n"; ?></title>
	<?php echo $html->meta('icon')."\n"; ?>
	<?php echo $html->css('cake.generic'); ?>
	<?php echo $html->css(array('print'), 'stylesheet', array('media' => 'print'))."\n"; ?>
	<?php echo $scripts_for_layout; ?>
</head>
<body>
	<div id="container">
		<div id="content">		
			<?php echo $content_for_layout; ?>
		</div>
	</div>
	<?php echo $cakeDebug; ?>
</body>
</html>