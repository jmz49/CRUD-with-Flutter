

<?php
    
    include 'dbparam.php';
    
    $conndb = new PDO("mysql:host=$servername;dbname=$databasename;charset=utf8", $username, $password);
    
    //==============================================
    
    $id  = $_POST['id'];
    
    //==============================================
    
      // sql to delete a record
    $query = "DELETE FROM users WHERE id='$id'";

      // use exec() because no results are returned
    $conndb->exec($query);

    
   //==============================================
                   
//    $conndb = null;
    

?>
