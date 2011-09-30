<div class="persos index">
<h2><?php __('Liste des personnels');?></h2>
<p>
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('id');?></th>
	<th><?php echo $paginator->sort('initiales');?></th>
	<th><?php echo $paginator->sort('nom');?></th>
	<th><?php echo $paginator->sort('prenom');?></th>
	<th><?php echo $paginator->sort('statut_id');?></th>
	<th><?php echo $paginator->sort('permanent');?></th>
	<th>H Cours</th>
	<th>H Td</th>
	<th>H Tp</th>
	<th>&nbsp;</th>
	<th>H Tot</th>
	<th>H Eq_Td</th>  
	<th class="actions"><?php __('Actions');?></th>
</tr>
<?php
$i = 1;
foreach ($persos as $perso):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td><?php echo $perso['Perso']['id']; ?></td>
		<td><?php echo $html->link($perso['Perso']['initiales'], array('action'=>'view', $perso['Perso']['id'])); ?></td>
		<td><?php echo $html->link(strtoupper($perso['Perso']['nom']), array('action'=>'view', $perso['Perso']['id'])); ?></td>
		<td><?php echo $html->link($perso['Perso']['prenom'], array('action'=>'view', $perso['Perso']['id'])); ?></td>
		<td><?php echo $html->link($perso['Statut']['nom'], array('controller'=> 'statuts', 'action'=>'view', $perso['Statut']['id'])); ?></td>
		<td><?php echo $boolean->yes_no( $perso['Perso']['permanent'] ); ?></td>
		<td><?php echo $perso['BilanService']['h_cours']; ?></td>
		<td><?php echo $perso['BilanService']['h_td']; ?></td>
		<td><?php echo $perso['BilanService']['h_tp']; ?></td>
		<td>&nbsp;</td>
		<td><?php echo $heures->h_tot($perso['BilanService']); ?></td>
		<td><?php echo $heures->h_eq_td($perso['BilanService']); ?></td>
		<td class="actions">
			<?php echo $html->link(__('View', true), array('action'=>'view', $perso['Perso']['id'])); ?>
			<?php echo $html->link(__('Edit', true), array('action'=>'edit', $perso['Perso']['id'])); ?>
			<?php echo $html->link(__('Delete', true), array('action'=>'delete', $perso['Perso']['id']), null, sprintf(__('Êtes-vous sûr de vouloir supprimer le personnel # %s ?', true), $perso['Perso']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
</table>
</div>
<div class="paging">
	<?php echo $paginator->prev('<< '.__('previous', true), array(), null, array('class'=>'disabled'));?>
 | 	<?php echo $paginator->numbers();?>
	<?php echo $paginator->next(__('next', true).' >>', array(), null, array('class'=>'disabled'));?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Nouveau Perso', true), array('action'=>'add')); ?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Statuts', true), array('controller'=> 'statuts', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouveau Statut', true), array('controller'=> 'statuts', 'action'=>'add')); ?> </li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister les occupations', true), array('controller'=> 'matieres_persos', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouvelle occupation', true), array('controller'=> 'matieres_persos', 'action'=>'add')); ?> </li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Bilan de service prévisionnel de l\'ensemble des personnels', true), array('action'=>'bilan')); ?> </li>
	</ul>
</div>
