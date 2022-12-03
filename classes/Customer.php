<?php
require_once('../config.php');

Class Customer extends DBConnection {
	private $settings;
	public function __construct(){
		global $_settings;
		$this->settings = $_settings;
		parent::__construct();
	}
	public function __destruct(){
		parent::__destruct();
	}

	function create_user()
	{
		extract($_POST);
		$oid = $id;
		$postdata = array();
		$postdata['fullname'] = $_POST['fullname'];
		$postdata['address'] = $_POST['address'];
		$postdata['phone'] = $_POST['phone'];
		$postdata['email'] = $_POST['email'];
		
		$password = $_POST['password'];
		$postdata['password'] = password_hash($password, PASSWORD_DEFAULT);
		$postdata['type'] = '3';
		$postdata['user_status'] = 'unverified';
		//generate otp
		$otp = rand(999999, 111111);

		$count_email =  $this->conn->query("SELECT * from users where email = '{$_POST['email']}'".($id>0? " and id!= '{$id}' " : ""))->num_rows;
	
		if ($count_email > 0) {
			return 3;
			exit;
		
		}
		if(empty($id))
		{
			$qry = $this->conn->query("INSERT INTO users (fullname,address,phone,email,password,type,user_status,otp) values ('{$postdata['fullname']}','{$postdata['address']}','{$postdata['phone']}','{$postdata['email']}','{$postdata['password']}','{$postdata['type']}','{$postdata['user_status']}','$otp')");

			if($qry)
			{
				$email = $_POST['email'];
				$email = $email;
				$fromEmail = "anjalifyp2022@gmail.com";
				$subject = "One Time Password";
    			$message = "Your OTP verification code is $otp";
		
				$to = $email;
    			$subject = $subject;
				$message = $message;

				$result = mail($to,$subject,$message);
				
				if($result)
				{
					// echo '<script>alert("Mail sent successfully !")</script>';
					print_r('success');
					// exit();
				
			
				}
				else
				{
					// echo '<script>alert("Mail could not be send !")</script>';
					print_r('error');
					// exit();
				}
				
				
				
			}
		}
        // if(isset($resp['msg']))
		// $this->settings->set_flashdata('success',$resp['msg']);
		// return  $resp['status'];
    }



}

$Customer = new Customer();
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$sysset = new SystemSettings();
switch ($action) {
	case 'create_user':
		echo $Customer->create_user();
	break;
	default:
		// echo $sysset->index();
	break;
}

