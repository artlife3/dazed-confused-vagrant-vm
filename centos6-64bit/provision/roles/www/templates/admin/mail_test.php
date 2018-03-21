<?php

$to = (empty($_REQUEST['to'])) ? "to@local.com" : $_REQUEST['to'];
$from = (empty($_REQUEST['from'])) ? "to@local.com" : $_REQUEST['from'];
$subject = (empty($_REQUEST['subject'])) ? "TEST SUBJECT" : $_REQUEST['subject'];
$body = (empty($_REQUEST['body'])) ? "TEST BODY\nTEST BODY\n" : $_REQUEST['body'];

if($_REQUEST){
mb_language("ja");
mb_internal_encoding("UTF-8");
$result =mb_send_mail($to,$subject,$body,"From:".$from);
echo "t"
;}

?>

<html lang="ja">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Send mail test</title>

<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css" media="screen, projection" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>　
</head>
<body>
<div class="container-fluid hero-unit">
	<header class="page-header">
	  <h1>Send mail test</h1>
	</header>

<style type="text/css">
INPUT {
	height: 3em !important;
}
</style>
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">

<div class="container">
<?php if($_REQUEST){ ?>
<?php if($result){ ?>
<div class="alert alert-success">
  <strong>Success!</strong> Mail was able to be sent.
</div>
<?php }else{ ?>
<div class="alert alert-danger">
  <strong>Failed</strong>Mail could not be sent.
</div>
<?php } ?>
<?php } ?>

<div class="well span8">
  <div class="row">
    	<div class="span3">
			<label>From:</label>
			<input type="text" id="from" name="from" class="span3" placeholder="From address" value="<?php echo $from;?>">
			<label>To:</label>
			<input type="text" id="to" name="to" class="span3" placeholder="To address" value="<?php echo $to;?>">
		</div>
		<div class="span5">
			<label>Subject:</label>
			<input type="text" id="subject" name="subject" class="span5" placeholder="Email subject" value="<?php echo $subject;?>">
			<label>Body</label>
			<textarea name="body" id="body" class="input-xlarge span5" rows="10"><?php echo $body;?></textarea>
		</div>
	
		<button type="submit" class="btn btn-primary pull-right">Send mail</button>
	</div>
</div>
</div>

</form>

	<footer></footrer>
</div><!--.container-fluid hero-unit-->

</body>
</html>