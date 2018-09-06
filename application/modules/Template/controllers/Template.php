<?php
(defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Template Module
 */
class Template extends MY_Controller
{
	
	function __construct()
	{
		parent::__construct();
	}

	public function call_admin_template($view_data = NULL){
		$this->load->view('admin_template_v', $view_data);
	}
}