<div class="matieresPersos form">
<?php echo $form->create('MatieresPerso');?>
	<fieldset>
 		<legend><?php __('Ajouter Occupation');?></legend>
	<?php
		//echo $form->input('perso_id');
		$ar = array ( );
		foreach ( $persos as $key => $perso  ) {
			//$ar [ $perso [ 'Perso' ] [ 'id' ] ] = sprintf("(%s) %s %s", $perso [ 'Perso' ] [ 'initiales' ], $perso [ 'Perso' ] [ 'nom' ], $perso [ 'Perso' ] [ 'prenom' ]);
			//$ar [ $perso [ 'Perso' ] [ 'id' ] ] = "({$perso [ 'Perso' ] [ 'initiales' ]}) {$perso [ 'Perso' ] [ 'nom' ]} {$perso [ 'Perso' ] [ 'prenom' ]}";
			$ar [ $perso [ 'Perso' ] [ 'id' ] ] = $people->format($perso['Perso']);
		}
		echo $form->input('perso_id', array('options' =>$ar ) );
		
		echo $form->input('matiere_id');
	?>

		<table cellpadding = "0" cellspacing = "0">
		<tr>
			<th width="16%">&nbsp;</th>
			<th width="16%">H Cours</th>
			<th width="16%">H Td</th>
			<th width="16%">H Tp</th>
		</tr>
		<tr>
			<th>attribu&eacute;</th>		
			<td><?php echo $form->input('h_cours', array('label' => false)); ?></td>
			<td><?php echo $form->input('h_td', array('label' => false)); ?></td>
			<td><?php echo $form->input('h_tp', array('label' => false)); ?></td>
		</tr>
		</table>
	
	</fieldset>
<?php echo $form->end(__('Submit', true));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Lister Occupations', true), array('action'=>'index'));?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Persos', true), array('controller'=> 'persos', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouveau Perso', true), array('controller'=> 'persos', 'action'=>'add')); ?> </li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Matieres', true), array('controller'=> 'matieres', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouvelle Matiere', true), array('controller'=> 'matieres', 'action'=>'add')); ?> </li>
	</ul>
</div>
