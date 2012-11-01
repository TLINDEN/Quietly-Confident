[% USE date %]
<!DOCTYPE html>
<html lang="de">
  <!-- source: http://bootswatch.com/slate/ -->
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <title>[% title %]</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="TLINDEN">
    <meta name="keywords" content="[% keywords %]">
    <meta name="description" content="[% description %]">

    <link href="[% config.baseuri %]/css/bootstrap.min.css" rel="stylesheet">
    <link href="[% config.baseuri %]/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="[% config.baseuri %]/css/local.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!-- Javascript files are disabled in the default template. enable them by removing the comment, if you need it -->
    <!--[if lt IE 9]>
      <script src="[% config.baseuri %]/js/html5.js"></script>
    <![endif]-->
    <script src="[% config.baseuri %]/js/jquery.js"></script>
    <script src="[% config.baseuri %]/js/bootstrap.js"></script>
   [% PROCESS header %]
  </head>

<body>

<div class="container">

<div class="row-fluid">
  <div class="span12" style="padding-bottom: 10px">&nbsp;</div>
</div>
<div class="row-fluid">
  <div class="span1"></div>
  <div class="span10">
   <div class="well">
    <div class="row-fluid">
      <div class="span12" style="padding-bottom: 10px">
        <a href="[% config.baseuri %]"><h1>[% config.sitetitle %]</a>
      </div>
    </div>
    <div class="row-fluid">
      <div class="span2">
        <ul class="nav nav-list">
            <li><a href="[% config.baseuri %]">Home</a></li>
            [% FOREACH item IN menu.root %]
                 <li><a href="[% config.baseuri %][% item.href %]">[% item.cap %]</a>
                 [% IF level > 1 && item.href == basepath %]
                       <ul class="nav nav-list">
                         [% FOREACH item IN menu.$basepath %]
                            <li><a href="[% config.baseuri %][% item.href %]">[% item.cap %]</a></li>
                         [% END %]
                       </ul>
                 [% END %]
                 </li>
            [% END %]
        </ul>
      </div>
      <div class="span10">
         [% PROCESS main %]
      </div>
    </div>
      <hr>
      <footer>
        <p>&nbsp;&nbsp;&copy; [% config.sitetitle %]
         | <a href="[% config.baseuri %]about.html">About</a>
	 | <a href="http://www.daemon.de/QuietlyConfident">Maintained using <b>Quietly Confident</b></a>
	 | <a href="#top">&uarr; top</a>
        </p>
      </footer>
    </div>
  </div>
  <div class="span1"></div>
</div>


</div><!--/.fluid-container-->

  </body>
</html>
