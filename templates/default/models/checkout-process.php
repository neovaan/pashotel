<?php
require_once(dirname(__FILE__) . '/../../Veritrans.php');
//Set Your server key
Veritrans_Config::$serverKey = "VT-server-ZIR--Fxlu2QDqv38unLd-U9U";

// Uncomment for production environment
// Veritrans_Config::$isProduction = true;


if(!isset($_SESSION['book']) || count($_SESSION['book']) == 0){
    header("Location: ".DOCBASE.$sys_pages['booking']['alias']);
    exit();
}

$msg_error = "";
$msg_success = "";
$field_notice = array();

$payment_arr = array_map("trim", explode(",", PAYMENT_TYPE));
if(count($payment_arr) == 1){
    $payment_type = PAYMENT_TYPE;
    $handle = true;
}elseif(isset($_POST['payment_type'])){
    $payment_type = $_POST['payment_type'];
    $handle = true;
}else{
    $payment_type = PAYMENT_TYPE;
    $handle = false;
}

if(isset($_SESSION['book']['id'])){
    $result_booking = $db->query("SELECT * FROM pm_booking WHERE id = ".$_SESSION['book']['id']." AND status != 1 AND trans != ''");
    if($result_booking !== false && $db->last_row_count() > 0){
        unset($_SESSION['book']);
        header("Location: ".DOCBASE.$sys_pages['booking']['alias']);
        exit();
    }
}
// Uncomment to enable sanitization
// Veritrans_Config::$isSanitized = true;

// Uncomment to enable 3D-Secure
// Veritrans_Config::$is3ds = true;

// Required
$transaction_details = array(
  'order_id' => rand(),
  'gross_amount' => 145000, // no decimal allowed for creditcard
  );

// Optional
$item1_details = array(
    'id' => 'a1',
    'price' => 50000,
    'quantity' => 2,
    'name' => "Apple"
    );

/* Optional
$item2_details = array(
    'id' => 'a2',
    'price' => 45000,
    'quantity' => 1,
    'name' => "Orange"
    ); */

// Optional
$item_details = array ($item1_details, $item2_details);

// Optional
$billing_address = array(
    'first_name'    => "Andri",
    'last_name'     => "Litani",
    'address'       => "Mangga 20",
    'city'          => "Jakarta",
    'postal_code'   => "16602",
    'phone'         => "081122334455",
    'country_code'  => 'IDN'
    );

/* Optional
$shipping_address = array(
    'first_name'    => "Obet",
    'last_name'     => "Supriadi",
    'address'       => "Manggis 90",
    'city'          => "Jakarta",
    'postal_code'   => "16601",
    'phone'         => "08113366345",
    'country_code'  => 'IDN'
    );
*/
// Optional
$customer_details = array(
    'first_name'    => "Andri",
    'last_name'     => "Litani",
    'email'         => "andri@litani.com",
    'phone'         => "081122334455",
    'billing_address'  => $billing_address,
    'shipping_address' => $shipping_address
    );

// Fill transaction details
$transaction = array(
    'transaction_details' => $transaction_details,
    'customer_details' => $customer_details,
    'item_details' => $item_details,
    );
	print_r($transaction);
	header('Location: ' . Veritrans_VtWeb::getRedirectionUrl($transaction));
/*
try {
  // Redirect to Veritrans VTWeb page
  header('Location: ' . Veritrans_VtWeb::getRedirectionUrl($transaction));
}
catch (Exception $e) {
  echo $e->getMessage();
  if(strpos ($e->getMessage(), "Access denied due to unauthorized")){
      echo "<code>";
      echo "<h4>Please set real server key from sandbox</h4>";
      echo "In file: " . __FILE__;
      echo "<br>";
      echo "<br>";
      echo htmlspecialchars('Veritrans_Config::$serverKey = \'VT-server-ZIR--Fxlu2QDqv38unLd-U9U';');
      die();
}

}
*/
?>
