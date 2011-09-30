<div class="wikipages form">
<?php echo $form->create('Wikipage');?>
	<fieldset>
 		<legend><?php __('Edit Wikipage');?></legend>
	<?php
		echo $form->input('id');
		echo $form->input('name');
		echo $form->input('body');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Delete', true), array('action' => 'delete', $form->value('Wikipage.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $form->value('Wikipage.id'))); ?></li>
		<li><?php echo $html->link(__('List Wikipages', true), array('action' => 'index'));?></li>
	</ul>
</div>
