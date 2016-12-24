<?php

class Locations_model extends CI_Model
{
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	function getCat()
	{
		$res=$this->db->get('categories');
		$cats=$res->result_array();
		return $cats;
	}
}