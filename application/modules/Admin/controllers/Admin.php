<?php
defined("BASEPATH") OR exit("No direct script allowed");

/**
 * Admin
 */
class Admin extends MY_Controller
{
	
	function __construct()
	{
		parent::__construct();

	}

	function index(){
		$this->template->call_admin_template();
	}
}