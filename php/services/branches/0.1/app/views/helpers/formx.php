<?php

class FormxHelper extends AppHelper {

	var $helpers = array('Html', 'Form');
	
/**
 * Creates a text output widget.
 *
 * @param string $fieldName Name of a field, in the form "Modelname.fieldname"
 * @param array  $options Array of HTML attributes.
 * @return string An HTML text input element
 */
	function text($fieldName, $options = array()) {
		$options = $this->_initInputField($fieldName, array_merge(
			array('type' => 'text'), $options
		));
		//debug($options['name']);
		//debug(${'this->'.$options['name']});
		//$out="this->data['User']['username']";
		//return ${$out};
		return $this->data['User']['username'];
		//return "yoyo";
	}

/**
 * Generates a form ouput element complete with label and wrapper div (only for text !)
 *
 * @param string $fieldName This should be "Modelname.fieldname"
 * @param array $options Each type of input takes different options.
 * @return string Completed form widget
 */
	function output($fieldName, $options = array()) {
		$view =& ClassRegistry::getObject('view');
		$this->setEntity($fieldName);
		$entity = join('.', $view->entity());
		
		$defaults = array('before' => null, 'between' => null, 'after' => null);
		$options = array_merge($defaults, $options);
		
		$out = '';
		$type = "text";
		$labelText = null;
		$labelAttributes = null;
		
		/*
		$out = $this->Form->label($fieldName, $labelText, $labelAttributes);
		$before = '';
		$between = '';
		$out = $before . $out . $between . $this->{$type}($fieldName, $options);
		*/
		
		$out = "<dl>
			<dt>{$this->Form->label($fieldName, $labelText, $labelAttributes)}</dt>
			<dd>
				{$this->{$type}($fieldName, $options)}
				&nbsp;
			</dd>
		</dl>";
		
		return $out;
	}

}
?>
