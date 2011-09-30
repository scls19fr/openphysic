<div class="users form">
<?php echo $form->create('User');?>
	<fieldset>
 		<legend><?php __('Ajouter un utilisateur');?></legend>
	<?php
		echo $form->input('username', array('label'=>__('Nom d\'utilisateur', true)));
		echo $form->input('password', array('type'=>'password', 'label'=>__('Mot de passe', true)));
		echo $form->input('password2', array('type'=>'password', 'label'=>__('Confirmation du mot de passe', true)));
		echo $form->input('group_id');
		echo $form->input('perso_id');
	?>
	</fieldset>
<?php echo $form->end(__('Submit', true));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Lister les utilisateurs', true), array('action'=>'index'));?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister les groupes d\'utilisateurs', true), array('controller'=> 'groups', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouveau groupe d\'utilisateurs', true), array('controller'=> 'groups', 'action'=>'add')); ?> </li>
	</ul>
</div>
