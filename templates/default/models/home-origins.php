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

require(getFromTemplate("common/header.php", false));

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
            $result_hotel = $db->query("SELECT * FROM pm_hotel WHERE lang = ".LANG_ID." AND checked = 1 AND home = 1 ORDER BY rank");
            if($result_hotel !== false){
                $nb_hotels = $db->last_row_count();
                $hotel_id = 0;
                $result_hotel_file = $db->prepare("SELECT * FROM pm_hotel_file WHERE id_item = :hotel_id AND checked = 1 AND lang = ".DEFAULT_LANG." AND type = 'image' AND file != '' ORDER BY rank LIMIT 1");
                $result_hotel_file->bindParam(":hotel_id",$hotel_id);
                foreach($result_hotel as $i => $row){
                    $hotel_id = $row['id'];
                    $hotel_title = $row['title'];
                    $hotel_alias = $row['title'];
                    $hotel_subtitle = $row['subtitle'];
                    
                    $hotel_alias = DOCBASE.$pages[9]['alias']."/".text_format($row['alias']); ?>
                    
                    <article class="col-sm-4 mb20" itemscope itemtype="http://schema.org/LodgingBusiness">
                        <a itemprop="url" href="<?php echo $hotel_alias; ?>" class="moreLink">
                            <?php
                            if($result_hotel_file->execute() !== false && $db->last_row_count() == 1){
                                $row = $result_hotel_file->fetch(PDO::FETCH_ASSOC);
                                
                                $file_id = $row['id'];
                                $filename = $row['file'];
                                $label = $row['label'];
                                
                                $realpath = SYSBASE."medias/hotel/small/".$file_id."/".$filename;
                                $thumbpath = DOCBASE."medias/hotel/small/".$file_id."/".$filename;
                                $zoompath = DOCBASE."medias/hotel/big/".$file_id."/".$filename;
                                
                                if(is_file($realpath)){ ?>
                                    <figure class="more-link">
                                        <div class="img-container md">
                                            <img alt="<?php echo $label; ?>" src="<?php echo $thumbpath; ?>">
                                        </div>
                                        <div class="more-content">
                                            <h3 itemprop="name"><?php echo $hotel_title; ?></h3>
                                        </div>
                                        <div class="more-action">
                                            <div class="more-icon">
                                                <i class="fa fa-link"></i>
                                            </div>
                                        </div>
                                    </figure>
                                    <?php
                                }
                            } ?>
                        </a> 
                    </article>
                    <?php
                }
            } ?>
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
								 <h2>
                    POPULAR DESTINATION CITIES
            </h2>
					
					<div class="grid">
						<div class="grid-item">
							<a href="jakarta" title="Jakarta" target="">
								<img src="/templates/default/images/cities/jakarta.jpg" alt="Jakarta" width="620" height="200" title="Jakarta">
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
						<div class="grid-item--width1">
							<a href="bandung" title="Bandung" target="">
								<img src="/templates/default/images/cities/bandung.jpg" alt="Bandung" width="300" height="200" title="Bandung">
								<div class="text-city">
								<h3 style="color:#fff;">
									Bandung
								</h3>

								<div class="start-price">
									 mulai dari <span class="price">Rp 81.818</span> 
								</div>  </div>

								
							</a>
						</div>
						<div class="grid-item--width1">
							<a href="yogya" title="Yogyakarta" target="">
								<img src="/templates/default/images/cities/yogyakarta.jpg" alt="Yogyakarta" width="300" height="200" title="Yogyakarta">
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
								<img src="/templates/default/images/cities/bali.jpg" alt="Bali" width="620" height="200" title="Bali">
								<div class="text-city">
								<h3 style="color:#fff;">
									Bali
								</h3>

								<div class="start-price">
									  mulai dari <span class="price">Rp 49.603</span> 
								</div> </div>

								
							</a>
						</div>
						<div class="grid-item--width2">
							<a href="bogor" title="Bogor" target="">
								<img src="/templates/default/images/cities/bogor.jpg" alt="Bogor" width="300" height="200" title="Bogor">
								<div class="text-city">
								<h3 style="color:#fff;">
									Bogor
								</h3>

								<div class="start-price">
									mulai dari <span class="price">Rp 123.967</span> 
								</div>  </div>

								
							</a>
						</div>
						<div class="grid-item--width2">
							<a href="surabaya" title="Surabaya" target="">
								<img src="/templates/default/images/cities/surabaya.jpg" alt="Surabaya" width="300" height="200" title="Surabaya">
								<div class="text-city">
								<h3 style="color:#fff;">
									Surabaya
								</h3>

								 <div class="start-price">
									 mulai dari <span class="price">Rp 61.982</span> 
								</div> </div>

								
							</a>
						</div>
						<div class="grid-item--width2">
							<a href="makassar" title="Makassar" target="">
								<img src="/templates/default/images/cities/makassar.jpg" alt="Makassar" width="300" height="200" title="Malang">
								<div class="text-city">
								<h3 style="color:#fff;">
									Makassar
								</h3>

								 <div class="start-price">
								mulai dari <span class="price">Rp 49.587</span> 
								</div>  </div>

								
							</a>
						</div>
						<div class="grid-item--width2">
							<a href="solo" title="Solo" target="">
								<img src="/templates/default/images/cities/solo.jpg" alt="Solo" width="300" height="200" title="Solo">
								<div class="text-city">
								<h3 style="color:#fff;">
									Solo
								</h3>

								<div class="start-price">
									 mulai dari <span class="price">Rp 99.174</span>
								</div> </div>

								
							</a>
						</div>
						<div class="grid-item--width2">
							<a href="semarang" title="Semarang" target="">
								<img src="/templates/default/images/cities/semarang.jpg" alt="Semarang" width="300" height="200" title="Semarang">
								<div class="text-city">
								<h3 style="color:#fff;">
									Semarang
								</h3>

								<div class="start-price">
									 mulai dari <span class="price">Rp 96.694</span>
								</div> </div>

								
							</a>
						</div>
						<div class="grid-item--width2">
							<a href="medan" title="Medan" target="">
								<img src="/templates/default/images/cities/medan.jpg" alt="Medan" width="300" height="200" title="Medan">
								<div class="text-city">
								<h3 style="color:#fff;">
									Medan
								</h3>
								
								<div class="start-price">
									 mulai dari <span class="price">Rp 82.645</span>
								</div> </div>
								
								
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
				<img src="/templates/default/images/iconic/room-bed.png"> 
                         <p class="amenities__element--text">Comfort Bedroom</p> 
                    </div>
                    <div class="amenities__wrapper">
						<img src="/templates/default/images/iconic/wifi.png"> 
                       <p class="amenities__element--text">Free Wi-Fi</p> 
                    </div>
                    <div class="amenities__wrapper">
						<img src="/templates/default/images/iconic/air-conditioner.png">
                        <p class="amenities__element--text">AC</p>
                    </div>
				       <div class="amenities__wrapper">
				<img src="/templates/default/images/iconic/monitor.png"> 
                         <p class="amenities__element--text">TV on Room</p> 
                    </div>
					<div class="amenities__wrapper">
				<img src="/templates/default/images/iconic/laptop.png"> 
                         <p class="amenities__element--text">Online Booking</p> 
				</div>
					  <div class="amenities__wrapper">
				<img src="/templates/default/images/iconic/24-hours.png"> 
                         <p class="amenities__element--text">24 Hours Service</p> 
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
