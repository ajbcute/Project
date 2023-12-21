<?php
session_start();
session_destroy();
header("Location:  ../visitorspage.php");
exit();
?>
