

<?php
    
    include 'dbparam.php';
    
    $conndb = new PDO("mysql:host=$servername;dbname=$databasename;charset=utf8", $username, $password);
     //==============================================

    $conndb->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    //==============================================
    
    $cursor=array();

    $response=$conndb->query("SELECT * FROM users ORDER BY users.id DESC");

    while($row = $response->fetch( PDO::FETCH_ASSOC )){
                $cursor[] = $row;
    }

    echo json_encode($cursor);
        
    $response->closeCursor();
    
    //==============================================
    
    $conndb = null;
    

?>
