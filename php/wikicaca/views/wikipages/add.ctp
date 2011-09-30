<div class="wikipages form">
<?php echo $form->create('Wikipage');?>
	<fieldset>
 		<legend><?php __('Add Wikipage');?></legend>
	<?php
		echo $form->input('name');
		echo $form->input('body');
	?>
	</fieldset>
<?php echo $form->end('Submit');?>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('List Wikipages', true), array('action' => 'index'));?></li>
	</ul>
</div>
