<div class="wikipages view">
<?php echo $wikipage['Wikipage']['bodyRendered']; ?>
</div>


<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Edit Wikipage', true), array('action' => 'edit', $wikipage['Wikipage']['id'])); ?> </li>
		<li><?php echo $html->link(__('Delete Wikipage', true), array('action' => 'delete', $wikipage['Wikipage']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $wikipage['Wikipage']['id'])); ?> </li>
		<li><?php echo $html->link(__('List Wikipages', true), array('action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Wikipage', true), array('action' => 'add')); ?> </li>
	</ul>
</div>
