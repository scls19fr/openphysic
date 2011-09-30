<dl>
	<dt>Présentation :</dt>
	<dd>Cette application est un wiki.</dd>
</dl>

<h2><?php e(__("Connexion", true)); ?></h2>
<?php if ($session->check('Message.auth')) $session->flash('auth'); ?>

<?php echo $form->create('User', array('action'=>'login')); ?>

<?php echo $form->input('username', array('label'=>__('Nom d\'utilisateur', true))); ?>

<?php echo $form->input('password', array('type'=>'password', 'label'=>__('Mot de passe', true))); ?>

<?php echo $form->end(__('Se connecter', true)); ?>

<?php
/*
<h3 style="text-align: right;"><?php echo $html->link('A propos de...', array('controller'=>'pages', 'action'=>'about') ); ?></h3>
*/
?>