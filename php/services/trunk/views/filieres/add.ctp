<div class="filieres form">
<?php echo $form->create('Filiere');?>
	<fieldset>
 		<legend><?php __('Ajouter Filiere');?></legend>
	<?php
		echo $form->input('name');
		echo $form->input('nb_gr_td');
		echo $form->input('nb_gr_tp');
	?>
	</fieldset>
<?php echo $form->end(__('Submit', true));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Lister Filieres', true), array('action'=>'index'));?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Matieres', true), array('controller'=> 'matieres', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouvelle Matiere', true), array('controller'=> 'matieres', 'action'=>'add')); ?> </li>
	</ul>
</div>
