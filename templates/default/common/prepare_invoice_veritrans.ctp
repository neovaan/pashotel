<?php
// //print_r($order);
// $produk=$order['Deal']['title'];
// $idtrans=$order['DealOrder']['id'];
// //$idtrans=$order['DealOrderCode'][0]['deal_code'];
// $sk='F9s5e3p2f4x3';
// $qty=$order['DealOrder']['quantity'];
$amount=$order['DealOrder']['amount'];
// $subttl=$qty*$amount;
// debug($order);
// // debug($subttl);
// // debug($qty);
// // debug($amount);

$amount2=$amount+@$_COOKIE['cost'];
// $words=sha1 ( $amount2.$sk.$idtrans );

$produk=$order['Deal']['title'];
$idtrans=$order['DealOrder']['id'];
$qty=$order['DealOrder']['quantity'];
$dealConfig = cr("DealConfig");
$taxRate = $dealConfig['tax'];
$tax = 0;
if(!$taxRate)
{
  $taxRate = 0;
}
$newAmount = 0;
if(!empty($order))
  {
    $newAmount = $order['Deal']['finalPrice'];
    if($taxRate)
    {
      $tax = (($newAmount / 100) * $taxRate);
      $newAmount = ($newAmount + $tax);
    }
  }
$grossAmount = ($newAmount * $qty);
/*Go to veritrans*/
require_once(ROOT . DS . 'veritrans/Veritrans.php');
//Set Your server key
Veritrans_Config::$serverKey = "VT-server-dc8y9ZykdkazXx_II1dpout3";

// Uncomment for production environment
// Veritrans_Config::$isProduction = true;

// Uncomment to enable sanitization
// Veritrans_Config::$isSanitized = true;

// Uncomment to enable 3D-Secure
Veritrans_Config::$is3ds = true;

// Required
$transaction_details = array(
  'order_id' => $idtrans,
  'gross_amount' => $amount2, // no decimal allowed for creditcard
  );

// Optional
/*$item1_details = array(
    'id' => $idtrans,
    'price' => $newAmount,
    'quantity' => $qty,
    'name' => $produk
    );*/

// Optional
/*$item2_details = array(
    'id' => 'a2',
    'price' => 45000,
    'quantity' => 1,
    'name' => "Orange"
    );*/

// Optional
// $item_details = array ($item1_details);

// Optional
$billing_address = array(
    'first_name'    => $order['User']['slug'],
    // 'last_name'     => "Litani",
    'address'       => "".$order['User']['city'].", ".$order['User']['state']."",
    // 'address'       => "",
    'city'          => $order['User']['city'],
    'postal_code'   => $order['User']['postal_code'],
    'email'         => $order['User']['email'],
    'country_code'  => "IDN"
    );

// Optional
$shipping_address = array(
    'first_name'    => $order['User']['slug'],
    // 'last_name'     => "Supriadi",
    'address'       => @$_COOKIE['address'],
    'city'          => @$_COOKIE['city'],
    'postal_code'   => @$_COOKIE['zipcode'],
    'phone'         => @$_COOKIE['phone'],
    'country_code'  => @$_COOKIE['country']
    );

// Optional
$customer_details = array(
    'first_name'    => $order['User']['slug'],
    // 'last_name'     => "Litani",
    'email'         => $order['User']['email'],
    // 'phone'         => "081122334455",
    'billing_address'  => $billing_address,
    'shipping_address' => $shipping_address
    );

// Fill transaction details
$transaction = array(
    'transaction_details' => $transaction_details,
    'customer_details' => $customer_details,
    // 'item_details' => $item_details,
    );
// debug($transaction);exit();
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
      echo htmlspecialchars('Veritrans_Config::$serverKey = \'VT-server-dc8y9ZykdkazXx_II1dpout3\';');
      die();
}

}
/*Go to Veritrans*/
