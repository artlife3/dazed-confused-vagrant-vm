<?php
$site_name = "{{ site_name}}";
$DirectoryLink = new DirectoryLink();

class DirectoryLink{
  private $excludes = array(
    '.',
    '..',
  );
  private $dirs = array();
  private $path = "";
  private $relative_path = '';

  function __construct($path=__DIR__){
    $this->path = $path."/";
    $this->setDirectoryList();
  }
  /**
   * Sets the directory list.
   *
   * @param      <type>  $path   The path
   */
  function setDirectoryList(){
    $this->dirs = scandir($this->path);
  }
  /**
   * { function_description }
   *
   * @return     <type>  ( description_of_the_return_value )
   */
  function displayDirectory(){
    $return = '<ul>'."\n";
//    $return.= '<li><h4><a href="' . $this->relative_path . 'index.php" target="_blank">Home</a></h4></li>'."\n";
    foreach ($this->dirs AS $dir) {

      if( $this->__checkExcludes($dir) ) {

        if ((is_dir($this->path."/".$dir) === true)) {
            $return.= '<li><h4>';
            $return.= '<a href="' . $this->relative_path . $dir . '">';
            $return.= $dir;
            $return.= '</a></h4></li>'."\n";
        }

      }

    }
    $return.= '</ul>'."\n";
    return $return;
  }
  /**
   * 特定のディレクトリの場合はFALSE
   *
   * @param      <type>  $dir    The dir
   *
   * @return     <type>  ( description_of_the_return_value )
   */
  function __checkExcludes($dir){
    if (in_array($dir, $this->excludes)) {
        return FALSE;
    }
    return TRUE;
  }
}
?>
<html lang="ja">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $site_name;?></title>

<link rel="stylesheet" type="text/css" href="./admin//bootstrap/css/bootstrap.min.css" media="screen, projection" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="./admin/bootstrap/js/bootstrap.min.js"></script>　
<style>
.hero-unit{
  padding: 0 60px 60px 60px;
}
.content-secondary li a{
	text-transform: uppercase;
}
</style>
</head>
<body class="container-fluid hero-unit">
<div>
<header class="page-header">
  <h1><?php echo $site_name;?></h1>
</header>
<div class="wrapper row-fluid">

<article class="content-secondary">
  <header>
    <h2>Sites contents</h2>
    <p>Automatically add</p>
  </header>
  <?php echo $DirectoryLink->displayDirectory();?>
</article>
</div>
<footer>
</footrer>
</div>
</html>
