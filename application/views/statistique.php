
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$this->load->helper('url');
foreach($count as $v)
{
    $nombre =  $v->user;
}
foreach($echange as $e)
{
    $count = $e->n;
}    

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ECHANGE</title>
</head>
<body>
<!DOCTYPE html>
<html lang="en">

<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="<?php echo base_url(); ?>assets/img/favicon.ico">

    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/templatemo.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/custom.css">



    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="log">
                Zay
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        
                        <li class="nav-item">
                            <a class="nav-link" href="autre_product">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="my_product">Mon profil</a>
                        </li>
                        <!-- <li class="nav-item">
                            <a class="nav-link" href="publication">Publication</a>
                        </li> -->
                        <?php
                            if($this->session->userdata("admin")==1)
                            {
                        echo "<li class='nav-item'>
                        <a class='nav-link' href='count_user'>ADMIN</a>
                            </li>"; 
                            }
                        ?>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                        <form action="recherche" method="post">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                            </div>
                        </form>

                    </div>
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">0</span>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">0</span>
                        
                    </a>
                </div>
                
            </div>

        </div>
    </nav>
    <section class="bg-success py-5">
        <div class="container">
            <div class="row align-items-center py-5">
                <div class="col-md-8 text-white">
                    <h1>PAGE ADMIN</h1>
                    <h1>Nombre utilisateur : <?php echo $nombre ;?></h1>
                    <p>
                        Nombre des echange effectuer : <?php echo $count ;?>
                    </p>
                </div>
                <div class="col-md-4">
                    <img src="<?php echo base_url(); ?><?php echo $this->session->userdata('pdp') ;?>" width="200px" alt="About Hero">
                </div>
            </div>
        </div>
    </section>
