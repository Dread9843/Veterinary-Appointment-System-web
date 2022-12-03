<!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
<body class="hold-transition ">
  <style>
    html, body{
      height:calc(100%) !important;
      width:calc(100%) !important;
    }
    
    .otp-title{
      text-shadow: 2px 2px black
    }
    #otp{
      flex-direction:column !important
    }
    #logo-img{
        height:150px;
        width:150px;
        object-fit:scale-down;
        object-position:center center;
        border-radius:100%;
    }
    #otp .col-7,#otp .col-5{
      width: 100% !important;
      max-width:unset !important
    }
  </style>

  <div class="h-100 d-flex align-items-center w-100" id="otp">
    <div class="col-5 h-100 bg-gradient">
      <div class="d-flex w-100 h-100 justify-content-center align-items-center">
        <div class="card col-sm-12 col-md-6 col-lg-6 card-outline rounded-2 shadow border border-success" style="margin-top: 20px;">
          <div class="card-header rounded-0">
            <h5 class="text-purle text-center"><b>We've sent a verification code to your email.<small>Please enter OTP to verify</small> </b></h5>
          </div>
          <div class="card-body rounded-0">
          <div id="msg"></div>
          <form id="otp_frm" action="">
          <input type="hidden" name="id">
            <div class="form-group">
                <label>Enter OTP</label>
                <input type="text" class="form-control" name="otp" id="otp"  placeholder="OTP" required autofocus>
            </div>
            <button type="submit" class="btn btn-sm btn-success ">Verify</button>
            <a href="<?php echo base_url ?>">Go to Website</a>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>



</body>
</html>