<?php
class Employee
{

    // Connection
    private $conn;

    // Table
    private $db_table = "reservations";
    private $db_table1 = "drivers";
    private $db_table2 = "users";

    // Columns
    public $id_reservations;
    public $id_users;
    public $lugar_inicio ;
    public $lugar_destino;
    public $cupos ;
    public $id_drivers;
    public $censo_drivers;
    public $placa_drivers ;
    public $fecha ; 

    // Db connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    // GET ALL SELECT id_reservations, u.nombre,lugar_inicio, lugar_destino,cupos,d.nombre,d.placa, d.censo,fecha FROM reservations r JOIN drivers d ON r.id_drivers=d.id_dirvers JOIN users u on r.id_users=u.id_users
    public function getEmployees()
    {
        $sqlQuery = "SELECT id_reservations, u.nombre,lugar_inicio, lugar_destino,cupos,d.nombre,d.placa, d.censo,fecha FROM reservations r JOIN drivers d ON r.id_drivers=d.id_dirvers JOIN users u on r.id_users=u.id_users";
        $stmt = $this->conn->prepare($sqlQuery);
        $stmt->execute();
        return $stmt;
        
    }

    // CREATE
    public function createEmployee()
    {
    
          

        $sqlQuery =  "INSERT INTO
                      " . $this->db_table . 
                      
                      "
                    SET
 
                    id_users = :id_users, 
                    lugar_inicio = :lugar_inicio, 
                    lugar_destino = :lugar_destino, 
                    cupos = :cupos, 
                    fecha = :fecha";
                    
                    //dejamos afuera los demas campos por que van null por defaul, ya que no tendran asignacion de chofer por el momento.

        $stmt = $this->conn->prepare($sqlQuery);

        // sanitize
        $this->id_reservations = htmlspecialchars(strip_tags($this->id_reservations));
        $this->id_users = htmlspecialchars(strip_tags($this->id_users));
        $this->lugar_inicio = htmlspecialchars(strip_tags($this->lugar_inicio));
        $this->lugar_destino = htmlspecialchars(strip_tags($this->lugar_inicio));
        $this->cupos = htmlspecialchars(strip_tags($this->cupos));
        $this->id_drivers = htmlspecialchars(strip_tags($this->id_drivers));
        $this->censo_drivers = htmlspecialchars(strip_tags($this->censo_drivers));
        $this->placa_drivers = htmlspecialchars(strip_tags($this->placa_drivers));
        $this->fecha = htmlspecialchars(strip_tags($this->fecha));
         

        // bind data
        
    
       // $stmt->bindParam(":id_reservations", $this->id_reservations);
        $stmt->bindParam(":id_users", $this->id_users);
        $stmt->bindParam(":lugar_inicio", $this->lugar_inicio);
        $stmt->bindParam(":lugar_destino", $this->lugar_destino);
        $stmt->bindParam(":cupos", $this->cupos);
      /*  $stmt->bindParam(":id_drivers", $this->id_drivers);
        $stmt->bindParam(":censo_drivers", $this->censo_drivers);
        $stmt->bindParam(":placa_drivers", $this->placa_drivers);*/
        $stmt->bindParam(":fecha", $this->fecha); 
       if ($stmt->execute()) {
            return true;
        }
        return false;
    }
    
    

    // UPDATE
    public function updateEmployee()
    {
    
         /* "INSERT INTO
                      " . $this->db_table . 
                      
                      "
                    SET
 
                    id_users = :id_users, 
                    lugar_inicio = :lugar_inicio, 
                    lugar_destino = :lugar_destino, 
                    cupos = :cupos, 
                    fecha = :fecha";
                    
                    //dejamos afuera los demas campos por que van null por defaul, ya que no tendran asignacion de chofer por el momento. */


        $sqlQuery = "UPDATE
                      " . $this->db_table . 
                      
                      "
                    SET
                     
                    id_drivers = :id_drivers, 
                    censo_drivers = :censo_drivers, 
                    placa_drivers = :placa_drivers where id_reservations = :id_reservations";

        $stmt = $this->conn->prepare($sqlQuery);

        // sanitize
        $this->id_reservations = htmlspecialchars(strip_tags($this->id_reservations));
        $this->id_users = htmlspecialchars(strip_tags($this->id_users));
        $this->lugar_inicio = htmlspecialchars(strip_tags($this->lugar_inicio));
        $this->lugar_destino = htmlspecialchars(strip_tags($this->lugar_inicio));
        $this->cupos = htmlspecialchars(strip_tags($this->cupos));
        $this->id_drivers = htmlspecialchars(strip_tags($this->id_drivers));
        $this->censo_drivers = htmlspecialchars(strip_tags($this->censo_drivers));
        $this->placa_drivers = htmlspecialchars(strip_tags($this->placa_drivers));
        $this->fecha = htmlspecialchars(strip_tags($this->fecha));
         

        // bind data
        
    
        $stmt->bindParam(":id_reservations", $this->id_reservations);
        /*$stmt->bindParam(":id_users", $this->id_users);
        $stmt->bindParam(":lugar_inicio", $this->lugar_inicio);
        $stmt->bindParam(":lugar_destino", $this->lugar_destino);
        $stmt->bindParam(":cupos", $this->cupos);*/
        $stmt->bindParam(":id_drivers", $this->id_drivers);
        $stmt->bindParam(":censo_drivers", $this->censo_drivers);
        $stmt->bindParam(":placa_drivers", $this->placa_drivers);
       // $stmt->bindParam(":fecha", $this->fecha); 
       if ($stmt->execute()) {
            return true;
        }
        return false;
    }
      // DELETE
    public function deleteEmployee()
    {
    
          

        $sqlQuery = "DELETE FROM
                      " . $this->db_table . 
                      
                      " where id_reservations = :id_reservations";

        $stmt = $this->conn->prepare($sqlQuery);

        // sanitize
        $this->id_reservations = htmlspecialchars(strip_tags($this->id_reservations));
        $this->id_users = htmlspecialchars(strip_tags($this->id_users));
        $this->lugar_inicio = htmlspecialchars(strip_tags($this->lugar_inicio));
        $this->lugar_destino = htmlspecialchars(strip_tags($this->lugar_inicio));
        $this->cupos = htmlspecialchars(strip_tags($this->cupos));
        $this->id_drivers = htmlspecialchars(strip_tags($this->id_drivers));
        $this->censo_drivers = htmlspecialchars(strip_tags($this->censo_drivers));
        $this->placa_drivers = htmlspecialchars(strip_tags($this->placa_drivers));
        $this->fecha = htmlspecialchars(strip_tags($this->fecha));
         

        // bind data
        
    
        $stmt->bindParam(":id_reservations", $this->id_reservations);
        /*$stmt->bindParam(":id_users", $this->id_users);
        $stmt->bindParam(":lugar_inicio", $this->lugar_inicio);
        $stmt->bindParam(":lugar_destino", $this->lugar_destino);
        $stmt->bindParam(":cupos", $this->cupos);
        $stmt->bindParam(":id_drivers", $this->id_drivers);
        $stmt->bindParam(":censo_drivers", $this->censo_drivers);
        $stmt->bindParam(":placa_drivers", $this->placa_drivers);
        $stmt->bindParam(":fecha", $this->fecha); */
       if ($stmt->execute()) {
            return true;
        }
        return false;
    }


}
