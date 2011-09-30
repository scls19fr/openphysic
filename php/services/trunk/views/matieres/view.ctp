<div class="matieres view">
<h2><?php  __('Bilan horaire prévisionnel d\'une matière');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $matiere['Matiere']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $matiere['Matiere']['name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Filiere'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link($matiere['Filiere']['name'], array('controller'=> 'filieres', 'action'=>'view', $matiere['Filiere']['id'])); ?>
			&nbsp;
		</dd>
		<dt>Volumes horaires par groupe</dt>
		
		<table cellpadding = "0" cellspacing = "0">
		<tr>
			<th width="16%">&nbsp;</th>
			<th width="16%">H Cours</th>
			<th width="16%">H Td</th>
			<th width="16%">H Tp</th>
		</tr>
		<tr>
			<th>à effectuer</th>		
			<td><?php echo $matiere['Matiere']['h_cours']; ?></td>
			<td><?php echo $matiere['Matiere']['h_td']; ?></td>
			<td><?php echo $matiere['Matiere']['h_tp']; ?></td>
		</tr>
		</table>
		
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Commentaire'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php if (empty($matiere['Matiere']['commentaire'])) { echo 'aucun'; } else { echo $matiere['Matiere']['commentaire']; } ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Editer Matière', true), array('action'=>'edit', $matiere['Matiere']['id'])); ?> </li>
		<li><?php echo $html->link(__('Lister Matières', true), array('controller'=>'filieres', 'action'=>'view', $matiere['Filiere']['id'])); ?> </li>
		<li><?php echo $html->link(__('Nouvelle Matière', true), array('action'=>'add', 'filiere'=>$matiere['Filiere']['id'])); ?> </li>
		<li><?php echo $html->link(__('Supprimer Matière', true), array('action'=>'delete', $matiere['Matiere']['id']), null, sprintf(__('Êtes-vous sûr de vouloir supprimer la matière # %s ?', true), $matiere['Matiere']['id'])); ?> </li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Filières', true), array('controller'=> 'filieres', 'action'=>'index')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Enseignants impliqués dans la matière');?></h3>
	<?php if (!empty($matieres_persos)):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Initiales'); ?></th>
		<th><?php __('Nom'); ?></th>
		<th><?php __('Prenom'); ?></th>
		<th width="8%"><?php __('H Cours'); ?></th>
		<th width="8%"><?php __('H Td'); ?></th>
		<th width="8%"><?php __('H Tp'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 1;
		foreach ($matieres_persos as $matierePerso):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $matierePerso['MatieresPerso']['id'];?></td>
			<td><?php echo $html->link($matierePerso['Perso']['initiales'], array('controller'=> 'persos', 'action'=>'view', $matierePerso['Perso']['id'])); ?></td>
			<td><?php echo $html->link(strtoupper($matierePerso['Perso']['nom']), array('controller'=> 'persos', 'action'=>'view', $matierePerso['Perso']['id'])); ?></td>
			<td><?php echo $html->link($matierePerso['Perso']['prenom'], array('controller'=> 'persos', 'action'=>'view', $matierePerso['Perso']['id'])); ?></td>
			<td><?php echo $matierePerso['MatieresPerso']['h_cours'];?></td>
			<td><?php echo $matierePerso['MatieresPerso']['h_td'];?></td>
			<td><?php echo $matierePerso['MatieresPerso']['h_tp'];?></td>
			<td class="actions">
				<?php echo $html->link(__('View', true), array('controller'=> 'matieres_persos', 'action'=>'view', $matierePerso['MatieresPerso']['id'])); ?>
				<?php echo $html->link(__('Edit', true), array('controller'=> 'matieres_persos', 'action'=>'edit', $matierePerso['MatieresPerso']['id'])); ?>
				<?php echo $html->link(__('Delete', true), array('controller'=> 'matieres_persos', 'action'=>'delete', $matierePerso['MatieresPerso']['id']), null, sprintf(__('Êtes-vous sûr de vouloir supprimer l\'occupation # %s ?', true), $matierePerso['MatieresPerso']['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $html->link( __('Nouvel enseignant impliqué dans la matière', true),
				array('controller'=> 'matieres_persos',
					'action'=>'add',
					'matiere' => $matiere['Matiere']['id']
					)
				);?> </li>
		</ul>
	</div>
</div>

<div class="vol_horaire_total">
		<h3>Volume horaire total</h3>
		<table cellpadding = "0" cellspacing = "0">
		<tr>
			<th width="16%">&nbsp;</th>
			<th width="16%">H Cours</th>
			<th width="16%">H Td</th>
			<th width="16%">H Tp</th>
			<th>&nbsp;</th>
			<th width="16%">H Tot</th>
			<th width="16%">H Eq_Td</th>  
		</tr>
		<tr class="altrow">
			<th>à effectuer</th>
			<td><?php echo $vol_horaire_total['a_effectuer']['h_cours']; ?></td>
			<td><?php echo $vol_horaire_total['a_effectuer']['h_td']; ?></td>
			<td><?php echo $vol_horaire_total['a_effectuer']['h_tp']; ?></td>
			<td>&nbsp;</td>
			<td><?php echo $heures->h_tot($vol_horaire_total['a_effectuer']); ?></td>
			<td><?php echo $heures->h_eq_td($vol_horaire_total['a_effectuer']); ?></td>
		</tr>
		<tr>
			<th>attribué</th>
			<td><?php echo $vol_horaire_total['attribue']['h_cours']; ?></td>
			<td><?php echo $vol_horaire_total['attribue']['h_td']; ?></td>
			<td><?php echo $vol_horaire_total['attribue']['h_tp']; ?></td>
			<td>&nbsp;</td>
			<td><?php echo $heures->h_tot($vol_horaire_total['attribue']); ?></td>
			<td><?php echo $heures->h_eq_td($vol_horaire_total['attribue']); ?></td>
		</tr>
		<tr class="altrow">
			<th>restant</th>
			<td <?php echo $couleurs->heures_restantes($vol_horaire_total['restant']['h_cours'], $vol_horaire_total['a_effectuer']['h_cours']); ?>><?php echo $vol_horaire_total['restant']['h_cours']; ?></td>
			<td <?php echo $couleurs->heures_restantes($vol_horaire_total['restant']['h_td'], $vol_horaire_total['a_effectuer']['h_td']); ?>><?php echo $vol_horaire_total['restant']['h_td']; ?></td>
			<td <?php echo $couleurs->heures_restantes($vol_horaire_total['restant']['h_tp'], $vol_horaire_total['a_effectuer']['h_tp']); ?>><?php echo $vol_horaire_total['restant']['h_tp']; ?></td>
			<td>&nbsp;</td>
			<td><?php echo $heures->h_tot($vol_horaire_total['restant']); ?></td>
			<td><?php echo $heures->h_eq_td($vol_horaire_total['restant']); ?></td>
		</tr>
		</table>

<!--
<dl>
	<dt>H Cours</dt>
	<dd><?php echo $vol_horaire_total['h_cours']; ?>&nbsp;</dd>
	
	<dt>H Td</dt>
	<dd><?php echo $vol_horaire_total['h_td']; ?>&nbsp;</dd>

	<dt>H Tp</dt>
	<dd><?php echo $vol_horaire_total['h_tp']; ?>&nbsp;</dd>
	
	<br/>

	<dt>H Tot</dt>
	<dd><?php echo $vol_horaire_total['h_tot']; ?>&nbsp;</dd>
	
	<dt>H Eq_Td</dt>  
	<dd><?php echo $vol_horaire_total['h_eq_td']; ?>&nbsp;</dd>
</dl>
-->


</div>
