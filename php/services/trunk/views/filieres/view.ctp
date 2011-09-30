<div class="filieres view">
<h2><?php  __('Bilan horaire prévisionnel d\'une filière');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $filiere['Filiere']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $filiere['Filiere']['name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Nb Gr Td'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $filiere['Filiere']['nb_gr_td']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Nb Gr Tp'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $filiere['Filiere']['nb_gr_tp']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Editer Filière', true), array('action'=>'edit', $filiere['Filiere']['id'])); ?> </li>
		<li><?php echo $html->link(__('Lister Filières', true), array('action'=>'index')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Matières enseignées dans la filière');?></h3>
	<h4><?php __('Volume horaire par groupe'); ?></h4>
	<?php if (!empty($filiere['Matiere'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Name'); ?></th>
		<th width="8%"><?php __('H Cours'); ?></th>
		<th width="8%"><?php __('H Td'); ?></th>
		<th width="8%"><?php __('H Tp'); ?></th>
		<th><?php __('Commentaire'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 1;
		foreach ($filiere['Matiere'] as $matiere):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>		
		<tr<?php echo $class;?>>
			<td><?php echo $matiere['id'];?></td>
			<td><?php
				echo $html->link($matiere['name'], array('controller'=> 'matieres', 'action'=>'view', $matiere['id']));
			?></td>
			<td><?php echo $matiere['h_cours'];?></td>
			<td><?php echo $matiere['h_td'];?></td>
			<td><?php echo $matiere['h_tp'];?></td>
			<td><?php echo $matiere['commentaire'];?></td>
			<td class="actions">
				<?php echo $html->link(__('View', true), array('controller'=> 'matieres', 'action'=>'view', $matiere['id'])); ?>
				<?php echo $html->link(__('Edit', true), array('controller'=> 'matieres', 'action'=>'edit', $matiere['id'])); ?>
				<?php echo $html->link(__('Delete', true), array('controller'=> 'matieres', 'action'=>'delete', $matiere['id']), null, sprintf(__('Êtes-vous sûr de vouloir supprimer la matière # %s ?', true), $matiere['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
	<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $html->link(__('Nouvelle Matière', true), array('controller'=> 'matieres', 'action'=>'add', 'filiere'=>$filiere['Filiere']['id'] ));?> </li>
		</ul>
	</div>

	<h4><?php __('Volume horaire pour l\'ensemble des groupes'); ?></h4>
	<?php if (!empty($filiere['Matiere'])):?>
	<table cellpadding = "0" cellspacing = "0">

	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Name'); ?></th>
		<th width="6%"><?php __('H Cours'); ?></th>
		<th width="6%"><?php __('H Td'); ?></th>
		<th width="6%"><?php __('H Tp'); ?></th>
		<th>&nbsp;</th>
		<th width="6%"><?php __('H Tot'); ?></th>
		<th width="6%"><?php __('H Eq Td'); ?></th>		
		<th class="actions"><?php __('Actions');?></th>
	</tr>

	<?php
		$i = 0;
		foreach ($filiere['Matiere'] as $matiere):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><?php echo $matiere['vol_horaire_total']['a_effectuer']['h_cours'];?></td>
			<td><?php echo $matiere['vol_horaire_total']['a_effectuer']['h_td'];?></td>
			<td><?php echo $matiere['vol_horaire_total']['a_effectuer']['h_tp'];?></td>
			<td>à&nbsp;attribuer</td>
			<td><?php echo $heures->h_tot($matiere['vol_horaire_total']['a_effectuer']); ?></td>
			<td><?php echo $heures->h_eq_td($matiere['vol_horaire_total']['a_effectuer']); ?></td>
			<td>&nbsp;</td>
		</tr>
		<tr<?php echo $class;?>>
			<td><?php echo $matiere['id'];?></td>
			<td><?php
				echo $html->link($matiere['name'], array('controller'=> 'matieres', 'action'=>'view', $matiere['id']));
			?></td>
			<td><?php echo $matiere['vol_horaire_total']['attribue']['h_cours']; ?></td>
			<td><?php echo $matiere['vol_horaire_total']['attribue']['h_td']; ?></td>
			<td><?php echo $matiere['vol_horaire_total']['attribue']['h_tp']; ?></td>
			<td>attribué</td>
			<td><?php echo $heures->h_tot($matiere['vol_horaire_total']['attribue']); ?></td>
			<td><?php echo $heures->h_eq_td($matiere['vol_horaire_total']['attribue']); ?></td>
			<td class="actions">
				<?php echo $html->link(__('View', true), array('controller'=> 'matieres', 'action'=>'view', $matiere['id'])); ?>
				<?php echo $html->link(__('Edit', true), array('controller'=> 'matieres', 'action'=>'edit', $matiere['id'])); ?>
				<?php echo $html->link(__('Delete', true), array('controller'=> 'matieres', 'action'=>'delete', $matiere['id']), null, sprintf(__('Êtes-vous sûr de vouloir supprimer la matière # %s ?', true), $matiere['id'])); ?>
			</td>
		</tr>
		<tr<?php echo $class;?>>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td <?php echo $couleurs->heures_restantes($matiere['vol_horaire_total']['restant']['h_cours'], $matiere['vol_horaire_total']['a_effectuer']['h_cours']); ?>><?php echo $matiere['vol_horaire_total']['restant']['h_cours'];?></td>
			<td <?php echo $couleurs->heures_restantes($matiere['vol_horaire_total']['restant']['h_td'], $matiere['vol_horaire_total']['a_effectuer']['h_td']); ?>><?php echo $matiere['vol_horaire_total']['restant']['h_td'];?></td>
			<td <?php echo $couleurs->heures_restantes($matiere['vol_horaire_total']['restant']['h_tp'], $matiere['vol_horaire_total']['a_effectuer']['h_tp']); ?>><?php echo $matiere['vol_horaire_total']['restant']['h_tp'];?></td>
			<td>restant</td>
			<td><?php echo $heures->h_tot($matiere['vol_horaire_total']['restant']); ?></td>
			<td><?php echo $heures->h_eq_td($matiere['vol_horaire_total']['restant']); ?></td>
			<td>&nbsp;</td>
		</tr>
	<?php endforeach; ?>
	</table>
	<?php endif; ?>
</div>

<div class="vol_horaire_total">
<h3>Volume horaire pour l'ensemble de la filière</h3>
		<table cellpadding = "0" cellspacing = "0">
		<tr>
			<th>&nbsp;</th>
			<th>H Cours</th>
			<th>H Td</th>
			<th>H Tp</th>
			<th>&nbsp;</th>
			<th>H Tot</th>
			<th>H Eq_Td</th>  
		</tr>
		<tr class="altrow">
			<th>à effectuer</th>
			<td><?php echo $filiere['vol_horaire_total']['a_effectuer']['h_cours']; ?></td>
			<td><?php echo $filiere['vol_horaire_total']['a_effectuer']['h_td']; ?></td>
			<td><?php echo $filiere['vol_horaire_total']['a_effectuer']['h_tp']; ?></td>
			<td>&nbsp;</td>
			<td><?php echo $heures->h_tot($filiere['vol_horaire_total']['a_effectuer']); ?></td>
			<td><?php echo $heures->h_eq_td($filiere['vol_horaire_total']['a_effectuer']); ?></td>
		</tr>
		<tr>
			<th>attribué</th>
			<td><?php echo $filiere['vol_horaire_total']['attribue']['h_cours']; ?></td>
			<td><?php echo $filiere['vol_horaire_total']['attribue']['h_td']; ?></td>
			<td><?php echo $filiere['vol_horaire_total']['attribue']['h_tp']; ?></td>
			<td>&nbsp;</td>
			<td><?php echo $heures->h_tot($filiere['vol_horaire_total']['attribue']); ?></td>
			<td><?php echo $heures->h_eq_td($filiere['vol_horaire_total']['attribue']); ?></td>
		</tr>
		<tr class="altrow">
			<th>restant</th>
			<td <?php echo $couleurs->heures_restantes($filiere['vol_horaire_total']['restant']['h_cours'], $filiere['vol_horaire_total']['restant']['h_cours']); ?>><?php echo $filiere['vol_horaire_total']['restant']['h_cours']; ?></td>
			<td <?php echo $couleurs->heures_restantes($filiere['vol_horaire_total']['restant']['h_td'], $filiere['vol_horaire_total']['restant']['h_td']); ?>><?php echo $filiere['vol_horaire_total']['restant']['h_td']; ?></td>
			<td <?php echo $couleurs->heures_restantes($filiere['vol_horaire_total']['restant']['h_tp'], $filiere['vol_horaire_total']['restant']['h_tp']); ?>><?php echo $filiere['vol_horaire_total']['restant']['h_tp']; ?></td>
			<td>&nbsp;</td>
			<td><?php echo $heures->h_tot($filiere['vol_horaire_total']['restant']); ?></td>
			<td><?php echo $heures->h_eq_td($filiere['vol_horaire_total']['restant']); ?></td>
		</tr>
		</table>

</div>
