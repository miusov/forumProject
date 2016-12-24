<?php

$this->load->view('header');

echo '<div class="row col-md-12">';
echo '<div class="left col-md-2">';
echo '<ul>';
foreach($items as $i)
{
	echo '<li>'.$i['category'].'</li>';
}
echo '</ul>';
echo '</div>';
echo '<div class="right col-md-10">';
if (isset($map)) {
	echo $map['js'];
	echo $map['html'];
}
echo '</div>';
echo '</div>';

$this->load->view('footer');
