<div class="users form">
<?php echo $form->create('User');?>
	<fieldset>
 		<legend><?php __('Editer un utilisateur');?></legend>
		<?php echo $form->input('id')."\n"; ?>
		<?php echo $form->input('username', array('label'=>__("Nom d'utilisateur", true)))."\n"; ?>
		<?php // echo $formx->output('username'); ?>
		<?php echo $form->input('password', array('type'=>'password', 'label'=>__('Mot de passe', true)))."\n"; ?>
		<?php echo $form->input('password2', array('type'=>'password', 'label'=>__('Confirmer le mot de passe', true)))."\n"; ?>
		<?php echo $form->input('group_id')."\n"; ?>
		<?php //echo $formx->output('group_id'); ?>
		<?php echo $form->input('perso_id')."\n"; ?>
		<?php //echo $formx->output('perso_id'); ?>
	</fieldset>
<?php echo $form->end(__('Submit', true));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Supprimer', true), array('action'=>'delete', $form->value('User.id')), null, sprintf(__('Êtes-vous sûr de vouloir supprimer l\'utilisateur # %s ?', true), $form->value('User.id'))); ?></li>
		<li><?php echo $html->link(__('Lister les utilisateurs', true), array('action'=>'index'));?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister les groupes d\'utilisateurs', true), array('controller'=> 'groups', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouveau groupe d\'utilisateurs', true), array('controller'=> 'groups', 'action'=>'add')); ?> </li>
	</ul>
</div>
