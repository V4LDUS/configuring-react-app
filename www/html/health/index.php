<?php
    //header("Access-Control-Allow-Origin: *");
    $data = array("msg" => "healthy");
    header("Content-Type: application/json");
    echo json_encode($data);
?>