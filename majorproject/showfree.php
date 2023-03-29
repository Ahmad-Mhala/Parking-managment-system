<?php require_once('check_login.php');?>
<?php include('head.php');?>
<?php include('header.php');?>
<?php include('sidebar.php');?>
                   <br>                       
 <?php 
 include('connect.php');
$available_parking_numbers = array();

// First, search for available spots in the A category
for ($i = 1; $i <= 10; $i++) {
  $parking_number = "A" . str_pad($i, 2, "0", STR_PAD_LEFT);
  $query = mysqli_query($conn, "SELECT * FROM tblvehicle WHERE ParkingNumber = '$parking_number'");
  if(mysqli_num_rows($query) == 0) {
    $available_parking_numbers[] = $parking_number;
  }
}

// If no available spots found in the A category, search in the B category
for ($i = 1; $i <= 10; $i++) {
  $parking_number = "B" . str_pad($i, 2, "0", STR_PAD_LEFT);
  $query = mysqli_query($conn, "SELECT * FROM tblvehicle WHERE ParkingNumber = '$parking_number'");
  if(mysqli_num_rows($query) == 0) {
    $available_parking_numbers[] = $parking_number;
  }
}

// If no available spots found in the B category, search in the C category
for ($i = 1; $i <= 10; $i++) {
  $parking_number = "C" . str_pad($i, 2, "0", STR_PAD_LEFT);
  $query = mysqli_query($conn, "SELECT * FROM tblvehicle WHERE ParkingNumber = '$parking_number'");
  if(mysqli_num_rows($query) == 0) {
    $available_parking_numbers[] = $parking_number;
  }
}

?>

<table>
  <thead>
    <tr>
      <th>Parking Number</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($available_parking_numbers as $parking_number): ?>
      <tr>
        <td><?php echo $parking_number; ?></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>
