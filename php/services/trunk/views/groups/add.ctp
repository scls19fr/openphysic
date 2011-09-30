<div class="groups form">
<?php echo $form->create('Group');?>
	<fieldset>
 		<legend><?php __('Ajouter Groupe');?></legend>
	<?php
		echo $form->input('name');
	?>
	</fieldset>
<?php echo $form->end(__('Submit', true));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Lister les groupes', true), array('action' => 'index'));?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister les utilisateurs', true), array('controller' => 'users', 'action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('Nouvel utilisateur', true), array('controller' => 'users', 'action' => 'add')); ?> </li>
	</ul>
</div>
