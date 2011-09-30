<div class="users form">
<?php echo $form->create('User', array('action' => 'change_password'));?>
	<fieldset>
 		<legend><?php __('Modifier le mot de passe');?></legend>
		<?php echo $form->input('id')."\n"; ?>
		<?php echo $form->input('username', array('label'=>__("Nom d'utilisateur", true), 'disabled'=>'true'))."\n"; ?>
		<?php echo $form->input('password', array('type'=>'password', 'label'=>__('Mot de passe', true)))."\n"; ?>
		<?php echo $form->input('password2', array('type'=>'password', 'label'=>__('Confirmer le mot de passe', true)))."\n"; ?>
		<?php echo $form->input('group_id', array('disabled'=>'true'))."\n"; ?>
		<?php echo $form->input('perso_id', array('disabled'=>'true'))."\n"; ?>
	</fieldset>
<?php echo $form->end(__('Submit', true));?>
</div>
