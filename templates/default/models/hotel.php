<?php

if($article_alias == "") err404();

$result = $db->query("SELECT * FROM pm_hotel WHERE checked = 1 AND lang = ".LANG_ID." AND alias = ".$db->quote($article_alias));
if($result !== false && $db->last_row_count() == 1){
    
    $hotel = $result->fetch(PDO::FETCH_ASSOC);
    
    $hotel_id = $hotel['id'];
    $article_id = $hotel_id;
    $title_tag = $hotel['title']." - ".$title_tag;
    $page_title = $hotel['title'];
    $page_subtitle = "";
    $page_alias = $pages[$page_id]['alias']."/".text_format($hotel['alias']);
    
    $result_hotel_file = $db->query("SELECT * FROM pm_hotel_file WHERE id_item = ".$hotel_id." AND checked = 1 AND lang = ".DEFAULT_LANG." AND type = 'image' AND file != '' ORDER BY rank LIMIT 1");
    if($result_hotel_file !== false && $db->last_row_count() > 0){
        
        $row = $result_hotel_file->fetch();
        
        $file_id = $row['id'];
        $filename = $row['file'];
        
        if(is_file(SYSBASE."medias/hotel/medium/".$file_id."/".$filename))
            $page_img = getUrl(true)."/medias/hotel/medium/".$file_id."/".$filename;
    }
    
}else err404();

check_URI(DOCBASE.$page_alias);


/* ==============================================
 * DATE PICKER
 * ====================== */
$field_notice = array();
$msg_error = "";
$msg_success = "";
$response = "";
$room_stock = 1;
$max_people = 30;

if(isset($_POST['num_adults'])) $num_adults = $_POST['num_adults'];
elseif(isset($_SESSION['book']['adults'])) $num_adults = $_SESSION['book']['adults'];
else $num_adults = 1;

if(isset($_POST['num_children'])) $num_children = $_POST['num_children'];
elseif(isset($_SESSION['book']['children'])) $num_children = $_SESSION['book']['children'];
else $num_children = 0; 

if(isset($_SESSION['book']['from_date'])) $from_time = $_SESSION['book']['from_date'];
else $from_time = time();

if(isset($_SESSION['book']['to_date'])) $to_time = $_SESSION['book']['to_date'];
else $to_time = time()+86400;

$from_date = date("d/m/Y", $from_time);
$to_date = date("d/m/Y", $to_time);

if(isset($_POST['from_date'])) $from_date = htmlentities($_POST['from_date'], ENT_QUOTES, "UTF-8");
if(isset($_POST['to_date'])) $to_date = htmlentities($_POST['to_date'], ENT_QUOTES, "UTF-8");

if(isset($_POST['destination_id']) && is_numeric($_POST['destination_id'])){
    $destination_id = $_POST['destination_id'];
    $destination_name = db_getFieldValue($db, "pm_destination", "name", $destination_id);
}else{
    $destination_id = 0;
    $destination_name = "";
}
if(isset($_POST['book']) || (ENABLE_BOOKING_REQUESTS == 1 && isset($_POST['request']))){
    $num_adults = $_POST['adults'];
    /*$num_children = $_POST['children'];*/
    $num_nights = $_POST['nights'];
    
    $_SESSION['book']['hotel'] = $_POST['hotel'];
    $_SESSION['book']['hotel_id'] = $_POST['id_hotel'];
    $_SESSION['book']['room'] = $_POST['room'];
    $_SESSION['book']['room_id'] = $_POST['id_room'];
    $_SESSION['book']['from_date'] = $_POST['from_date'];
    $_SESSION['book']['to_date'] = $_POST['to_date'];
    $_SESSION['book']['nights'] = $num_nights;
    $_SESSION['book']['adults'] = $num_adults;
    $_SESSION['book']['children'] = $num_children;
    $_SESSION['book']['extra_services'] = array();
    
    if(isset($_POST['book'])){
        $_SESSION['book']['amount_rooms'] = $_POST['amount'];
        $_SESSION['book']['amount_activities'] = 0;
        $_SESSION['book']['amount_services'] = 0;
        $_SESSION['book']['vat_rooms'] = $_POST['vat_amount'];
        $_SESSION['book']['vat_activities'] = 0;
        $_SESSION['book']['vat_services'] = 0;
        
        $tourist_tax = (TOURIST_TAX_TYPE == "fixed") ? $num_adults*$num_nights*TOURIST_TAX : $_SESSION['book']['amount_rooms']*TOURIST_TAX/100;
        
        $_SESSION['book']['tourist_tax'] = (ENABLE_TOURIST_TAX == 1) ? $tourist_tax : 0;
        
        $_SESSION['book']['down_payment'] = (ENABLE_DOWN_PAYMENT == 1 && DOWN_PAYMENT_RATE > 0) ? ($_SESSION['book']['amount_rooms']+$_SESSION['book']['tourist_tax'])*DOWN_PAYMENT_RATE/100 : 0;
    }
	if(isset($_SESSION['book']['id'])) unset($_SESSION['book']['id']);

    $result_activity = $db->query("SELECT * FROM pm_activity WHERE hotels REGEXP '(^|,)".$_SESSION['book']['hotel_id']."(,|$)' AND checked = 1 AND lang = ".LANG_ID);
    if(isset($_SESSION['book']['activities'])) unset($_SESSION['book']['activities']);
    
    if($result_activity !== false && $db->last_row_count() > 0){
        $_SESSION['book']['activities'] = array();
        header("Location: ".DOCBASE.$sys_pages['booking-activities']['alias']);
    }else
        header("Location: ".DOCBASE.$sys_pages['details']['alias']);
    
    exit();
}
$period = $to_time-$from_time;
if(date("I", $to_time) XOR date("I", $from_time)) $period -= 3600;
$num_nights = ceil($period/86400);

