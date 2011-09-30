<div class="persos form">
<?php echo $form->create('Perso');?>
	<fieldset>
 		<legend><?php __('Ajouter Perso');?></legend>
	<?php
		echo $form->input('initiales');
		echo $form->input('nom');
		echo $form->input('prenom');
		echo $form->input('statut_id');
		echo $form->input('permanent');
	?>
	</fieldset>
<?php echo $form->end(__('Submit', true));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Lister Persos', true), array('action'=>'index'));?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Statuts', true), array('controller'=> 'statuts', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouveau Statut', true), array('controller'=> 'statuts', 'action'=>'add')); ?> </li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Occupations', true), array('controller'=> 'matieres_persos', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouvelle Occupation', true), array('controller'=> 'matieres_persos', 'action'=>'add')); ?> </li>
	</ul>
</div>
