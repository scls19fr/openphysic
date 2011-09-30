<div class="groups form">
<?php echo $form->create('Group');?>
	<fieldset>
 		<legend><?php __('Editer Groupe');?></legend>
	<?php
		echo $form->input('id');
		echo $form->input('name');
	?>
	</fieldset>
<?php echo $form->end(__('Submit', true));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Supprimer', true), array('action' => 'delete', $form->value('Group.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Group.id'))); ?></li>
		<li><?php echo $html->link(__('Lister les groupes', true), array('action' => 'index'));?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister les utilisateurs', true), array('controller' => 'users', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('Nouvel utilisateur', true), array('controller' => 'users', 'action' => 'add')); ?> </li>
	</ul>
</div>