if(count($field_notice) == 0){

    if($num_nights <= 0) $msg_error .= $texts['NO_AVAILABILITY'];
    else{
        $days = array();
        $booked = array();

        $query_book = "
            SELECT stock, id_room, from_date, to_date
            FROM pm_booking as b, pm_room as r
            WHERE
                lang = ".DEFAULT_LANG."
                AND id_room = r.id
                AND status = 4
                AND r.checked = 1
                AND from_date < ".$to_time."
                AND to_date > ".$from_time."
            GROUP BY b.id";
        $result_book = $db->query($query_book);
        if($result_book !== false){
            foreach($result_book as $i => $row){
                $start_date = $row['from_date'];
                $end_date = $row['to_date'];
                $id_room = $row['id_room'];
                $room_stock = $row['stock'];
                
                $d = 0;
                $start = ($start_date < $from_time) ? $from_time : $start_date;
                $end = ($end_date > $to_time) ? $to_time : $end_date;
                $dst = date("I", $start);
                
                for($date = $start; $date <= $end; $date += 86400){

                    $cur_dst = date("I", $date);
                    if($dst != $cur_dst){
                        if($cur_dst == 0) $date += 3600;
                        else $date -= 3600;
                        $dst = $cur_dst;
                    }
                    $days[$id_room][$date] = isset($days[$id_room][$date]) ? $days[$id_room][$date]+1 : 1;
                    
                    if($days[$id_room][$date]+1 > $room_stock && !in_array($date, $booked)) $booked[$id_room][] = $date;
                }
            }
        }
        $amount = 0;
        $total_nights = 0;
        $res_hotel = array();
        $query_rate = "
            SELECT DISTINCT max_adults, max_children, min_people, max_people, id_hotel, id_room, start_date, end_date, ra.price, child_price, discount, type, people, price_sup, fixed_sup, vat_rate, min_stay, day_start, day_end
            FROM pm_rate as ra, pm_room as ro
            WHERE
                id_room = ro.id
                AND ro.checked = 1
                AND (end_lock IS NULL OR end_lock < ".$from_time." OR
                    start_lock IS NULL OR start_lock > ".$to_time.")
                AND start_date <= ".$to_time."
                AND end_date >= ".$from_time;
        if(!empty($booked)) $query_rate .= " AND id_room NOT IN(".implode(",", array_keys($booked)).")";
        $query_rate .= "
            ORDER BY CASE type
                WHEN 'week' THEN 1
                WHEN 'mid-week' THEN 2
                WHEN 'week-end' THEN 3
                WHEN '2-nights' THEN 4
                WHEN 'night' THEN 5
                ELSE 6 END, min_stay DESC";

        $result_room_rate = $db->query($query_rate);
        if($result_room_rate !== false){
            foreach($result_room_rate as $i => $row){

                $id_room = $row['id_room'];
                $id_hotel = $row['id_hotel'];
                $start_date = $row['start_date'];
                $end_date = $row['end_date'];
                $price = $row['price'];
                $child_price = $row['child_price'];
                $discount = $row['discount'];
                $type = $row['type'];
                $people = $row['people'];
                $price_sup = $row['price_sup'];
                $fixed_sup = $row['fixed_sup'];
                $day_start = $row['day_start'];
                $day_end = $row['day_end'];
                $vat_rate = $row['vat_rate'];
                $min_stay = $row['min_stay'];
                $min_people = $row['min_people'];
                $max_people = $row['max_people'];
                $max_adults = $row['max_adults'];
                $max_children = $row['max_children'];
                
                if(!isset($res_hotel[$id_hotel][$id_room]['days'])) $res_hotel[$id_hotel][$id_room]['days'] = array();
                
                $from_n = date("N", $from_time);
                $to_n = date("N", $to_time);
                
                $error = false;
                if($num_nights < $min_stay){
                    if(!isset($res_hotel[$id_hotel][$id_room]['min_stay'])) $res_hotel[$id_hotel][$id_room]['min_stay'] = $min_stay;
                    $error = true;
                    $res_hotel[$id_hotel][$id_room]['notice'] = $texts['MIN_NIGHTS']." : ".$min_stay;
                }
                if($num_adults+$num_children > $max_people){
                    $error = true;
                    $res_hotel[$id_hotel][$id_room]['notice'] = $texts['MAX_PEOPLE']." : ".$max_people;
                }
                if($num_adults+$num_children < $min_people){
                    $error = true;
                    $res_hotel[$id_hotel][$id_room]['notice'] = $texts['MIN_PEOPLE']." : ".$min_people;
                }
                if($num_adults > $max_adults){
                    $error = true;
                    $res_hotel[$id_hotel][$id_room]['notice'] = $texts['MAX_ADULTS']." : ".$max_adults;
                }
                if($num_children > $max_children){
                    $error = true;
                    $res_hotel[$id_hotel][$id_room]['notice'] = $texts['MAX_CHILDREN']." : ".$max_children;
                }
                
                if($error === false){
                    // custom day start and day end
                    if(($day_start == 0 || $from_n == $day_start) && ($day_end == 0 || $to_n == $day_end)){

                        // existing package with default conditions
                        if((($type == "week-end" && ($from_n >= 5 || $to_n == 1))
                        || ($type == "mid-week" && $num_nights >= 3 && $num_nights <= 5 && $from_n >= 1 && $from_n <= 3 && $to_n <= 5)
                        || ($type == "2-nights" && $num_nights == 2 && $from_n <= 5)
                        || ($type == "week" && $num_nights >= 6))
                        XOR ($type == "night")){
                        
                            // get common period between current rate and selected period
                            $start = ($start_date < $from_time) ? $from_time : $start_date;
                            $end = ($end_date > $to_time) ? $to_time : $end_date;
                            if($start_date > $from_time) $start-= 86400;
                            
                            $period = $end-$start;
                            if(date("I", $end) XOR date("I", $start)) $period -= 3600;
                            $n_period = ceil($period/86400);
                            
                            // number of nights
                            $nnights = 0;
                            $dst = date("I", $start);
                            for($date = $start; $date < ($start+(86400*$n_period)); $date += 86400){
                                $cur_dst = date("I", $date);
                                if($dst != $cur_dst){
                                    if($cur_dst == 0) $date += 3600;
                                    else $date -= 3600;
                                    $dst = $cur_dst;
                                }
                                $d = date("N", $date);
                                if(!in_array($date, $res_hotel[$id_hotel][$id_room]['days']) && (($type == "week-end" && ($d >= 5 && $to_n != 5)) || $type != "week-end")){
                                    $res_hotel[$id_hotel][$id_room]['days'][] = $date;
                                    $nnights++;
                                }
                            }
                            
                            if($num_people > $people && $people > 0){
                                
                                $extra_adults = ($num_adults > $people) ? $num_adults-$people : 0;
                                $extra_children = ($num_children > 0) ? $num_people-$people-$extra_adults : 0;
                                
                                if($child_price == 0 && $price_sup > 0) $child_price = $price_sup;
                                if($extra_children > 0) $price += $child_price*$extra_children;
                                if($price_sup > 0) $price += $price_sup*$extra_adults;
                            }
                            
                            $price = $nnights*$price;
                            $full_price = $price;
                            if($discount > 0) $price = $price-($price*$discount/100);
                            $vat_amount = $price-($price/($vat_rate/100+1));

                            if(!isset($res_hotel[$id_hotel][$id_room]['total_nights']) || $res_hotel[$id_hotel][$id_room]['total_nights']+$nnights <= $num_nights){
                                
                                if(isset($res_hotel[$id_hotel][$id_room]['amount'])) $res_hotel[$id_hotel][$id_room]['amount'] += $price;
                                else $res_hotel[$id_hotel][$id_room]['amount'] = $price;
                                
                                if(isset($res_hotel[$id_hotel][$id_room]['full_price'])) $res_hotel[$id_hotel][$id_room]['full_price'] += $full_price;
                                else $res_hotel[$id_hotel][$id_room]['full_price'] = $full_price;
                                
                                if(isset($res_hotel[$id_hotel][$id_room]['total_nights'])) $res_hotel[$id_hotel][$id_room]['total_nights'] += $nnights;
                                else $res_hotel[$id_hotel][$id_room]['total_nights'] = $nnights;
                                
                                if(isset($res_hotel[$id_hotel][$id_room]['vat_amount'])) $res_hotel[$id_hotel][$id_room]['vat_amount'] += $vat_amount;
                                else $res_hotel[$id_hotel][$id_room]['vat_amount'] = $vat_amount;
                                
                                $res_hotel[$id_hotel][$id_room]['min_stay'] = ((isset($res_hotel[$id_hotel][$id_room]['min_stay']) && $min_stay > $res_hotel[$id_hotel][$id_room]['min_stay']) || !isset($res_hotel[$id_hotel][$id_room]['min_stay'])) ? $min_stay : 0;
                                if($num_nights < $res_hotel[$id_hotel][$id_room]['min_stay']){
                                    $res_hotel[$id_hotel][$id_room]['error'] = true;
                                    $res_hotel[$id_hotel][$id_room]['notice'] = $texts['MIN_NIGHTS']." : ".$res_hotel[$id_hotel][$id_room]['min_stay'];
                                }
                                if((isset($res_hotel[$id_hotel][$id_room]['fixed_sup']) && $fixed_sup > $res_hotel[$id_hotel][$id_room]['fixed_sup']) || !isset($res_hotel[$id_hotel][$id_room]['fixed_sup'])){
                                    $res_hotel[$id_hotel][$id_room]['fixed_sup_amount'] = $fixed_sup;
                                    $res_hotel[$id_hotel][$id_room]['fixed_sup_vat'] = $fixed_sup-($fixed_sup/($vat_rate/100+1));
                                }else{
                                    $res_hotel[$id_hotel][$id_room]['fixed_sup_amount'] = 0;
                                    $res_hotel[$id_hotel][$id_room]['fixed_sup_vat'] = 0;
                                }
                            }
                        }
                    }
                }else
                    $res_hotel[$id_hotel][$id_room]['error'] = true;
            }
                       
            if(empty($res_hotel)) $msg_error .= $texts['NO_AVAILABILITY'];
        }
    }
}
$result_rating = $db->prepare("SELECT AVG(rating) as avg_rating FROM pm_comment WHERE item_type = 'hotel' AND id_item = :id_hotel AND checked = 1 AND rating > 0 AND rating <= 5");
$result_rating->bindParam(":id_hotel", $id_hotel);
                
