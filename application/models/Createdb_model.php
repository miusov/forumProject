<?php 

class Createdb_model extends CI_Model
{
	function __construct()
	{
		$this->load->database();
	}

	function createTable($query)
	{
		$this->db->query($query);
	}
}
