<?php 

class Locations extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('locations_model');
	}

	function index()
	{
		$items=$this->locations_model->getCat();
		$data['items']=$items;
		$data['map']=$this->showMap();
		$this->load->view('main_page', $data);

	}

	function showMap()
	{
		$this->load->library('googlemaps');
		$config['center']='47.5512, 35.0811';
		$config['zoom']='auto';
		$this->googlemaps->initialize($config);

		$markers=array();
		$markers['position']='47.5512, 35.0811';
		$this->googlemaps->add_marker($markers);
		$map=$this->googlemaps->create_map();
		return $map;
	}
}
