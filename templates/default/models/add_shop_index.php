<?php  
// echo "<pre>"; print_r($this->data['shopDetails'][0]['seller_id']); die;
$seller_id = $this->data['shopDetails'][0]['seller_id'];
$this->load->view('site/templates/header_product'); 
$this->load->view('site/templates/commonheader'); 
?>

 <div id="home-slider" style="background: url(/images/shop/bg-shop.png) 0 100% repeat-x;
    position: relative;">
        <div class="container">
            <div class="row">
                <div class="main-slider">
                    <div class="slide-text">
                        <h1>Gabung di Pasarwarga</h1>
                        <p>Situs marketplace online terbesar dengan jutaan user yang mengakses dan belanja setiap hari di Pasarwarga. Buka lebar kesempatan kamu dengan membuka kios online disini.
 						</p>
                        <a href="<?php if($this->data['loginCheck'] !='' || $seller_id != ''){ echo site_url('shop/sell'); } else { echo site_url('login'); }  ?>" class="btn btn-common"><?php if( $seller_id !=''){ ?>  TOKO SAYA  <?php }else{ ?> BUKA TOKO  <?php }  ?></a>
                    </div>
                    <img src="images/shop/city.png" class="slider-hill" alt="slider image">
                    <img src="images/shop/store.png" class="slider-house" alt="slider image">
                    <img src="images/shop/balloon.png" class="slider-sun" alt="slider image">
                    <img src="images/shop/cloud.png" class="slider-birds1" alt="slider image">
                    <img src="images/shop/sun.gif" class="slider-birds2" alt="slider image">
                </div>
            </div>
        </div>
        <div class="preloader"><i class="fa fa-sun-o fa-spin"></i></div>
    </div>
    <!--/#home-slider-->

    <div id="services">
        <div class="container">
            <div class="row">
              <div class="col-md-12 text-center join-shop">
               <h1 class="title">Kenapa Berjualan di Pasarwarga?</h1>
                        <p>Keuntungan membuka kios online di Pasarwarga </p>
                </div>
                <div class="col-sm-4 text-center join-shop wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
                            <img src="images/aman.png" alt="">
                        </div>
                        <h2>Transaksi Aman</h2>
                        <p>Dijamin untuk tiap transaksi yang ada di Pasarwarga.</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center join-shop wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="600ms">
                            <img src="images/layanan-konsumen.png" alt="">
                        </div>
                        <h2>Layanan Konsumen</h2>
                        <p>Penjual tidak perlu repot untuk memasukkan produknya karena team kami siap membantu.</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center join-shop wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                            <img src="images/mudah-berjualan.png" alt="">
                        </div>
                        <h2>Mudah Berjualan</h2>
                        <p>Jutaan user yang mengunjungi setiap harinya maka semakin besar produk Anda terjual.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/#services-->

    <div id="action" class="responsive">
        <div class="vertical-center">
             <div class="container">
                <div class="row">
                    <div class="take-service">
                        <div class="col-sm-7 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                            <h1 class="title">Siap Untuk Berjualan?</h1>
                            <p>Daftarkan segera kios Anda dan kami akan siap membantu Anda.</p>
                        </div>
                        <div class="col-sm-5 text-center wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                            <div class="service-inner">
                                <a href="#" class="btn btn-common">MULAI JUALAN</a>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </div>
    <!--/#action-->

    <div id="features">
        <div class="container">
            <div class="row">
                <div class="single-features">
                    <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="images/shop/image1.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h3>Dimanapun lokasi toko Anda tetap bisa berjualan kepada seluruh user Pasar Warga di seluruh Indonesia</h3>
                    </div>
                </div>
                <div class="single-features">
                    <div class="col-sm-6 col-sm-offset-1 align-right wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h3>Team SBA kami selalu siap membantu dalam setiap proses seperti input barang dan update harga serta transaksi yang terjadi.</h3>
                    </div>
                    <div class="col-sm-5 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="images/shop/image1.png" class="img-responsive" alt="">
                    </div>
                </div>
                <div class="single-features">
                    <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="images/shop/image1.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h3>Perkuat brand online shop Anda dengan tampilan toko yang keren dan profesional seperti ribuan toko / online shop yang telah bergabung dengan kami.</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <!--/#features-->

    <div id="clients">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="clients text-center wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
                        <p><img src="images/shop/clients.png" class="img-responsive" alt=""></p>
                        <h1 class="title">Partner Pasarwarga</h1>
                        <p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br> Ut enim ad minim veniam, quis nostrud </p>
                    </div>
                    <div class="clients-logo wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/shop/client1.png" class="img-responsive" alt=""></a>
                        </div>
                        <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/shop/client1.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/shop/client1.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/shop/client1.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/shop/client1.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/shop/client1.png" class="img-responsive" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>

    <script type="text/javascript" src="js/assets/jquery.js"></script>
    <script type="text/javascript" src="js/assets/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/assets/wow.min.js"></script>
    <script type="text/javascript" src="js/assets/main.js"></script>   
  
<?php $this->load->view('site/templates/footer');?>