<?php
    error_reporting(0);
  include "connect.php";
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>SQL Injection Demo</title>
    <link rel="stylesheet" href="assets/bootstrap.min.css">
    <style>
        header {
            background-color: #818181;
            height: 50vh;
            display: flex;
            align-items: center;
        }
    </style>
</head>

<body>
    <header class="text-center text-white">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 mx-auto position-relative">
                    <h1 class="mb-5">Search what you want to search</h1>
                </div>
                <div class="col-md-10 col-lg-8 col-xl-7 mx-auto position-relative">
                    <form method="get" action="">
                        <div class="row">
                            <div class="col-12 col-md-9 mb-2 mb-md-0">
                                <input class="form-control form-control-lg" type="text" name="id"
                                    placeholder="Enter your id to start">
                            </div>
                            <div class="col-12 col-md-3">
                                <button class="btn btn-primary btn-lg" type="submit">RUN!</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </header>
    


<section class="text-center bg-light features-icons">
    <div class="container">
        <div class="row">
            <div class="col-md-6"> 
                <h5>Key Source</h5>
                <pre><?php highlight_file("./assets/source") ?></pre>
            </div>
            <div class="col-md-6"> 
                <?php
                
                $sql = "SELECT username,password FROM users WHERE id = ".$_GET["id"];
                echo "<h5>Executed Operations:</h5>"
                    .$sql
                    ."<br><br>";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                        print_r(mysqli_fetch_all($result, MYSQLI_ASSOC));
                } else {
                    echo "0 results";
                }
                ?>
            </div>
        </div>
    </div>
</section>

<section class="text-center bg-light features-icons">
    <div class="container">
        <h3>Created by CTF-Archives</h3>
        <h4>
        <pre>

      ____ _____ _____       _             _     _                
     / ___|_   _|  ___|     / \   _ __ ___| |__ (_)_   _____  ___ 
    | |     | | | |_ _____ / _ \ | '__/ __| '_ \| \ \ / / _ \/ __|
    | |___  | | |  _|_____/ ___ \| | | (__| | | | |\ V /  __/\__ \
     \____| |_| |_|      /_/   \_\_|  \___|_| |_|_| \_/ \___||___/


        </pre><h4>
        <h3> Webshell is in /shell.php ,Key is "cmd"</h3>
    </div>

</section>


</body>

</html>
