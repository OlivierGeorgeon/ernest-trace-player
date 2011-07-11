<?php 

if(isset($_REQUEST['transformationId']) and $transformationId = filter_lnd($_REQUEST['transformationId']) /*and $_SESSION['firstload']*/
	and ! @(current(file(DATA_DIR . '/loaded_transformation')) === $transformationId) )
{
	$ret1 = null;
	system("cp -rf ". TRANSFO_PUB_DIR . '/' . $transformationId . '/* ' . DATA_DIR . '/' , $ret1);
	touch(DATA_DIR . '/loaded_transformation');
	file_put_contents(DATA_DIR . '/loaded_transformation', $transformationId);
}
?>