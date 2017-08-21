<?php
/* ==============================================
 * CSS AND JAVASCRIPT USED IN THIS MODEL
 * ==============================================
 */
$stylesheets[] = array("file" => DOCBASE."js/plugins/royalslider/royalslider.css", "media" => "all");
$stylesheets[] = array("file" => DOCBASE."templates/default/css/layout.css", "media" => "all");
$stylesheets[] = array("file" => DOCBASE."js/plugins/royalslider/skins/minimal-white/rs-minimal-white.css", "media" => "all");
$javascripts[] = DOCBASE."js/plugins/royalslider/jquery.royalslider.min.js";

$stylesheets[] = array("file" => DOCBASE."js/plugins/isotope/css/style.css", "media" => "all");
$javascripts[] = DOCBASE."js/plugins/isotope/jquery.isotope.min.js";
$javascripts[] = DOCBASE."js/plugins/isotope/jquery.isotope.sloppy-masonry.min.js";

$stylesheets[] = array("file" => DOCBASE."js/plugins/live-search/jquery.liveSearch.css", "media" => "all");
$javascripts[] = DOCBASE."js/plugins/live-search/jquery.liveSearch.js";

require(getFromTemplate("common/header_main.php", false));

$slide_id = 0;
$result_slide_file = $db->prepare("SELECT * FROM pm_slide_file WHERE id_item = :slide_id AND checked = 1 AND lang = ".DEFAULT_LANG." AND type = 'image' AND file != '' ORDER BY rank LIMIT 1");
$result_slide_file->bindParam("slide_id", $slide_id);

