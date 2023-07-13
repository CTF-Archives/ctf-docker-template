<?php
    error_reporting(0);
  include "connect.php";
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>狠狠的注入涅~</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic&amp;display=swap">
</head>

<body>
    <header class="text-center text-white masthead"
        style="background:url('https://www.dmoe.cc/random.php')no-repeat center center;background-size:cover;">
        <div class="overlay"></div>
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
                                <button class="btn btn-primary btn-lg" type="submit">姨妈大！</button>
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
                <pre><?php highlight_file(source) ?></pre>
            </div>
            <div class="col-md-6"> 
                <?php
                
                $sql = "SELECT username,password FROM users WHERE id = ".'(((((('.$_GET["id"].'))))))';
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



    <section class="showcase">
        <div class="container-fluid p-0">
            <div class="row g-0"></div>
        </div>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>


