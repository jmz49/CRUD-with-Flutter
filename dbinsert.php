

<?php
    
    include 'dbparam.php';
    
    $conndb = new PDO("mysql:host=$servername;dbname=$databasename;charset=utf8", $username, $password);
    
    //==============================================

    $firstname = $_POST['firstname'];
    $lastname  = $_POST['lastname'];
    
    //==============================================

    $query = "INSERT INTO users (firstname, lastname) VALUES ('$firstname', '$lastname')";
    
      // use exec() because no results are returned
    $conndb->exec($query);
    
   //==============================================
                   
//    $conndb = null;
    

?>
