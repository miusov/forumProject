<?php

$this->load->view('header');	
echo "<div class='row'>";
echo "<div class='col-md-2'>";
echo '<ul>';
foreach ($items as $i) {
	echo '<li>';
	$href=site_url("locations/showPlace/".$i['id']);
	echo '<a href="'.$href.'">'.$i['title'].'</a>';
	echo '</li>';
}
echo '</ul>';

echo "</div>";
echo "<div class='col-md-10'>";
echo $map['js'];
echo $map['html'];
echo "</div>";
echo "</div>";

$this->load->view('footer');
