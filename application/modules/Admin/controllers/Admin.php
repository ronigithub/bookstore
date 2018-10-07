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
		$this->load->module(array(
			'Books'
		));

	}

	function index(){
		$data['page_header'] = "Home";
		$data['description']  = "List of all books";
		$this->template->call_admin_template($data);
	}

	function books(){
		$this->books->display_books();
	}

	function addBook(){
		$this->books->addBook();
	}
}