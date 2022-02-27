<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Max-Age: 3600");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

    include_once '../config/database.php';
    include_once '../class/employees.php';

    $database = new Database();
    $db = $database->getConnection();

    $item = new Employee($db);

    $data = json_decode(file_get_contents("php://input"));
  
    
    $item->id_reservations = $data->id_reservations;
    $item->id_users = $data->id_users;
    $item->lugar_inicio = $data->lugar_inicio;
    $item->lugar_destino = $data->lugar_destino;
    $item->cupos = $data->cupos;
    $item->id_drivers = $data->id_drivers;
    $item->censo_drivers = $data->censo_drivers;
    $item->placa_drivers = $data->placa_drivers;
    $item->fecha = date('Y-m-d H:i:s'); 
    if($item->deleteEmployee()){
        echo 'delete successfully.';
    } else{
        echo 'could not be created.';
    }
    
