<?php
defined("BASEPATH") OR exit("No direct script allowed");

/**
 * Publishers Model
 */
class M_Publishers extends MY_Controller
{
	
	function __construct()
	{
		parent::__construct();	
	}

	function get_active_publishers(){
		$this->db->where('publisher_active', 1);
		$query = $this->db->get('publishers');
		return $query->result();
	}
}