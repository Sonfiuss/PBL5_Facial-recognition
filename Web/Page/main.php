<div class="main">
    <div class="sidebar" >
                    <ul class="list_sidebar">
                        <li><a href="index.php?quanly=CNTT&id=1">Khoa Công nghệ thông tin</a></li>
                        <li><a href="index.php?quanly=DTVT&id=2">Khoa Điện tử viễn thông</a></li>
                        <li><a href="index.php?quanly=CK">Khoa Cơ khí</a></li>
                        <li><a href="index.php?quanly=H">Khoa Hóa</a></li>
                        <li><a href="index.php?quanly=QLDA">Khoa Quản lý dự án</a></li>
                        <li><a href="index.php?quanly=D">Khoa Điện</a></li>
                    </ul>   
    </div>
    <div class="maincontent">
                <?php
                    if(isset($_GET['quanly'])){
                        $quanly = $_GET['quanly'];
                    }else{
                        $quanly = 'CNTT';
                    }
                    if($quanly =="CNTT"){
                        include("Main/maincontent/CNTT.php");
                    }
                    elseif($quanly =="DTVT"){
                        include("Main/maincontent/DTVT.php");
                    }
                    elseif($quanly =="H"){
                        include("Main/maincontent/H.php");
                    }
                    elseif($quanly =="QLDA"){
                        include("Main/maincontent/QLDA.php");
                    }
                    elseif($quanly =="CK"){
                        include("Main/maincontent/CK.php");
                    }
                    elseif($quanly =="D"){
                        include("Main/maincontent/D.php");
                    }

                ?>
    </div>
</div>