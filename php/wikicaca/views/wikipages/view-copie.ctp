<div class="wikipages view">
<h2><?php  __('Wikipage');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $wikipage['Wikipage']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Name'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $wikipage['Wikipage']['name']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Body'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $wikipage['Wikipage']['body']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Created'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $wikipage['Wikipage']['created']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Modified'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $wikipage['Wikipage']['modified']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<ul>
		<li><?php echo $html->link(__('Edit Wikipage', true), array('action' => 'edit', $wikipage['Wikipage']['id'])); ?> </li>
		<li><?php echo $html->link(__('Delete Wikipage', true), array('action' => 'delete', $wikipage['Wikipage']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $wikipage['Wikipage']['id'])); ?> </li>
		<li><?php echo $html->link(__('List Wikipages', true), array('action' => 'index')); ?> </li>
		<li><?php echo $html->link(__('New Wikipage', true), array('action' => 'add')); ?> </li>
	</ul>
</div>
