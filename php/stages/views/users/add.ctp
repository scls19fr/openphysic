<div class="users form">
<?php echo $form->create('User');?>
	<fieldset>
 		<legend><?php __('Add User');?></legend>
	<?php
		echo $form->input('username', array('label'=>__('Nom d\'utilisateur', true)));
		echo $form->input('password', array('type'=>'password', 'label'=>__('Mot de passe', true)));
		echo $form->input('password2', array('type'=>'password', 'label'=>__('Confirmation du mot de passe', true)));
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('List Users', true), array('action' => 'index'));?></li>
	</ul>
</div>
