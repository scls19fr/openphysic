<div class="matieres index">
<h2><?php __('Matieres');?></h2>
<p>
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('id');?></th>
	<th><?php echo $paginator->sort('name');?></th>
	<th><?php echo $paginator->sort('h_cours');?></th>
	<th><?php echo $paginator->sort('h_td');?></th>
	<th><?php echo $paginator->sort('h_tp');?></th>
	<th><?php echo $paginator->sort('filiere_id');?></th>
	<th><?php echo $paginator->sort('commentaire');?></th>
	<th class="actions"><?php __('Actions');?></th>
</tr>
<?php
$i = 1;
foreach ($matieres as $matiere):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td>
			<?php echo $matiere['Matiere']['id']; ?>
		</td>
		<td>
			<?php echo $html->link($matiere['Matiere']['name'], array('action'=>'view', $matiere['Matiere']['id'])); ?>
		</td>
		<td>
			<?php echo $matiere['Matiere']['h_cours']; ?>
		</td>
		<td>
			<?php echo $matiere['Matiere']['h_td']; ?>
		</td>
		<td>
			<?php echo $matiere['Matiere']['h_tp']; ?>
		</td>
		<td>
			<?php echo $html->link($matiere['Filiere']['name'], array('controller'=> 'filieres', 'action'=>'view', $matiere['Filiere']['id'])); ?>
		</td>
		<td>
			<?php echo $matiere['Matiere']['commentaire']; ?>
		</td>
		<td class="actions">
			<?php echo $html->link(__('View', true), array('action'=>'view', $matiere['Matiere']['id'])); ?>
			<?php echo $html->link(__('Edit', true), array('action'=>'edit', $matiere['Matiere']['id'])); ?>
			<?php echo $html->link(__('Delete', true), array('action'=>'delete', $matiere['Matiere']['id']), null, sprintf(__('Êtes-vous sûr de vouloir supprimer la matière # %s ?', true), $matiere['Matiere']['id'])); ?>
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
		<li><?php echo $html->link(__('Nouvelle Matiere', true), array('action'=>'add')); ?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Filieres', true), array('controller'=> 'filieres', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouvelle Filiere', true), array('controller'=> 'filieres', 'action'=>'add')); ?> </li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister occupations', true), array('controller'=> 'matieres_persos', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouvelle occupation', true), array('controller'=> 'matieres_persos', 'action'=>'add')); ?> </li>
	</ul>
</div>
