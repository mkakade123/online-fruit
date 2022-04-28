<?php
    include '_dbconnect.php';

if($_SERVER["REQUEST_METHOD"] == "POST") {

    if(isset($_POST['createdeliveryboy'])) {
        $name = $_POST["name"];
        $desc = $_POST["desc"];

        $sql = "INSERT INTO `s` (`Name`, `deliveryboydesc`, `deliveryboyCreateDate`) VALUES ('$name', '$desc', current_timestamp())";   
        $result = mysqli_query($conn, $sql);
        $deliveryboyid = $conn->insert_id;
        if($result) {
            $check = getimagesize($_FILES["image"]["tmp_name"]);
            if($check !== false) {
                
                $newfilename = "card-".$deliveryboyid.".jpg";

                $uploaddir = $_SERVER['DOCUMENT_ROOT'].'/OnlinefruitDelivery/img/';
                $uploadfile = $uploaddir . $newfilename;

                if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadfile)) {
                    echo "<script>alert('success');
                            window.location=document.referrer;
                        </script>";
                } else {
                    echo "<script>alert('failed to upload image');
                            window.location=document.referrer;
                        </script>";
                }

            }
            else{
                echo '<script>alert("Please select an image file to upload.");
                    </script>';
            }
        }
    }
    if(isset($_POST['removedeliveryboy'])) {
        $deliveryboyid = $_POST["deliveryboyid"];
        $filename = $_SERVER['DOCUMENT_ROOT']."/OnlinefruitDelivery/img/card-".$deliveryboyid.".jpg";
        $sql = "DELETE FROM `deliveryboy` WHERE `deliveryboyid`='$deliveryboyid'";   
        $result = mysqli_query($conn, $sql);
        if ($result){
            if (file_exists($filename)) {
                unlink($filename);
            }
            echo "<script>alert('Removed');
                window.location=document.referrer;
                </script>";
        }
        else {
            echo "<script>alert('failed');
                window.location=document.referrer;
                </script>";
        }
    }
    if(isset($_POST['updatedeliveryboy'])) {
        $deliveryboyid = $_POST["deliveryboyid"];
        $Name = $_POST["name"];
        $deliveryboydesc = $_POST["desc"];

        $sql = "UPDATE `deliveryboy` SET `Name`='$Name', `deliveryboydesc`='$deliveryboydesc' WHERE `deliveryboyid`='$deliveryboyid'";   
        $result = mysqli_query($conn, $sql);
        if ($result){
            echo "<script>alert('update');
                window.location=document.referrer;
                </script>";
        }
        else {
            echo "<script>alert('failed');
                window.location=document.referrer;
                </script>";
        }
    }
    if(isset($_POST['updatedeliveryboyPhoto'])) {
        $deliveryboyid = $_POST["deliveryboyid"];
        $check = getimagesize($_FILES["deliveryboyimage"]["tmp_name"]);
        if($check !== false) {
            $newName = 'card-'.$deliveryboyid;
            $newfilename=$newName .".jpg";

            $uploaddir = $_SERVER['DOCUMENT_ROOT'].'/OnlinefruitDelivery/img/';
            $uploadfile = $uploaddir . $newfilename;

            if (move_uploaded_file($_FILES['deliveryboyimage']['tmp_name'], $uploadfile)) {
                echo "<script>alert('success');
                        window.location=document.referrer;
                    </script>";
            } else {
                echo "<script>alert('failed');
                        window.location=document.referrer;
                    </script>";
            }
        }
        else{
            echo '<script>alert("Please select an image file to upload.");
            window.location=document.referrer;
                </script>';
        }
    }
}
?>