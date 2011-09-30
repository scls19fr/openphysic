<div class="statuts form">
<?php echo $form->create('Statut');?>
	<fieldset>
 		<legend><?php __('Ajouter Statut');?></legend>
	<?php
		echo $form->input('nom');
		echo $form->input('h_statut');
		echo $form->input('h_sup_max');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Lister Statuts', true), array('action'=>'index'));?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Persos', true), array('controller'=> 'persos', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouveau Perso', true), array('controller'=> 'persos', 'action'=>'add')); ?> </li>
	</ul>
</div>