$id_facility = 0;
$result_facility_file = $db->prepare("SELECT * FROM pm_facility_file WHERE id_item = :id_facility AND checked = 1 AND lang = ".DEFAULT_LANG." AND type = 'image' AND file != '' ORDER BY rank LIMIT 1");
$result_facility_file->bindParam(":id_facility", $id_facility);

$room_facilities = "0";
$result_room_facilities = $db->prepare("SELECT * FROM pm_facility WHERE lang = ".LANG_ID." AND FIND_IN_SET(id, :room_facilities) ORDER BY rank LIMIT 18");
$result_room_facilities->bindParam(":room_facilities", $room_facilities);

$hotel_facilities = "0";
$result_hotel_facilities = $db->prepare("SELECT * FROM pm_facility WHERE lang = ".LANG_ID." AND FIND_IN_SET(id, :hotel_facilities) ORDER BY rank LIMIT 8");
$result_hotel_facilities->bindParam(":hotel_facilities", $hotel_facilities);

$query_room = "SELECT * FROM pm_room WHERE id_hotel = :id_hotel AND checked = 1 AND lang = ".LANG_ID." ORDER BY";
if(isset($res_hotel[$id_hotel])) $query_room .= " CASE WHEN id IN(".implode(",", array_keys($res_hotel[$id_hotel])).") THEN 3 ELSE 4 END,";
$query_room .= " rank";
$result_room = $db->prepare($query_room);
$result_room->bindParam(":id_hotel", $id_hotel);

