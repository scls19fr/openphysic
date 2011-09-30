<div class="matieresPersos index">
<h2><?php __('Liste des occupations');?></h2>
<p>
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('id');?></th>
	<th><?php echo $paginator->sort('perso_id');?></th>
	<th><?php echo $paginator->sort('matiere_id');?></th>
	<th><?php echo $paginator->sort('h_cours');?></th>
	<th><?php echo $paginator->sort('h_td');?></th>
	<th><?php echo $paginator->sort('h_tp');?></th>
	<th class="actions"><?php __('Actions');?></th>
</tr>
<?php
$i = 1;
foreach ($matieresPersos as $matieresPerso):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $matieresPerso['MatieresPerso']['id']; ?>
		</td>
		<td>
			<?php echo $html->link($matieresPerso['Perso']['initiales'], array('controller'=> 'persos', 'action'=>'view', $matieresPerso['Perso']['id'])); ?>
		</td>
		<td>
			<?php echo $html->link($matieresPerso['Matiere']['name'], array('controller'=> 'matieres', 'action'=>'view', $matieresPerso['Matiere']['id'])); ?>
		</td>
		<td>
			<?php echo $matieresPerso['MatieresPerso']['h_cours']; ?>
		</td>
		<td>
			<?php echo $matieresPerso['MatieresPerso']['h_td']; ?>
		</td>
		<td>
			<?php echo $matieresPerso['MatieresPerso']['h_tp']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link(__('View', true), array('action'=>'view', $matieresPerso['MatieresPerso']['id'])); ?>
			<?php echo $html->link(__('Edit', true), array('action'=>'edit', $matieresPerso['MatieresPerso']['id'])); ?>
			<?php echo $html->link(__('Delete', true), array('action'=>'delete', $matieresPerso['MatieresPerso']['id']), null, sprintf(__('Êtes-vous sûr de vouloir supprimer l\'occupation # %s ?', true), $matieresPerso['MatieresPerso']['id'])); ?>
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
		<li><?php echo $html->link(__('Nouvelle occupation', true), array('action'=>'add')); ?></li>
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