$result_slide = $db->query("SELECT * FROM pm_slide WHERE id_page = ".$page_id." AND checked = 1 AND lang = ".LANG_ID." ORDER BY rank", PDO::FETCH_ASSOC);
if($result_slide !== false){
	$nb_slides = $db->last_row_count();
	if($nb_slides > 0){ ?>
        
        <div id="search-home-wrapper">
            <div id="search-home" class="container">
                <?php include(getFromTemplate("common/search.php", false)); ?>
            </div>
        </div>
	
		<section id="sliderContainer">
            
            <div class="royalSlider rsMinW fullSized clearfix">
                <?php
                foreach($result_slide as $i => $row){
                    $slide_id = $row['id'];
                    $slide_legend = $row['legend'];
                    $url_video = $row['url'];
                    $id_page = $row['id_page'];
                    
                    $result_slide_file->execute();
                    
                    if($result_slide_file !== false && $db->last_row_count() == 1){
                        $row = $result_slide_file->fetch();
                        
                        $file_id = $row['id'];
                        $filename = $row['file'];
                        $label = $row['label'];
                        
                        $realpath = SYSBASE."medias/slide/big/".$file_id."/".$filename;
                        $thumbpath = DOCBASE."medias/slide/small/".$file_id."/".$filename;
                        $zoompath = DOCBASE."medias/slide/big/".$file_id."/".$filename;
                            
                        if(is_file($realpath)){ ?>
                        
                            <div class="rsContent">
                                <img class="rsImg" src="<?php echo $zoompath; ?>" alt=""<?php if($url_video != "") echo " data-rsVideo=\"".$url_video."\""; ?>>
                                <?php
                                if($slide_legend != ""){ ?>
                                    <div class="infoBlock" data-fade-effect="" data-move-offset="10" data-move-effect="bottom" data-speed="200">
                                        <?php echo $slide_legend; ?>
                                    </div>
                                    <?php
                                } ?>
                            </div>
                            <?php
                        }
                    }
                } ?>
            </div>
		</section>
		<?php
	}
} ?>
<section id="content" class="pt20 pb30">
    <div class="container">
	        <div class="row">
            <div class="col-md-12 text-center mb30">
                <h1 itemprop="name"><?php echo $page['title']; ?></h1>
                <?php
                if($page['subtitle'] != ""){ ?>
                    <h2><?php echo $page['subtitle']; ?></h2>
                    <?php
                } ?>
                <?php echo $page['text']; ?>
            </div>
        </div>
        <div class="row">
           <?php
            $result_article = $db->query("SELECT * FROM pm_article WHERE (id_page = ".$page_id." OR home = 1) AND checked = 1 AND (publish_date IS NULL || publish_date <= ".time().") AND (unpublish_date IS NULL || unpublish_date > ".time().") AND lang = ".LANG_ID." ORDER BY rank");
            if($result_article !== false){
                $nb_articles = $db->last_row_count();
                
                if($nb_articles > 0){ ?>
                    <div class="clearfix">
                        <?php
                        $article_id = 0;
                        $result_article_file = $db->prepare("SELECT * FROM pm_article_file WHERE id_item = :article_id AND checked = 1 AND lang = ".DEFAULT_LANG." AND type = 'image' AND file != '' ORDER BY rank LIMIT 1");
                        $result_article_file->bindParam(":article_id", $article_id);
                        foreach($result_article as $i => $row){
                            $article_id = $row['id'];
                            $article_title = $row['title'];
                            $article_alias = $row['alias'];
                            $article_text = strtrunc($row['text'], 1200, true, "");
                            $article_page = $row['id_page'];
                            
                            if(isset($pages[$article_page])){
                            $article_alias = DOCBASE.$pages[$article_page]['alias']."/".text_format($article_alias); ?>
                                
                    <div class="container">           								
					<div class="col-lg-12 ammenities">
								 			
					<div class="grid">
						<div class="grid-item">
							<a href="jakarta" title="Jakarta" target="">
								<img src="/pashotel/templates/default/images/cities/jakarta-2.jpg" alt="Jakarta" title="Jakarta">
								<div class="text-city">
								<h3 style="color:#fff;">
									Jakarta
								</h3>

								<div class="start-price">
								 mulai dari <span class="price">Rp 99.174</span>
								</div> 
								</div>
							</a>
						</div>
						<div class="grid-item">
							<a href="bandung" title="Bandung" target="">
								<img src="/pashotel/templates/default/images/cities/bandung.jpg" alt="Bandung" title="Bandung">
								<div class="text-city">
								<h3 style="color:#fff;">
									Bandung
								</h3>

								<div class="start-price">
									 mulai dari <span class="price">Rp 81.818</span> 
								</div>  </div>

								
							</a>
						</div>
						<div class="grid-item">
							<a href="yogya" title="Yogyakarta" target="">
								<img src="/pashotel/templates/default/images/cities/yogyakarta.jpg" alt="Yogyakarta" title="Yogyakarta">
								<div class="text-city">
								<h3 style="color:#fff;">
									Yogyakarta
								</h3>

								 <div class="start-price">
								mulai dari <span class="price">Rp 61.116</span> 
								</div> </div>

								
							</a>
						</div>
						<div class="grid-item">
							<a href="bali" title="Bali" target="">
								<img src="/pashotel/templates/default/images/cities/bali-2.jpg" alt="Bali" title="Bali">
								<div class="text-city">
								<h3 style="color:#fff;">
									Bali
								</h3>

								<div class="start-price">
									  mulai dari <span class="price">Rp 49.603</span> 
								</div> </div>

								
							</a>
						</div>
						
						<div class="grid-item">
							<a href="surabaya" title="Surabaya" target="">
								<img src="/pashotel/templates/default/images/cities/surabaya.jpg" alt="Surabaya" title="Surabaya">
								<div class="text-city">
								<h3 style="color:#fff;">
									Surabaya
								</h3>

								 <div class="start-price">
									 mulai dari <span class="price">Rp 61.982</span> 
								</div> </div>

								
							</a>
						</div>
						<div class="grid-item">
							<a href="makassar" title="Makassar" target="">
								<img src="/pashotel/templates/default/images/cities/makassar.jpg" alt="Makassar" title="Malang">
								<div class="text-city">
								<h3 style="color:#fff;">
									Makassar
								</h3>

								 <div class="start-price">
								mulai dari <span class="price">Rp 49.587</span> 
								</div>  </div>

								
							</a>
						</div>
						
						</div>
						<div class="clear"></div>
					</div>
				</div>
								 <div class="col-lg-12 ammenities">
								 <h2>
                    PASHOTEL ROOM FEATURES
            </h2>
			
			<div class="col-lg-12 wrapper">
                  <div class="amenities__wrapper">
				<img src="/pashotel/templates/default/images/iconic/room-bed.png"> 
                         <p class="amenities__element--text">Comfort Bedroom</p> 
                    </div>
                    <div class="amenities__wrapper">
						<img src="/pashotel/templates/default/images/iconic/wifi.png"> 
                       <p class="amenities__element--text">Free Wi-Fi</p> 
                    </div>
                    <div class="amenities__wrapper">
						<img src="/pashotel/templates/default/images/iconic/air-conditioner.png">
                        <p class="amenities__element--text">AC</p>
                    </div>
				       <div class="amenities__wrapper">
				<img src="/pashotel/templates/default/images/iconic/monitor.png"> 
                         <p class="amenities__element--text">TV on Room</p> 
                    </div>
					<div class="amenities__wrapper">
				<img src="/pashotel/templates/default/images/iconic/laptop.png"> 
                         <p class="amenities__element--text">Online Booking</p> 
				</div>
					  <div class="amenities__wrapper">
				<img src="/pashotel/templates/default/images/iconic/24-hours.png"> 
                         <p class="amenities__element--text">24 Hours Service</p> 
                    </div>
				</div>
				</div>
				
				  <div id="content" class="pt30 pb20">
        <div class="container">
            <div class="row">
                
				<h2 style="text-align:center"> PROMO HOTELS </h2>
            </div>
            <div class="row">
                <?php
                $lz_offset = 1;
                $lz_limit = 12;
                $lz_pages = 0;
                $num_records = 0;
                $result = $db->query("SELECT count(*) FROM pm_hotel WHERE checked = 1 AND lang = ".LANG_ID);
                if($result !== false){
                    $num_records = $result->fetchColumn(0);
                    $lz_pages = ceil($num_records/$lz_limit);
                }
                if($num_records > 0){ ?>
                    <div class="isotopeWrapper clearfix isotope lazy-wrapper" data-loader="<?php echo getFromTemplate("common/get_rooms.php"); ?>" data-mode="click" data-limit="<?php echo $lz_limit; ?>" data-pages="<?php echo $lz_pages; ?>" data-is_isotope="true" >
                        <?php include(getFromTemplate("common/get_rooms.php", false)); ?>
                    </div>
                    <?php
                } ?>
            </div>
        </div>
    </div>
                                        
            </div>
                                <?php
                            }
                        } ?>
                    </div>
                    <?php
                }
            } ?>
        </div>
    </div>
</section>
