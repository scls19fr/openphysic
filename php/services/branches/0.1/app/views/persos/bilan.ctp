<div style="text-align: center;">
<?php echo $html->link(
	$html->image('print.jpg', array('alt'=> __("Imprimer", true), 'border'=>"0")),
	array('action'=>'bilanPdf'),
	null, null, false
);?>
<br/>
<?php echo $html->link(
	"Imprimer",
	array('action'=>'bilanPdf'),
	null, null, false
);?>
</div>

<?php foreach ($persos as $key=>$perso): ?>

<div>

<div class="persos view">
<h2><?php  __('Bilan de service prévisionnel');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $perso['Perso']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Initiales'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $perso['Perso']['initiales']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Nom'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link(strtoupper($perso['Perso']['nom']), array('action'=>'view', $perso['Perso']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Prenom'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $perso['Perso']['prenom']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Statut'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $html->link($perso['Statut']['nom'], array('controller'=> 'statuts', 'action'=>'view', $perso['Statut']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Permanent'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $boolean->yes_no( $perso['Perso']['permanent'] ); ?>
			&nbsp;
		</dd>
	</dl>
</div>

<?php //$matieres_persos=$perso['MatieresPerso']; ?>

<div class="related">
	<h3><?php __('Service de ce personnel');?></h3>
	<?php if (!empty($perso['MatieresPerso'])):?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php __('Id'); ?></th>
		<th><?php __('Filière'); ?></th>		
		<th><?php __('Matière'); ?></th>
		<th width="16%"><?php __('H Cours'); ?></th>
		<th width="16%"><?php __('H Td'); ?></th>
		<th width="16%"><?php __('H Tp'); ?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($perso['MatieresPerso'] as $matierePerso):
			$class = null;
			if ($i++ % 2 == 0) {
				$class = ' class="altrow"';
			}
		?>
		<tr<?php echo $class;?>>
			<td><?php echo $matierePerso['id'];?></td>
			<td><?php echo $html->link($matierePerso['Matiere']['Filiere']['name'], array('controller'=>'filieres', 'action'=>'view', $matierePerso['Matiere']['Matiere']['filiere_id'])); ?></td>
			<td><?php echo $html->link($matierePerso['Matiere']['Matiere']['name'], array('controller'=>'matieres', 'action'=>'view', $matierePerso['Matiere']['Matiere']['id'])); ?></td>
			<td><?php echo $matierePerso['h_cours'];?></td>
			<td><?php echo $matierePerso['h_td'];?></td>
			<td><?php echo $matierePerso['h_tp'];?></td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

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
		<tr>
			<th>attribué</th>
			<td><?php echo $perso['BilanService']['h_cours']; ?></td>
			<td><?php echo $perso['BilanService']['h_td']; ?></td>
			<td><?php echo $perso['BilanService']['h_tp']; ?></td>
			<td>&nbsp;</td>
			<td><?php echo $heures->h_tot($perso['BilanService']); ?></td>
			<td><?php echo $heures->h_eq_td($perso['BilanService']); ?></td>
		</tr>
		</table>
</div>

</div>

<div style="page-break-before: always;">&nbsp;</div>
<hr />

<?php endforeach; ?>