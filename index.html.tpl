<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>JS Comparison Table</title>
	<link rel="stylesheet" href="index.css" type="text/css" media="all" title="simple" charset="utf-8">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	
<!--    Inspired by this post:
	    http://blog.codekills.net/archives/89-Equality-in-JavaScript.html

	    2013-Nov-11. Correcting issue where "[]===[]" was incorrectly marked as true.
-->
</head>
<body>
	<div id="content">
		<h3>Equality in PHP</h3>
		<div id="table">

{eval $keys = array_keys($values);}
<table class="comparisons">
<tr class="header">
	<td>&nbsp;</td>
	{foreach $values as $value}
	<td><span class="rotate">{value|escape}</span></td>
	{/foreach}
	{foreach $extra as $name => $extra_keys}
	<td class="extra"><span class="rotate">{name}</span></td>
	{/foreach}

</tr>
{foreach $values as $key => $value}
<tr>
	<td class="row header true">{value|escape}</td>
	{foreach $keys as $k}
		{if in_array($k . ":" . $key, $strict, true)}
		<td class="cell strict-equality"><div>=</div></td>
		{elseif in_array($k . ":" . $key, $loose, true)}
		<td class="cell loose-equality"><div>&#8773;</div></td>
		{else}
		<td class="cell no-equality"><div>&#8800;</div></td>
		{/if}
	{/foreach}
	{foreach $extra as $name => $extra_keys}
		{if in_array($key, $extra_keys)}
		<td class="cell strict-equality"><div>=</div></td>
		{else}
		<td class="cell no-equality"><div>&#8800;</div></td>
		{/if}
	{/foreach}
</tr>
{/foreach}
{foreach $extra as $name => $extra_keys}
<tr>
	<td class="row header true extra">{name|escape}</td>
	{foreach $values as $keyval => $value}
		{if in_array($keyval, $extra_keys)}
		<td class="cell strict-equality"><div>=</div></td>
		{else}
		<td class="cell no-equality"><div>&#8800;</div></td>
		{/if}
	{/foreach}
	{foreach $extra as $extra_keys}
	<td class="cell extra">&nbsp;</td>
	{/foreach}
</tr>
{/foreach}
</table>

		</div>
		<div id="key">
<table class="key comparisons"><tbody><tr><td class="no-eq cell"><div>≠</div></td><td class="no-eq label">Not equal</td></tr><tr><td class="loose-equality cell"><div>≅</div></td><td class="loose-equality label">Loose equality<p class="desc">Often gives "false" positives like "1" is true; [] is "0"</p></td></tr><tr><td class="strict-equality cell"><div>=</div></td><td class="strict-equality label">Strict equality<p class="desc">Mostly evaluates as one would expect.</p></td></tr></tbody></table>
</div>
		<br style="clear:both">
	</div>

    <!-- fork link -->
    <a href="https://github.com/titpetric/php-equality-table/"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/38ef81f8aca64bb9a64448d0d70f1308ef5341ab/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6461726b626c75655f3132313632312e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"></a>
</body>
</html>
