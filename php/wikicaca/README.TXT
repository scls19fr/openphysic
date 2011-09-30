WikiCaca est un wiki minimaliste basé sur CakePHP.

Lexer
=====

<	T_LOWER_THAN
>	T_GREATER_THAN
<<	T_FLOATBOX_LEFT
>>	T_FLOATBOX_RIGHT
::c::	T_CLEAR_FLOATED_BOX
#%	T_KEYBOARD
** T_BOLD
// T_ITALIC
__ T_UNDERLINE
## T_MONOSPACE
'' T_NOTES
++ T_STRIKETHROUGH
&pound;&pound;	T_ADDITIONS
&yen;&yen;	T_DELETIONS
@@	T_CENTER
/^([a-z]+:\/\/\S+?)([^[:alnum:]^\/])?$/	T_URL
==	T_HEADER_LEVEL_5
===	T_HEADER_LEVEL_4
====	T_HEADER_LEVEL_3
=====	T_HEADER_LEVEL_2
=====	T_HEADER_LEVEL_1
---	T_FORCED_LINE_BREAK
\n	T_EOL


Parser
======
