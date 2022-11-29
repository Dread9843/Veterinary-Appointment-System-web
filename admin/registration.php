<!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
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
                <input type="text" class="form-control" name="fullname" id="fullname"  placeholder="Full Name" required autofocus>
            </div>
            <div class="form-group">
                <label>Address</label>
                <input type="text" class="form-control" name="address" id="address" placeholder="Address" required autofocus>
            </div>
            <div class="form-group">
                <label>Phone Number</label>
                <input type="number" class="form-control" name="phone" id="phone" placeholder="Phone Number" required autofocus>
            </div>
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Email Address" required autofocus>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Password" required autofocus>
            </div>
            <button type="submit" class="btn btn-sm btn-success " id="adduser">Sign Up</button>
            <p>Already have an account ? <a href="<?php echo base_url . 'admin/login.php' ?>"><i> Sign In Here</i></a></p>
            <a href="<?php echo base_url ?>">Go to Website</a>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
// Create
$(document).ready(function () {
    $("#adduser").click(function (e) {
        e.preventDefault();
        debugger;
        if ($('#register_frm').valid()) {
           var dataString = $("#register_frm").serialize();
          //  console.log(dataString);
          debugger;
           $.ajax({
               type: "POST",
               url: _base_url_+'classes/Customer.php/index',
               data: dataString,
               success: function (data) {
                // debugger;
                //   console.log(data);
                // alert($data);
              }
          });
       }
   });
});


</script>
<!-- 
<script>
  $('#register_frm').submit(function(e){
		e.preventDefault();
		var _this = $(this)
		
		$.ajax({
			url:_base_url_+'classes/Customer.php?f=save',
			data: new FormData($(this)[0]),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(data){
				// if(resp ==1){
				// 	location.href = './?page=user/list';
				// }else{
				// 	$('#msg').html('<div class="alert alert-danger">Username already exist</div>')
				// 	$("html, body").animate({ scrollTop: 0 }, "fast");
				// }
        console.log(data);
    
			}
		})
	}) -->
</script>

</body>
</html>