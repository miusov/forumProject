<?php 

class Locations extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('locations_model');
	}

	function index($id=1)
	{
		$items=$this->locations_model->getPlaces();
		$data['items']=$items;
		$data['map']=$this->showMap();
		$this->load->view('main_page', $data);

	}

	function showPlace($id)
	{
		$items=$this->locations_model->getPlaces();
		$data['items']=$items;
		$item=$this->locations_model->getPlaceById($id);
		$data['item']=$item;
		$data['map']=$this->showPlaceMap($item[0]['lat'],$item[0]['lng']);
		$this->load->view('place_info',$data);
	}

	function getMessages()
	{
		$items=$this->locations_model->get20Messages();
		$this->load->library('table');
		$style=array('table_open'=>'<table class="table table-striped">');
		$this->table->set_template($style);
		echo $this->table->generate($items);
	}

	function showPlaceMap($lat, $lng)
	{
		$this->load->library('googlemaps');
		$config['center']=$lat.', '.$lng;
		$config['zoom']='17';
		$this->googlemaps->initialize($config);

		$markers=array();
		$markers['position']=$lat.', '.$lng;
		$this->googlemaps->add_marker($markers);
		$map=$this->googlemaps->create_map();
		return $map;
	}

	function showMap()
	{
		$this->load->library('googlemaps');
		$config['center']='47.841021, 35.135041';
		$config['zoom']='14';
		$this->googlemaps->initialize($config);

		$markers=array();
		$markers['position']='47.841050, 35.135041';
		$this->googlemaps->add_marker($markers);
		$map=$this->googlemaps->create_map();
		return $map;
	}

	function sendMessage($msg){
		$this->locations_model->sendMessage($msg);
	}
}
