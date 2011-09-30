<div class="statuts view">
<h2><?php  __('Statut');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $statut['Statut']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Nom'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $statut['Statut']['nom']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('H Statut'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $statut['Statut']['h_statut']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('H Sup Max'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $statut['Statut']['h_sup_max']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Editer Statut', true), array('action'=>'edit', $statut['Statut']['id'])); ?> </li>
		<li><?php echo $html->link(__('Lister Statuts', true), array('action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouveau Statut', true), array('action'=>'add')); ?> </li>
		<li><?php echo $html->link(__('Supprimer Statut', true), array('action'=>'delete', $statut['Statut']['id']), null, sprintf(__('Êtes-vous sûr de vouloir supprimer le statut # %s ?', true), $statut['Statut']['id'])); ?> </li>
	</ul>
	<ul>
		<li><?php echo $html->link(__('Lister Persos', true), array('controller'=> 'persos', 'action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouveau Perso', true), array('controller'=> 'persos', 'action'=>'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php __('Personnels ayant ce statut');?></h3>
	<?php if (!empty($statut['Perso'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Initiales'); ?></th>
		<th><?php __('Nom'); ?></th>
		<th><?php __('Prenom'); ?></th>
		<th><?php __('Permanent'); ?></th>
		<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
		$i = 1;
		foreach ($statut['Perso'] as $perso):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $perso['id'];?></td>
			<td><?php echo $html->link($perso['initiales'], array('controller'=> 'persos', 'action'=>'view', $perso['id'])); ?></td>
			<td><?php echo $html->link(strtoupper($perso['nom']), array('controller'=> 'persos', 'action'=>'view', $perso['id'])); ?></td>
			<td><?php echo $html->link($perso['prenom'], array('controller'=> 'persos', 'action'=>'view', $perso['id'])); ?></td>
			<td><?php echo $boolean->yes_no($perso['permanent']);?></td>
			<td class="actions">
				<?php echo $html->link(__('View', true), array('controller'=> 'persos', 'action'=>'view', $perso['id'])); ?>
				<?php echo $html->link(__('Edit', true), array('controller'=> 'persos', 'action'=>'edit', $perso['id'])); ?>
				<?php echo $html->link(__('Delete', true), array('controller'=> 'persos', 'action'=>'delete', $perso['id']), null, sprintf(__('Êtes-vous sûr de vouloir supprimer le personnel # %s ?', true), $perso['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $html->link(__('Nouveau Perso', true), array('controller'=> 'persos', 'action'=>'add'));?> </li>
		</ul>
	</div>
</div>
