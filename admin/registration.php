<?php require_once '../config.php'?>
<!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
<?php require_once './dashboard/header.php'?>
<body class="hold-transition ">
  <style>
    html, body{
      height:calc(100%) !important;
      width:calc(100%) !important;
    }
    body{
      background-image: url("<?php echo validate_image($_settings->info('cover')) ?>");
      background-size:cover;
      background-repeat:no-repeat;
    }
    .register-title{
      text-shadow: 2px 2px black
    }
    #register{
      flex-direction:column !important
    }
    #logo-img{
        height:150px;
        width:150px;
        object-fit:scale-down;
        object-position:center center;
        border-radius:100%;
    }
    #register .col-7,#register .col-5{
      width: 100% !important;
      max-width:unset !important
    }
  </style>
  <div class="h-100 d-flex align-items-center w-100" id="register">
    <div class="col-5 h-100 bg-gradient">
      <div class="d-flex w-100 h-100 justify-content-center align-items-center">
        <div class="card col-sm-12 col-md-6 col-lg-6 card-outline rounded-2 shadow border border-success" style="margin-top: 20px;">
          <div class="card-header rounded-0">
            <h5 class="text-purle text-center"><b>Registration</b></h5>
          </div>
          <div class="card-body rounded-0">
          <form id="register_frm" action="" method="post">
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" class="form-control" name="name" placeholder="Full Name" required autofocus>
            </div>
            <div class="form-group">
                <label>Address</label>
                <input type="text" class="form-control" name="address" placeholder="Address" required autofocus>
            </div>
            <div class="form-group">
                <label>Phone Number</label>
                <input type="number" class="form-control" name="phone" placeholder="Phone Number" required autofocus>
            </div>
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" class="form-control" name="email" placeholder="Email Address" required autofocus>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" placeholder="Password" required autofocus>
            </div>
            <button type="submit" class="btn btn-sm btn-success ">Sign Up</button>
            <p>Already have an account ? <a href="<?php echo base_url . 'admin/login.php' ?>"><i> Sign In Here</i></a></p>
            <a href="<?php echo base_url ?>">Go to Website</a>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

</body>
</html>