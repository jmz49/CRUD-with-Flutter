

<?php
    
    include 'dbparam.php';
    
    $conndb = new PDO("mysql:host=$servername;dbname=$databasename;charset=utf8", $username, $password);
    
    //==============================================

    $id  = $_POST['id'];
    $firstname = $_POST['firstname'];
    $lastname  = $_POST['lastname'];
    
    //==============================================

    $query = "UPDATE users set firstname='$firstname', lastname='$lastname' where id='$id'";
    
    // Prepare statement
    $statement = $conndb->prepare($query);
    
    // execute the query
    $statement->execute();
    
   //==============================================
                   
//    $conndb = null;
    

?>