$id_room = 0;
$result_room_rate = $db->prepare("
    SELECT DISTINCT(price), type
    FROM pm_rate
    WHERE
        id_room = :id_room
        AND price IN(SELECT MIN(price) FROM pm_rate WHERE id_room = :id_room)
    ORDER BY price, CASE type
        WHEN 'week' THEN 1
        WHEN 'mid-week' THEN 2
        WHEN 'week-end' THEN 3
        WHEN '2-nights' THEN 4
        WHEN 'night' THEN 5
        ELSE 6 END
    LIMIT 1");
$result_room_rate->bindParam(":id_room", $id_room);

$result_hotel_rate = $db->prepare("
    SELECT DISTINCT(ra.price), type
    FROM pm_rate as ra, pm_room as ro
    WHERE ro.id = id_room
        AND id_hotel = :id_hotel
        AND ra.price IN(SELECT MIN(ra.price) FROM pm_rate as ra, pm_room as ro WHERE ro.id = id_room AND id_hotel = :id_hotel)
    ORDER BY ra.price, CASE type
        WHEN 'week' THEN 1
        WHEN 'mid-week' THEN 2
        WHEN 'week-end' THEN 3
        WHEN '2-nights' THEN 4
        WHEN 'night' THEN 5
        ELSE 6 END
    LIMIT 1");
$result_hotel_rate->bindParam(":id_hotel", $id_hotel);

$result_room_file = $db->prepare("SELECT * FROM pm_room_file WHERE id_item = :id_room AND checked = 1 AND lang = ".LANG_ID." AND type = 'image' AND file != '' ORDER BY rank LIMIT 1");
$result_room_file->bindParam(":id_room", $id_room);

$result_hotel_file = $db->prepare("SELECT * FROM pm_hotel_file WHERE id_item = :id_hotel AND checked = 1 AND lang = ".LANG_ID." AND type = 'image' AND file != '' ORDER BY rank LIMIT 1");
$result_hotel_file->bindParam(":id_hotel", $id_hotel);

$query_hotel = "SELECT * FROM pm_hotel WHERE checked = 1 AND lang = ".LANG_ID;
if($destination_id > 0) $query_hotel .= " AND id_destination = ".$destination_id;
$query_hotel .= " ORDER BY";
if($hotel_id != 0) $query_hotel .= " CASE WHEN id = ".$hotel_id." THEN 1 ELSE 2 END,";
if(!empty($res_hotel)) $query_hotel .= " CASE WHEN id IN(".implode(",", array_keys($res_hotel)).") THEN 3 ELSE 4 END,";
$query_hotel .= " rank";
$result_hotel = $db->query($query_hotel);
if($result_hotel !== false && $db->last_row_count() == 0){
    $msg_error .= $texts['NO_HOTEL_FOUND'];
    if($destination_name != "") $msg_error .= " ".$texts['FOR']." <b>".$destination_name."</b>";
}

 

/* ==============================================
 * CSS AND JAVASCRIPT USED IN THIS MODEL
 * ==============================================
 */

$javascripts[] = DOCBASE."js/plugins/jquery.sharrre-1.3.4/jquery.sharrre-1.3.4.min.js";

$javascripts[] = DOCBASE."js/plugins/jquery.event.calendar/js/jquery.event.calendar.js";
$javascripts[] = DOCBASE."js/plugins/jquery.event.calendar/js/languages/jquery.event.calendar.".LANG_TAG.".js";
$stylesheets[] = array("file" => DOCBASE."js/plugins/jquery.event.calendar/css/jquery.event.calendar.css", "media" => "all");

$stylesheets[] = array("file" => DOCBASE."js/plugins/owl-carousel/owl.carousel.css", "media" => "all");
$stylesheets[] = array("file" => DOCBASE."js/plugins/owl-carousel/owl.theme.css", "media" => "all");
$javascripts[] = DOCBASE."js/plugins/owl-carousel/owl.carousel.min.js";

$stylesheets[] = array("file" => DOCBASE."js/plugins/star-rating/css/star-rating.min.css", "media" => "all");
$javascripts[] = DOCBASE."js/plugins/star-rating/js/star-rating.min.js";

$stylesheets[] = array("file" => DOCBASE."js/plugins/isotope/css/style.css", "media" => "all");
$javascripts[] = DOCBASE."js/plugins/isotope/jquery.isotope.min.js";
$javascripts[] = DOCBASE."js/plugins/isotope/jquery.isotope.sloppy-masonry.min.js";

$stylesheets[] = array("file" => DOCBASE."js/plugins/lazyloader/lazyloader.css", "media" => "all");
$javascripts[] = DOCBASE."js/plugins/lazyloader/lazyloader.js";

$stylesheets[] = array("file" => DOCBASE."js/plugins/live-search/jquery.liveSearch.css", "media" => "all");
$javascripts[] = DOCBASE."js/plugins/live-search/jquery.liveSearch.js";

require(getFromTemplate("common/send_comment.php", false));

require(getFromTemplate("common/header.php", false));
 ?>

<section id="page">
    
    <?php include(getFromTemplate("common/page_header.php", false)); ?>
    
    <div id="content" class="pb30">
    
        <div id="search-page" class="mb30">
            <div class="container">
                <?php include(getFromTemplate("common/search.php", false)); ?>
            </div>
        </div>
        
        <div class="container">
            <div class="alert alert-success" style="display:none;"></div>
            <div class="alert alert-danger" style="display:none;"></div>
        </div>
    
        <article class="container">
            <div class="row">
                <div class="col-md-8 mb20">
                    <div class="row mb10">
                        <div class="col-sm-8">
                            <h1 class="mb0"><?php echo $hotel['title']; ?></h1>
                            <?php
                            $result_rating = $db->query("SELECT count(*) as count_rating, AVG(rating) as avg_rating FROM pm_comment WHERE item_type = 'hotel' AND id_item = ".$hotel_id." AND checked = 1 AND rating > 0 AND rating <= 5");
                            if($result_rating !== false && $db->last_row_count() == 1){
                                $row = $result_rating->fetch();
                                $hotel_rating = $row['avg_rating'];
                                $count_rating = $row['count_rating'];
                                
                                if($hotel_rating > 0 && $hotel_rating <= 5){ ?>
                                
                                    <input type="hidden" class="rating pull-left" value="<?php echo $hotel_rating; ?>" data-rtl="<?php echo (RTL_DIR) ? true : false; ?>" data-size="xs" readonly="true" data-default-caption="<?php echo $count_rating." ".$texts['RATINGS']; ?>" data-show-caption="true">
                                    <?php
                                }
                            } ?>
                            <div class="clearfix"></div>
                            <h2><?php echo $hotel['subtitle']; ?></h2>
                        </div>
                        <div class="col-sm-4 text-right">
                            <div class="price text-primary">
                                <?php
                                $min_price = 0;
                                $result_rate = $db->query("
                                    SELECT DISTINCT(ra.price), type
                                    FROM pm_rate as ra, pm_room as ro
                                    WHERE ro.id = id_room
                                        AND id_hotel = ".$hotel_id."
                                        AND ra.price IN(SELECT MIN(ra.price) FROM pm_rate as ra, pm_room as ro WHERE ro.id = id_room AND id_hotel = ".$hotel_id.")
                                    ORDER BY ra.price, CASE type
                                        WHEN 'week' THEN 1
                                        WHEN 'mid-week' THEN 2
                                        WHEN 'week-end' THEN 3
                                        WHEN '2-nights' THEN 4
                                        WHEN 'night' THEN 5
                                        ELSE 6 END
                                    LIMIT 1");
                                if($result_rate !== false && $db->last_row_count() == 1){
                                    $row = $result_rate->fetch();
                                    $price = $row['price'];
                                    if($price > 0) $min_price = $price;
                                }
                                if($min_price > 0){
                                    echo $texts['FROM_PRICE']; ?>
                                    <span itemprop="priceRange">
                                        <?php echo formatPrice($min_price*CURRENCY_RATE); ?>
                                    </span>
                                    / <?php echo $texts['NIGHT'];
                                } ?>
                            </div>
                        </div>
                    </div>
                    <div class="row mb10">
                        <div class="col-sm-12">
                            <?php
                            $result_facility = $db->query("SELECT * FROM pm_facility WHERE lang = ".LANG_ID." AND id IN(".$hotel['facilities'].") ORDER BY name",PDO::FETCH_ASSOC);
                            if($result_facility !== false && $db->last_row_count() > 0){
                                foreach($result_facility as $i => $row){
                                    $facility_id 	= $row['id'];
                                    $facility_name  = $row['name'];
                                    
                                    $result_facility_file = $db->query("SELECT * FROM pm_facility_file WHERE id_item = ".$facility_id." AND checked = 1 AND lang = ".DEFAULT_LANG." AND type = 'image' AND file != '' ORDER BY rank LIMIT 1",PDO::FETCH_ASSOC);
                                    if($result_facility_file !== false && $db->last_row_count() == 1){
                                        $row = $result_facility_file->fetch();
                                        
                                        $file_id 	= $row['id'];
                                        $filename 	= $row['file'];
                                        $label	 	= $row['label'];
                                        
                                        $realpath	= SYSBASE."medias/facility/big/".$file_id."/".$filename;
                                        $thumbpath	= DOCBASE."medias/facility/big/".$file_id."/".$filename;
                                            
                                        if(is_file($realpath)){ ?>
                                            <span class="facility-icon">
                                                <img alt="<?php echo $facility_name; ?>" title="<?php echo $facility_name; ?>" src="<?php echo $thumbpath; ?>" class="tips">
                                            </span>
                                            <?php
                                        }
                                    }
                                }
                            } ?>
                        </div>
                    </div>
                    <div class="row mb10">
                        <div class="col-md-12">
                            <div class="owl-carousel owlWrapper" data-items="1" data-autoplay="true" data-dots="true" data-nav="false" data-rtl="<?php echo (RTL_DIR) ? "true" : "false"; ?>">
                                <?php
                                $result_hotel_file = $db->query("SELECT * FROM pm_hotel_file WHERE id_item = ".$hotel_id." AND checked = 1 AND lang = ".DEFAULT_LANG." AND type = 'image' AND file != '' ORDER BY rank");
                                if($result_hotel_file !== false){
                                    
                                    foreach($result_hotel_file as $i => $row){
                                    
                                        $file_id = $row['id'];
                                        $filename = $row['file'];
                                        $label = $row['label'];
                                        
                                        $realpath = SYSBASE."medias/hotel/big/".$file_id."/".$filename;
                                        $thumbpath = DOCBASE."medias/hotel/big/".$file_id."/".$filename;
                                        
                                        if(is_file($realpath)){ ?>
                                            <img alt="<?php echo $label; ?>" src="<?php echo $thumbpath; ?>" class="img-responsive" style="max-height:600px;"/>
                                            <?php
                                        }
                                    }
                                } ?>
                            </div>
                        </div>
                    </div>
                    <div class="row mb10">
                        <div class="col-md-12" itemprop="description">
                            <?php echo $hotel['descr']; ?>
                        </div>
                    </div>
                    <div class="row mt30">
                        <?php
                        $lz_offset = 1;
                        $lz_limit = 9;
                        $lz_pages = 0;
                        $num_records = 0;
                        $result = $db->query("SELECT count(*) FROM pm_activity WHERE hotels REGEXP '(^|,)".$hotel_id."(,|$)' AND checked = 1 AND lang = ".LANG_ID);
                        if($result !== false){
                            $num_records = $result->fetchColumn(0);
                            $lz_pages = ceil($num_records/$lz_limit);
                        }
                        if($num_records > 0){ ?>
                            <h3><?php echo $texts['FIND_ACTIVITIES_AND_TOURS']; ?></h3>
                            <div class="isotopeWrapper clearfix isotope lazy-wrapper" data-loader="<?php echo getFromTemplate("common/get_activities.php"); ?>" data-mode="click" data-limit="<?php echo $lz_limit; ?>" data-pages="<?php echo $lz_pages; ?>" data-is_isotope="true" data-variables="page_id=<?php echo $sys_pages['activities']['id']; ?>&page_alias=<?php echo $sys_pages['activities']['alias']; ?>&hotel=<?php echo $hotel_id; ?>">
                                <?php include(getFromTemplate("common/get_activities.php", false)); ?>
                            </div>
                            <?php
                        } ?>
                    </div>
					
                    <div class="row">
                        <div class="col-md-12">
                            <?php
                            $nb_comments = 0;
                            $item_type = "hotel";
                            $item_id = $hotel_id;
                            $allow_comment = ALLOW_COMMENTS;
                            $allow_rating = ALLOW_RATINGS;
                            if($allow_comment == 1){
                                $result_comment = $db->query("SELECT * FROM pm_comment WHERE id_item = ".$item_id." AND item_type = '".$item_type."' AND checked = 1 ORDER BY add_date DESC");
                                if($result_comment !== false)
                                    $nb_comments = $db->last_row_count();
                            }
                            include(getFromTemplate("common/comments.php", false)); ?>
                        </div>
                    </div>
                </div>
                <aside class="col-md-4 mb20">
                    <div class="boxed-list">
                        <div itemscope itemtype="http://schema.org/Corporation">
                            <h3 itemprop="name" style="font-size:18px"><?php echo $hotel['title']; ?></h3>
                            <address>
                                <p>
                                    <i class="fa fa-map-marker"></i> <span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress"><?php echo $hotel['address']; ?></span><br>
                                    <?php if($hotel['phone'] != "") : ?><i class="fa fa-phone"></i> <span itemprop="telephone" dir="ltr"><?php echo $hotel['phone']; ?></span><br><?php endif; ?>
                                    <?php if($hotel['email'] != "") : ?><i class="fa fa-envelope"></i> <a itemprop="email" dir="ltr" href="mailto:<?php echo $hotel['email']; ?>"><?php echo $hotel['email']; ?></a><?php endif; ?>
                                </p>
                            </address>
                        </div>
                        <script type="text/javascript">
                            var locations = [
                                ['<?php echo $hotel['title']; ?>', '<?php echo $hotel['address']; ?>', '<?php echo $hotel['lat']; ?>', '<?php echo $hotel['lng']; ?>']
                            ];
                        </script>
                        <div id="mapWrapper" class="mb10" data-marker="<?php echo getFromTemplate("images/marker.png"); ?>" data-api_key="<?php echo GMAPS_API_KEY; ?>"></div>
                        <?php
                        $id_facility = 0;
                        $result_facility_file = $db->prepare("SELECT * FROM pm_facility_file WHERE id_item = :id_facility AND checked = 1 AND lang = ".DEFAULT_LANG." AND type = 'image' AND file != '' ORDER BY rank LIMIT 1");
                        $result_facility_file->bindParam(":id_facility", $id_facility);

                        $room_facilities = "0";
                        $result_facility = $db->prepare("SELECT * FROM pm_facility WHERE lang = ".LANG_ID." AND FIND_IN_SET(id, :room_facilities) ORDER BY rank LIMIT 8");
                        $result_facility->bindParam(":room_facilities", $room_facilities);
            
                        $id_room = 0;
                        $result_rate = $db->prepare("
                            SELECT DISTINCT(price), type
                            FROM pm_rate
                            WHERE
                                id_room = :id_room
                                AND price IN(SELECT MIN(price) FROM pm_rate WHERE id_room = :id_room)
                            ORDER BY price, CASE type
                                WHEN 'week' THEN 1
                                WHEN 'mid-week' THEN 2
                                WHEN 'week-end' THEN 3
                                WHEN '2-nights' THEN 4
                                WHEN 'night' THEN 5
                                ELSE 6 END
                            LIMIT 1");
                        $result_rate->bindParam(":id_room", $id_room);
                        
                        $result_room_file = $db->prepare("SELECT * FROM pm_room_file WHERE id_item = :id_room AND checked = 1 AND lang = ".LANG_ID." AND type = 'image' AND file != '' ORDER BY rank");
                        $result_room_file->bindParam(":id_room", $id_room, PDO::PARAM_STR);
                
                        $result_room = $db->query("SELECT * FROM pm_room WHERE id_hotel = ".$hotel_id." AND checked = 1 AND lang = ".LANG_ID." ORDER BY rank", PDO::FETCH_ASSOC);
                        if($result_room !== false && $db->last_row_count() > 0){ ?>
                            <p class="widget-title"><?php echo $texts['ROOMS']; ?></p>
                            
                            <?php
                            foreach($result_room as $i => $row){
                                $id_room = $row['id'];
                                $room_title = $row['title'];
                                $room_subtitle = $row['subtitle'];
                                $room_descr = $row['descr'];
                                $room_alias = $row['alias'];
                                $room_facilities = $row['facilities'];
                                $max_people = $row['max_people'];
                                $room_price = $row['price']; ?>
                                
                                <a class="popup-modal" href="#room-<?php echo $id_room; ?>">
                                    <div class="row">
                                        <div class="col-xs-4 mb20">
                                            <?php
                                            $result_room_file->execute();
                                            if($result_room_file !== false && $db->last_row_count() > 0){
                                                $row = $result_room_file->fetch(PDO::FETCH_ASSOC);
                                                
                                                $file_id = $row['id'];
                                                $filename = $row['file'];
                                                $label = $row['label'];
                                                
                                                $realpath = SYSBASE."medias/room/small/".$file_id."/".$filename;
                                                $thumbpath = DOCBASE."medias/room/small/".$file_id."/".$filename;
                                                    
                                                if(is_file($realpath)){ ?>
                                                    <div class="img-container sm">
                                                        <img alt="" src="<?php echo $thumbpath; ?>">
                                                    </div>
                                                    <?php
                                                }
                                            } ?>
                                        </div>
                                        <div class="col-xs-8">
                                            <h3 class="mb0"><?php echo $room_title; ?></h3>
                                            <h4 class="mb0"><?php echo $room_subtitle; ?></h4>
                                            <?php
                                            $min_price = $room_price;
                                            $result_rate->execute();
                                            if($result_rate !== false && $db->last_row_count() == 1){
                                                $row = $result_rate->fetch();
                                                $price = $row['price'];
                                                if($price > 0) $min_price = $price;
                                            } ?>
                                            <div class="price text-primary">
                                                <?php echo $texts['FROM_PRICE']; ?>
                                                <span itemprop="priceRange">
                                                    <?php echo formatPrice($min_price*CURRENCY_RATE); ?>
                                                </span>
                                                / <?php echo $texts['NIGHT']; ?>
                                            </div>
											<!---   TEST tombol booking-->
																						

											<p class="lead pt10">
											                                        									
												   <?php
												   
                                                        if(!isset($res_hotel[$id_hotel][$id_room]) || (isset($res_hotel[$id_hotel][$id_room]) && isset($res_hotel[$id_hotel][$id_room]['error']) && !isset($res_hotel[$id_hotel][$id_room]['notice']))){ ?>
                                                            <button class="btn btn-danger btn-block" disabled="disabled"><i class="fa fa-warning"></i> <?php echo $texts['NO_AVAILABILITY']; ?></small></button>
                                                            <?php
                                                            if(ENABLE_BOOKING_REQUESTS == 1){ ?>
                                                                <button name="request" class="btn btn-default btn-block"><i class="fa fa-comment"></i> <?php echo $texts['MAKE_A_REQUEST']; ?></small></button>
                                                                <?php
                                                            }
                                                        }elseif(isset($res_hotel[$id_hotel][$id_room]) && isset($res_hotel[$id_hotel][$id_room]['error']) && isset($res_hotel[$id_hotel][$id_room]['notice'])){ ?>
                                                            <button class="btn btn-danger btn-block" disabled="disabled"><i class="fa fa-warning"></i> <small><?php echo $res_hotel[$id_hotel][$id_room]['notice']; ?></small></button>
                                                            <?php
                                                        }elseif(isset($res_hotel[$id_hotel][$id_room]) && !isset($res_hotel[$id_hotel][$id_room]['error'])){ ?>
                                                            <button name="book" class="btn btn-success btn-lg btn-block"><i class="fa fa-hand-o-right"></i> <?php echo $texts['BOOK'] ?></button>
                                                            <?php
                                                        } ?>
                                                        <span class="clearfix"></span>
										
									</p>
											<!---   TEST tombol booking -->
											
											
                                        </div>
                                    </div>
                                </a>
                                <div id="room-<?php echo $id_room; ?>" class="white-popup-block mfp-hide">
                                    <div class="fluid-container">
                                        <div class="row">
                                            <div class="col-xs-12 mb20">
                                                <div class="owl-carousel" data-items="1" data-autoplay="true" data-dots="true" data-nav="false" data-rtl="<?php echo (RTL_DIR) ? "true" : "false"; ?>">
                                                    <?php
                                                    $result_room_file->execute();
                                                    if($result_room_file !== false){
                                                        foreach($result_room_file as $i => $row){
                                    
                                                            $file_id = $row['id'];
                                                            $filename = $row['file'];
                                                            $label = $row['label'];
                                                            
                                                            $realpath = SYSBASE."medias/room/medium/".$file_id."/".$filename;
                                                            $thumbpath = DOCBASE."medias/room/medium/".$file_id."/".$filename;
                                                            
                                                            if(is_file($realpath)){ ?>
                                                                <div><img alt="<?php echo $label; ?>" src="<?php echo $thumbpath; ?>" class="img-responsive" style="max-height:600px;"></div>
                                                                <?php
                                                            }
                                                        }
                                                    } ?>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <h3 class="mb0"><?php echo $room_title; ?></h3>
                                                <h4 class="mb0"><?php echo $room_subtitle; ?></h4>
                                            </div>
                                            <div class="col-sm-4 text-right">
                                                <?php
                                                $type = "night";
                                                $min_price = $room_price;
                                                $result_rate->execute();
                                                if($result_rate !== false && $db->last_row_count() == 1){
                                                    $row = $result_rate->fetch();
                                                    $price = $row['price'];
                                                    $type = $row['type'];
                                                    if($price > 0){
                                                        switch($type){
                                                            case "night": $type = $texts['NIGHT']; break;
                                                            case "week": $type = $texts['WEEK']; break;
                                                        }
                                                        $min_price = $price;
                                                    }
                                                }
                                                if($type == "night") $type = $texts['NIGHT']; ?>
                                                <div class="price text-primary">
                                                    <?php echo $texts['FROM_PRICE']; ?>
                                                    <span itemprop="priceRange">
                                                        <?php echo formatPrice($min_price*CURRENCY_RATE); ?>
                                                    </span>
                                                    / <?php echo $type; ?>
                                                </div>
                                                <p>
                                                    <?php echo $texts['CAPACITY']; ?> : <i class="fa fa-male"></i>x<?php echo $max_people; ?>
                                                </p>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="clearfix mb5">
                                                    <?php
                                                    $result_facility->execute();
                                                    if($result_facility !== false && $db->last_row_count() > 0){
                                                        foreach($result_facility as $row){
                                                            $id_facility = $row['id'];
                                                            $facility_name = $row['name'];
                                                            
                                                            $result_facility_file->execute();
                                                            if($result_facility_file !== false && $db->last_row_count() == 1){
                                                                $row = $result_facility_file->fetch();
                                                                
                                                                $file_id = $row['id'];
                                                                $filename = $row['file'];
                                                                $label = $row['label'];
                                                                
                                                                $realpath = SYSBASE."medias/facility/big/".$file_id."/".$filename;
                                                                $thumbpath = DOCBASE."medias/facility/big/".$file_id."/".$filename;
                                                                    
                                                                if(is_file($realpath)){ ?>
                                                                    <span class="facility-icon">
                                                                        <img alt="<?php echo $facility_name; ?>" title="<?php echo $facility_name; ?>" src="<?php echo $thumbpath; ?>" class="tips">
                                                                    </span>
                                                                    <?php
                                                                }
                                                            }
                                                        }
                                                    } ?>
                                                </div>
                                                <?php echo $room_descr; ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <?php
                            }
                        } ?>
                    </div>
                </aside>
            </div>
        </article>
    </div>
</section>
