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

    public function index()
    {
        echo 'heloo';
    }





}

