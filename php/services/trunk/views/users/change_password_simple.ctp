<div class="users form">
<?php echo $form->create('User', array('action' => 'change_password'));?>
	<fieldset>
 		<legend><?php __('Modifier le mot de passe');?></legend>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __("Nom d'utilisateur"); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->data['User']['username']; ?>
			&nbsp;
		</dd>
	</dl>
	<?php
		echo $form->input('id');
		//echo $form->hidden('username');
		echo $form->input('password', array('type'=>'password', 'label'=>__('Mot de passe', true)));
		echo $form->input('password2', array('type'=>'password', 'label'=>__('Confirmer le mot de passe', true)));
		//echo $form->input('group_id');
		//echo $form->input('perso_id');
	?>
	</fieldset>
<?php echo $form->end(__('Submit', true));?>
</div>
