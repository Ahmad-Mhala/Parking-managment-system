<?php session_start();?>

<link rel="stylesheet" href="popup_style.css">
<!DOCTYPE html>
<html lang="en">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<title>LAGOS PARKER</title>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="This Parking Management System Developed by Ahmad Mhala">
<meta name="author" content="Ahmad mhala">


<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="files/bower_components/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="files/assets/icon/themify-icons/themify-icons.css">

<link rel="stylesheet" type="text/css" href="files/assets/icon/icofont/css/icofont.css">

<link rel="stylesheet" type="text/css" href="files/assets/css/style.css">


<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-WLQ4RLB');</script>


</head>
<body class="fix-menu">
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WLQ4RLB"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>

<?php
  include('connect.php');
if(isset($_POST['btn_login']))
{
$unm = $_POST['email'];
//echo $_POST['passwd'];
//$p="admin";
$passw= $_POST['password'];
//$passw = hash('sha256',$p);
//echo $passw;exit;
function createSalt()
{
    return '2123293dsj2hu2nikhiljdsd';
}
$salt = createSalt();
$pass = $passw;
//echo $pass;
 $sql = "SELECT * FROM admin WHERE email='" .$unm . "' and password = '". $pass."'";
    $result = mysqli_query($conn,$sql);
    $row  = mysqli_fetch_array($result);
    //print_r($row);
     $_SESSION["id"] = $row['id'];
     $_SESSION["username"] = $row['username'];
     $_SESSION["password"] = $row['password'];
     $_SESSION["email"] = $row['email'];
     $_SESSION["fname"] = $row['fname'];
     $_SESSION["lname"] = $row['lname'];
     $_SESSION["image"] = $row['image'];
     $_SESSION["role_id"]=$row["role_id"];
      $count=mysqli_num_rows($result);
     if(!empty($row) && isset($_SESSION["email"]) && isset($_SESSION["password"])) {
    {       
        ?>
         <div class="popup popup--icon -success js_success-popup popup--visible">
  <div class="popup__background"></div>
  <div class="popup__content">
    <h3 class="popup__content__title">
      Success 
    </h3>
    <p>Login Successfully</p>
    <p>
     <!--  <a href="index.php"><button class="button button--success" data-for="js_success-popup"></button></a> -->
     <?php echo "<script>setTimeout(\"location.href = 'index.php';\",1500);</script>"; ?>
    </p>
  </div>
</div>
   <!--   <script>
     window.location="index.php";
     </script> -->
     <?php
    }
}
else {?>
     <div class="popup popup--icon -error js_error-popup popup--visible">
  <div class="popup__background"></div>
  <div class="popup__content">
    <h3 class="popup__content__title">
      Error 
    </h3>
    <p>Invalid Email or Password</p>
    <p>
      <a href="login.php"><button class="button button--error" data-for="js_error-popup">Close</button></a>
    </p>
  </div>
</div>
    
        <?php
         }
    
    }
?>

<?php
if(isset($_POST['btn_check']))
{
  
  $check_id= $_POST['check_id'];

    $sql = "SELECT * FROM `tbl_repairs`  where delete_status=0";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) { 
            $sql1 = "SELECT * FROM `tbl_clients` where id ='".$row['name']."'";
            $result1 = $conn->query($sql1); 
            $row1 = $result1->fetch_assoc();
            $sql4 = "SELECT * FROM `tbl_status` where id ='".$row['status']."'";
            $result4 = $conn->query($sql4); 
            $row4 = $result4->fetch_assoc();  
           $repair_id= $row['id'];      
      ?>
        
          <?php  if($check_id==$repair_id) {
         
        ?>
         <div class="popup popup--icon -success js_success-popup popup--visible">
  <div class="popup__background"></div>
  <div class="popup__content">
    <h3 class="popup__content__title">
      Check repair Status 
    </h3>
          <table align="center">
            <tr><td><span>Client : </span></td><td style="text-align: right;">  <?php echo $row1['name']; ?></td><br></tr>
            <tr><td><span>Repair Number : </span></td><td style="text-align: right;"> <?php echo $row['id'];?></td><br></tr>
            <tr><td><span>Status : </span></td><td style="text-align: right;"> <?php echo $row4['status']; ?></td><br></tr>          
          </table><br><br>
    <p>
      <a href="login.php"><button class="button button--success" data-for="js_success-popup">Close</button></a>
    
    </p>
  </div>
</div><?php exit;?>
  
     <?php
}else {?>
     <div class="popup popup--icon -error js_error-popup popup--visible">
  <div class="popup__background"></div>
  <div class="popup__content">
    <h3 class="popup__content__title">
    No Record Found
    </h3>
   
    <p>
      <?php echo "<script>setTimeout(\"location.href = 'login.php';\",1500);</script>"; ?>
    </p>
  </div>
</div>
    
        <?php
         }
    
   
  
} 
}?>

<?php
$que="select * from manage_website";
$query=$conn->query($que);
while($row=mysqli_fetch_array($query))
{
  extract($row);
  $business_name = $row['business_name'];
  $business_email = $row['business_email'];
  $business_web = $row['business_web'];
  $portal_addr = $row['portal_addr'];
  $addr = $row['addr'];
  $curr_sym = $row['curr_sym'];
  $curr_position = $row['curr_position'];
  $front_end_en = $row['front_end_en'];
  $date_format = $row['date_format'];
  $def_tax = $row['def_tax'];
  $logo = $row['logo'];
}
?>


<section class="login-block">

<div class="container-fluid">
<div class="row">
<div class="col-sm-12">



<div class="auth-box card" >
    <br>
  <div class="text-center">
<image class="profile-img" src="uploadImage/Logo/<?php echo $logo; ?>" style="width: 80%"></image>
</div> 
<div class="card-block" >
 
<div class="row m-b-20">
<div class="col-md-12">

</div>
</div>
<form method="POST" >
<div class="form-group form-primary">
<input type="email" name="email" class="form-control" required="" placeholder="Email">
<span class="form-bar"></span>
</div>
<div class="form-group form-primary">
<input type="password" name="password" class="form-control" required="" placeholder="Password">
<span class="form-bar"></span>
</div>
<div class="row m-t-25 text-left">
<div class="col-12">


<div class="forgot-phone text-right f-right">
<a href="forgot_password.php" class="text-right f-w-600"> Forgot Password?</a>
</div>

</div>
</div>
<div class="row m-t-30">
<div class="col-md-12">
<button type="submit" name="btn_login" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">LOGIN</button>
</div>
</div><br><br>
</form>


</div>
</div>


</div>

</div>
</div>
</div>
</section>

 
           
</a></marquee></footer> 
<script type="text/javascript" src="files/bower_components/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="files/bower_components/jquery-ui/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="files/bower_components/popper.js/js/popper.min.js"></script>
<script type="text/javascript" src="files/bower_components/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="files/bower_components/jquery-slimscroll/js/jquery.slimscroll.js"></script>

<script type="text/javascript" src="files/bower_components/modernizr/js/modernizr.js"></script>
<script type="text/javascript" src="files/bower_components/modernizr/js/css-scrollbars.js"></script>

<script type="text/javascript" src="files/bower_components/i18next/js/i18next.min.js"></script>
<script type="text/javascript" src="files/bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
<script type="text/javascript" src="files/bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
<script type="text/javascript" src="files/bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>
<script type="text/javascript" src="files/assets/js/common-pages.js"></script>


</body>

 

</html>
