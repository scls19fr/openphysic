<div class="statuts index">
<h2><?php __('Statuts');?></h2>
<p>
<?php
echo $paginator->counter(array(
'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
));
?></p>
<table cellpadding="0" cellspacing="0">
<tr>
	<th><?php echo $paginator->sort('id');?></th>
	<th><?php echo $paginator->sort('nom');?></th>
	<th><?php echo $paginator->sort('h_statut');?></th>
	<th><?php echo $paginator->sort('h_sup_max');?></th>
	<th class="actions"><?php __('Actions');?></th>
</tr>
<?php
$i = 1;
foreach ($statuts as $statut):
	$class = null;
	if ($i++ % 2 == 0) {
		$class = ' class="altrow"';
	}
?>
	<tr<?php echo $class;?>>
		<td><?php echo $statut['Statut']['id']; ?></td>
		<td><?php echo $html->link($statut['Statut']['nom'], array('action'=>'view', $statut['Statut']['id'])); ?></td>
		<td><?php echo $statut['Statut']['h_statut']; ?></td>
		<td><?php echo $statut['Statut']['h_sup_max']; ?></td>
		<td class="actions">
			<?php echo $html->link(__('View', true), array('action'=>'view', $statut['Statut']['id'])); ?>
			<?php echo $html->link(__('Edit', true), array('action'=>'edit', $statut['Statut']['id'])); ?>
			<?php echo $html->link(__('Delete', true), array('action'=>'delete', $statut['Statut']['id']), null, sprintf(__('Êtes-vous sûr de vouloir supprimer le statut # %s ?', true), $statut['Statut']['id'])); ?>
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
		<li><?php echo $html->link(__('Nouveau Statut', true), array('action'=>'add')); ?></li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Persos', true), array('controller'=> 'persos', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouveau Perso', true), array('controller'=> 'persos', 'action'=>'add')); ?> </li>
	</ul>
</div>
