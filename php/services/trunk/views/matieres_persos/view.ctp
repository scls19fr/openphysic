<div class="matieresPersos view">
<h2><?php  __('Occupation');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $matieresPerso['MatieresPerso']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Perso'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link("({$matieresPerso['Perso']['initiales']}) {$matieresPerso['Perso']['nom']} {$matieresPerso['Perso']['prenom']}", array('controller'=> 'persos', 'action'=>'view', $matieresPerso['Perso']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Matiere'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link($matieresPerso['Matiere']['name'], array('controller'=> 'matieres', 'action'=>'view', $matieresPerso['Matiere']['id'])); ?>
			&nbsp;
		</dd>
		
		<table cellpadding = "0" cellspacing = "0">
		<tr>
			<th width="16%">&nbsp;</th>
			<th width="16%">H Cours</th>
			<th width="16%">H Td</th>
			<th width="16%">H Tp</th>
		</tr>
		<tr>
			<th>attribu&eacute;</th>		
			<td><?php echo $matieresPerso['MatieresPerso']['h_cours']; ?></td>
			<td><?php echo $matieresPerso['MatieresPerso']['h_td']; ?></td>
			<td><?php echo $matieresPerso['MatieresPerso']['h_tp']; ?></td>
		</tr>
		</table>
		
		<!--
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('H Cours'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $matieresPerso['MatieresPerso']['h_cours']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('H Td'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $matieresPerso['MatieresPerso']['h_td']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('H Tp'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $matieresPerso['MatieresPerso']['h_tp']; ?>
			&nbsp;
		</dd>
		-->
		
		
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Editer Occupation', true), array('action'=>'edit', $matieresPerso['MatieresPerso']['id'])); ?> </li>
		<li><?php echo $html->link(__('Lister Occupations', true), array('action'=>'index')); ?> </li>
		<li><?php echo $html->link(__('Nouvelle Occupation', true), array('action'=>'add')); ?> </li>
		<li><?php echo $html->link(__('Supprimer Occupation', true), array('action'=>'delete', $matieresPerso['MatieresPerso']['id']), null, sprintf(__('Êtes-vous sûr de vouloir supprimer l\'occupation # %s ?', true), $matieresPerso['MatieresPerso']['id'])); ?> </li>
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
