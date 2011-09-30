<div class="matieres form">
<?php echo $form->create('Matiere');?>
	<fieldset>
 		<legend><?php __('Ajouter Matiere');?></legend>
	<?php
		echo $form->input('filiere_id');
		echo $form->input('name', array('label' => 'Nom'));
	?>

		<table cellpadding = "0" cellspacing = "0">
		<tr>
			<th width="16%">&nbsp;</th>
			<th width="16%">H Cours</th>
			<th width="16%">H Td</th>
			<th width="16%">H Tp</th>
		</tr>
		<tr>
			<th>à attribuer (par groupe)</th>		
			<td><?php echo $form->input('h_cours', array('label' => false)); ?></td>
			<td><?php echo $form->input('h_td', array('label' => false)); ?></td>
			<td><?php echo $form->input('h_tp', array('label' => false)); ?></td>
		</tr>
		</table>

	<?php
		echo $form->input('commentaire');
	?>
	</fieldset>
<?php echo $form->end(__('Submit', true));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Lister Matieres', true), array('action'=>'index'));?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Filieres', true), array('controller'=> 'filieres', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouvelle Filiere', true), array('controller'=> 'filieres', 'action'=>'add')); ?> </li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Occupations', true), array('controller'=> 'matieres_persos', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouvelle Occupation', true), array('controller'=> 'matieres_persos', 'action'=>'add')); ?> </li>
	</ul>
</div>
