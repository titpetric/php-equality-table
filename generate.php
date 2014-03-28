<?php

include("vendor/autoload.php");

$vars = array();
$vars[] = true;
$vars[] = false;
$vars[] = 1;
$vars[] = 0;
$vars[] = -1;
$vars[] = "true";
$vars[] = "false";
$vars[] = "1";
$vars[] = "0";
$vars[] = "-1";
$vars[] = "";
$vars[] = null;
$vars[] = array();
$vars[] = array(array());
$vars[] = array(0);
$vars[] = array(1);

$vars2 = array_merge(array(), $vars);

$strict = array();
$loose = array();
$empty = array();

function cleanup($s)
{
	$s = preg_replace("/\s+/", "", $s);
	$s = str_replace("0=>", "", $s);
	$s = str_replace(",", "", $s);
	$s = str_replace("array", "", $s);
	$s = str_replace("(", "[", $s);
	$s = str_replace(")", "]", $s);
	return $s;
}

foreach ($vars as $key => $val) {
	foreach ($vars2 as $k => $v) {
		if ($val === $v) {
			$strict[] = $key.":".$k;
		}
		if ($val == $v) {
			$loose[] = $key.":".$k;
		}
	}
	if (empty($val)) {
		$empty[] = $key;
	}
	$values[$key] = cleanup(var_export($val, true));
}

$extra = compact("empty");

$data = compact("values", "strict", "loose", "extra");

$tpl = new Monotek\MiniTPL\Template;
$tpl->set_paths("./");
$tpl->set_compile_location("/tmp", true);
$tpl->load("index.html.tpl");
$tpl->assign($data);
$contents = $tpl->get();

file_put_contents("index.html", $contents);
