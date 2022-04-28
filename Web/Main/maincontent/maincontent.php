<div class="maincontent">
                <?php
                    if(isset($_GET['quanly'])){
                        $quanly = $_GET['quanly'];
                    }else{
                        $quanly = 'CNTT';
                    }
                    if($quanly =="CNTT"){
                        include("CNTT.php");
                    }
                    elseif($quanly =="DTVT"){
                        include("DTVT.php");
                    }
                    elseif($quanly =="H"){
                        include("H.php");
                    }
                    elseif($quanly =="QLDA"){
                        include("QLDA.php");
                    }
                    elseif($quanly =="CK"){
                        include("CK.php");
                    }
                    elseif($quanly =="D"){
                        include("D.php");
                    }

                ?>
</div>