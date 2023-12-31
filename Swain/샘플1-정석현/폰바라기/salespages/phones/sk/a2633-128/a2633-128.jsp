<!DOCTYPE html>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.sql.DriverManager"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>|| SK - 폰바라기 - 아이폰 13 128GB ||</title>
    <style>
        a{
            display:block;
        }
        #headLogo{
            margin: 0 auto;
            width:225px;
            height:auto;
            margin-top:10px;
        }
        #headLogo > a > img{
            width:225px;
        }
        #headLogo2{
            margin: 0 auto;
            width:50px;
            height:auto;
        }
        #headLogo2 > a > img{
            width:50px;
        }
        #navBar {
            width: 100%;
            height: 40px;
            background-color: #ffca5f;
        }
        #navBarBox {
            width: 100%;
            max-width: 1024px;
            height: 40px;
            margin: 0 auto;
        }
        #navBarButton{
            display: table;
            margin: 0 auto;
            overflow: hidden;
        }
        #navBarButton > li a:hover, #navBarButton > li a:active {
            cursor: pointer;
            background-color: #a1d852;
        }
        .nav{
            list-style: none;
            display :block;
            float:left;
            margin-left: 30px;
            margin-right: 30px;
            line-height: 40px;
        }
        .nav>a{
            text-decoration: none;
            color : black;
            font-size: 25px;
        }
          /* ----    -------------------------------------------------------------------------   */
        #pro_content_box{
            max-width: 900px;;
            margin: 0 auto;
            overflow: hidden;
        }
        #pro_itembox{
            float:left;
            margin-top: 10px;
            margin-left:50px;
            border-radius: 25px;
        }
        .pro_pimg {
            width:300px;
            border-radius: 25px;
            max-width: 300px;
            max-height: 450px;
            margin : auto 0;
        }
        #calcpad{
            float:left;
            width:240px;
            height: 450px;
            border-radius: 25px;
            border: 1px solid black;
            margin-top: 10px;
            margin-left:10px;
        }
        #buttonpad{
            float:left;
            width:240px;
            height: 450px;
            border-radius: 25px;
            border: 1px solid black;
            margin-left:10px;
            margin-top: 10px;
        }
        .ruler{
            max-width: 800px;
        }
        .productName{
            display: inline-block;
            margin-top:20px;
            margin-bottom:10px;
            text-align: left;
            margin-left:40px;
        }
        /* ----------------------------------------------------------------- */
        
    </style>
    <script>
        function getDiscount(event) {
            var dis1 = event.target.value;
            let result = addComma(dis1);
            document.getElementById('discount1').innerText = result;
            final();
        }
        function getpfDiscount(event) {
            var dis2 = event.target.value;
            let result = addComma(dis2);
            document.getElementById('discount2').innerText = result;
            final();
        }
        function getCharge(event) {
            var charger = event.target.value;
            let result = addComma(charger);
            document.getElementById('off_charge').innerText = result;
            final();
        }
        function removeComma(a){
            let wow = a;
            var result = a.replace(/,/g, "");
            return result;
        }
        function addComma(a){
            let wow = a;
            let result = wow.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            return result;
        }
        function set_subsidies(){
            let MNP = document.getElementById("MNP").checked;
            let CHANGE = document.getElementById("CHANGE").checked;
            let anncdck = document.getElementById("anncd_subsidies").checked;
            let slctvck = document.getElementById("slctv_contract").checked;
            let MNPanncdexist = !!document.getElementById("mapf1");
            let MNPslctvexist = !!document.getElementById("mbpf1");
            let CHANGEanncdexist = !!document.getElementById("apf1");
            let CHANGEslctvexist = !!document.getElementById("bpf1");
            if (MNPanncdexist==false){
                document.getElementById("pf1").setAttribute('id', 'mapf1');
                document.getElementById("pf2").setAttribute('id', 'mapf2');
                document.getElementById("pf3").setAttribute('id', 'mapf3');
                document.getElementById("pf4").setAttribute('id', 'mapf4');
                document.getElementById("pf5").setAttribute('id', 'mapf5');
                document.getElementById("pf6").setAttribute('id', 'mapf6');
                document.getElementById("pf7").setAttribute('id', 'mapf7');
                document.getElementById("pf8").setAttribute('id', 'mapf8');
                document.getElementById("pf9").setAttribute('id', 'mapf9');
                document.getElementById("pf10").setAttribute('id', 'mapf10');
            }else if (MNPslctvexist==false){
                document.getElementById("pf1").setAttribute('id', 'mbpf1');
                document.getElementById("pf2").setAttribute('id', 'mbpf2');
                document.getElementById("pf3").setAttribute('id', 'mbpf3');
                document.getElementById("pf4").setAttribute('id', 'mbpf4');
                document.getElementById("pf5").setAttribute('id', 'mbpf5');
                document.getElementById("pf6").setAttribute('id', 'mbpf6');
                document.getElementById("pf7").setAttribute('id', 'mbpf7');
                document.getElementById("pf8").setAttribute('id', 'mbpf8');
                document.getElementById("pf9").setAttribute('id', 'mbpf9');
                document.getElementById("pf10").setAttribute('id', 'mbpf10');
            }else if (CHANGEanncdexist==false){
                document.getElementById("pf1").setAttribute('id', 'apf1');
                document.getElementById("pf2").setAttribute('id', 'apf2');
                document.getElementById("pf3").setAttribute('id', 'apf3');
                document.getElementById("pf4").setAttribute('id', 'apf4');
                document.getElementById("pf5").setAttribute('id', 'apf5');
                document.getElementById("pf6").setAttribute('id', 'apf6');
                document.getElementById("pf7").setAttribute('id', 'apf7');
                document.getElementById("pf8").setAttribute('id', 'apf8');
                document.getElementById("pf9").setAttribute('id', 'apf9');
                document.getElementById("pf10").setAttribute('id', 'apf10');
            }else if (CHANGEslctvexist==false){
                document.getElementById("pf1").setAttribute('id', 'bpf1');
                document.getElementById("pf2").setAttribute('id', 'bpf2');
                document.getElementById("pf3").setAttribute('id', 'bpf3');
                document.getElementById("pf4").setAttribute('id', 'bpf4');
                document.getElementById("pf5").setAttribute('id', 'bpf5');
                document.getElementById("pf6").setAttribute('id', 'bpf6');
                document.getElementById("pf7").setAttribute('id', 'bpf7');
                document.getElementById("pf8").setAttribute('id', 'bpf8');
                document.getElementById("pf9").setAttribute('id', 'bpf9');
                document.getElementById("pf10").setAttribute('id', 'bpf10');
            }

            if (MNP==true && anncdck==true){
            document.getElementById("mapf1").setAttribute('id', 'pf1');
            document.getElementById("mapf2").setAttribute('id', 'pf2');
            document.getElementById("mapf3").setAttribute('id', 'pf3');
            document.getElementById("mapf4").setAttribute('id', 'pf4');
            document.getElementById("mapf5").setAttribute('id', 'pf5');
            document.getElementById("mapf6").setAttribute('id', 'pf6');
            document.getElementById("mapf7").setAttribute('id', 'pf7');
            document.getElementById("mapf8").setAttribute('id', 'pf8');
            document.getElementById("mapf9").setAttribute('id', 'pf9');
            document.getElementById("mapf10").setAttribute('id', 'pf10');
            slctvcalc1();
            monthdiv();
            final();
            }else if(MNP==true&& slctvck==true){
            document.getElementById("mbpf1").setAttribute('id', 'pf1');
            document.getElementById("mbpf2").setAttribute('id', 'pf2');
            document.getElementById("mbpf3").setAttribute('id', 'pf3');
            document.getElementById("mbpf4").setAttribute('id', 'pf4');
            document.getElementById("mbpf5").setAttribute('id', 'pf5');
            document.getElementById("mbpf6").setAttribute('id', 'pf6');
            document.getElementById("mbpf7").setAttribute('id', 'pf7');
            document.getElementById("mbpf8").setAttribute('id', 'pf8');
            document.getElementById("mbpf9").setAttribute('id', 'pf9');
            document.getElementById("mbpf10").setAttribute('id', 'pf10');
            slctvcalc1()
            monthdiv();
            final();
            }else if(CHANGE==true&& anncdck==true){
            document.getElementById("apf1").setAttribute('id', 'pf1');
            document.getElementById("apf2").setAttribute('id', 'pf2');
            document.getElementById("apf3").setAttribute('id', 'pf3');
            document.getElementById("apf4").setAttribute('id', 'pf4');
            document.getElementById("apf5").setAttribute('id', 'pf5');
            document.getElementById("apf6").setAttribute('id', 'pf6');
            document.getElementById("apf7").setAttribute('id', 'pf7');
            document.getElementById("apf8").setAttribute('id', 'pf8');
            document.getElementById("apf9").setAttribute('id', 'pf9');
            document.getElementById("apf10").setAttribute('id', 'pf10');
            slctvcalc1();
            monthdiv();
            final();
            }else if(CHANGE==true&&slctvck==true){
            document.getElementById("bpf1").setAttribute('id', 'pf1');
            document.getElementById("bpf2").setAttribute('id', 'pf2');
            document.getElementById("bpf3").setAttribute('id', 'pf3');
            document.getElementById("bpf4").setAttribute('id', 'pf4');
            document.getElementById("bpf5").setAttribute('id', 'pf5');
            document.getElementById("bpf6").setAttribute('id', 'pf6');
            document.getElementById("bpf7").setAttribute('id', 'pf7');
            document.getElementById("bpf8").setAttribute('id', 'pf8');
            document.getElementById("bpf9").setAttribute('id', 'pf9');
            document.getElementById("bpf10").setAttribute('id', 'pf10');
            slctvcalc1();
            monthdiv();
            final();
            }
        }
        function slctvcalc1(){
            let charge = document.getElementById("off_charge").innerText;
            charge = addComma(charge);
            document.getElementById("off_charge").innerText = charge;
            let dis1 = document.getElementById('off_discount1').innerText;
            dis1 = addComma(dis1);
            document.getElementById("off_discount1").innerText = dis1;
            let fin = parseInt(removeComma(charge))-parseInt(removeComma(dis1));
            addComma(fin);
            document.getElementById('mon_charge').innerText = fin;
        }
        function slctvcalc(event){
            let charger = event.target.value;
            let result = removeComma(charger);
            let res = result/100*25;
            res = addComma(res);
            document.getElementById('off_discount1').innerText = res;
            res = removeComma(res);
            res =  result/100*75;
            res = addComma(res);
            document.getElementById('mon_charge').innerText = res;
        }
        
        

        function charge1(event){
            let anncdck = document.getElementById("anncd_subsidies").checked;
            if (anncdck){
                let anncd = document.getElementById("anncd1").innerText;
                let anncd1 = addComma(anncd);
                document.getElementById("discount1").innerText = anncd1;
                document.getElementById('off_discount1').innerText = "0";
                document.getElementById('mon_charge').innerText = event.target.value;
            }else{
                document.getElementById("discount1").innerText = "0";
                slctvcalc(event);
            }
            let addit = document.getElementById("pf1").innerText;
            addit = addComma(addit);
            document.getElementById("discount2").innerText = addit;
            getCharge(event);
            monthdiv();
        }
        function charge2(event){
            let anncdck = document.getElementById("anncd_subsidies").checked;
            if (anncdck){
                let anncd = document.getElementById("anncd2").innerText;
                let anncd1 = addComma(anncd);
                document.getElementById("discount1").innerText = anncd1;
                document.getElementById('off_discount1').innerText = "0";
                document.getElementById('mon_charge').innerText = event.target.value;
            }else{
                document.getElementById("discount1").innerText = "0";
                slctvcalc(event);
            }
            let addit = document.getElementById("pf2").innerText;
            addit = addComma(addit);
            document.getElementById("discount2").innerText = addit;
            getCharge(event);
            monthdiv();
        }
        function charge3(event){
            let anncdck = document.getElementById("anncd_subsidies").checked;
            if (anncdck){
                let anncd = document.getElementById("anncd3").innerText;
                let anncd1 = addComma(anncd);
                document.getElementById("discount1").innerText = anncd1;
                document.getElementById('off_discount1').innerText = "0";
                document.getElementById('mon_charge').innerText = event.target.value;
            }else{
                document.getElementById("discount1").innerText = "0";
                slctvcalc(event);
            }
            let addit = document.getElementById("pf3").innerText;
            addit = addComma(addit);
            document.getElementById("discount2").innerText = addit;
            getCharge(event);
            monthdiv();
        }
        function charge4(event){
            let anncdck = document.getElementById("anncd_subsidies").checked;
            if (anncdck){
                let anncd = document.getElementById("anncd4").innerText;
                let anncd1 = addComma(anncd);
                document.getElementById("discount1").innerText = anncd1;
                document.getElementById('off_discount1').innerText = "0";
                document.getElementById('mon_charge').innerText = event.target.value;
            }else{
                document.getElementById("discount1").innerText = "0";
                slctvcalc(event);
            }
            let addit = document.getElementById("pf4").innerText;
            addit = addComma(addit);
            document.getElementById("discount2").innerText = addit;
            getCharge(event);
            monthdiv();
        }
        function charge5(event){
            let anncdck = document.getElementById("anncd_subsidies").checked;
            if (anncdck){
                let anncd = document.getElementById("anncd5").innerText;
                let anncd1 = addComma(anncd);
                document.getElementById("discount1").innerText = anncd1;
                document.getElementById('off_discount1').innerText = "0";
                document.getElementById('mon_charge').innerText = event.target.value;
            }else{
                document.getElementById("discount1").innerText = "0";
                slctvcalc(event);
            }
            let addit = document.getElementById("pf5").innerText;
            addit = addComma(addit);
            document.getElementById("discount2").innerText = addit;
            getCharge(event);
            monthdiv();
        }
        function charge6(event){
            let anncdck = document.getElementById("anncd_subsidies").checked;
            if (anncdck){
                let anncd = document.getElementById("anncd6").innerText;
                let anncd1 = addComma(anncd);
                document.getElementById("discount1").innerText = anncd1;
                document.getElementById('off_discount1').innerText = "0";
                document.getElementById('mon_charge').innerText = event.target.value;
            }else{
                document.getElementById("discount1").innerText = "0";
                slctvcalc(event);
            }
            let addit = document.getElementById("pf6").innerText;
            addit = addComma(addit);
            document.getElementById("discount2").innerText = addit;
            getCharge(event);
            monthdiv();
        }
        function charge7(event){
            let anncdck = document.getElementById("anncd_subsidies").checked;
            if (anncdck){
                let anncd = document.getElementById("anncd7").innerText;
                let anncd1 = addComma(anncd);
                document.getElementById("discount1").innerText = anncd1;
                document.getElementById('off_discount1').innerText = "0";
                document.getElementById('mon_charge').innerText = event.target.value;
            }else{
                document.getElementById("discount1").innerText = "0";
                slctvcalc(event);
            }
            let addit = document.getElementById("pf7").innerText;
            addit = addComma(addit);
            document.getElementById("discount2").innerText = addit;
            getCharge(event);
            monthdiv();
        }
        function charge8(event){
            let anncdck = document.getElementById("anncd_subsidies").checked;
            if (anncdck){
                let anncd = document.getElementById("anncd8").innerText;
                let anncd1 = addComma(anncd);
                document.getElementById("discount1").innerText = anncd1;
                document.getElementById('off_discount1').innerText = "0";
                document.getElementById('mon_charge').innerText = event.target.value;
            }else{
                document.getElementById("discount1").innerText = "0";
                slctvcalc(event);
            }
            let addit = document.getElementById("pf8").innerText;
            addit = addComma(addit);
            document.getElementById("discount2").innerText = addit;
            getCharge(event);
            monthdiv();
        }
        function charge9(event){
            let anncdck = document.getElementById("anncd_subsidies").checked;
            if (anncdck){
                let anncd = document.getElementById("anncd9").innerText;
                let anncd1 = addComma(anncd);
                document.getElementById("discount1").innerText = anncd1;
                document.getElementById('off_discount1').innerText = "0";
                document.getElementById('mon_charge').innerText = event.target.value;
            }else{
                document.getElementById("discount1").innerText = "0";
                slctvcalc(event);
            }
            let addit = document.getElementById("pf9").innerText;
            addit = addComma(addit);
            document.getElementById("discount2").innerText = addit;
            getCharge(event);
            monthdiv();
        }
        function charge10(event){
            let anncdck = document.getElementById("anncd_subsidies").checked;
            if (anncdck){
                let anncd = document.getElementById("anncd10").innerText;
                let anncd1 = addComma(anncd);
                document.getElementById("discount1").innerText = anncd1;
                document.getElementById('off_discount1').innerText = "0";
                document.getElementById('mon_charge').innerText = event.target.value;
            }else{
                document.getElementById("discount1").innerText = "0";
                slctvcalc(event);
            }
            let addit = document.getElementById("pf10").innerText;
            addit = addComma(addit);
            document.getElementById("discount2").innerText = addit;
            getCharge(event);
            monthdiv();
        }

        function buyat(){
            let yyprice = document.getElementById("price").innerText;
            yyprice = removeComma(yyprice);
            let yydis1 = document.getElementById("discount1").innerText;
            yydis1 = removeComma(yydis1);
            let yydis2 = document.getElementById("discount2").innerText;
            yydis2 = removeComma(yydis2);
            let result = parseInt(yyprice)- parseInt(yydis1)-parseInt(yydis2);
            result = addComma(result);
            document.getElementById('buyat').innerText  = result;
        }
        function monthdiv(){
            let mon24 = document.getElementById("month24").checked;
            let mon30 = document.getElementById("month30").checked;
            let mon36 = document.getElementById("month36").checked;
            if (mon24){
            let buyat = document.getElementById("buyat").innerText;
            buyat = removeComma(buyat);
            let fin = parseInt(buyat) / 24;
            fin = Math.floor(fin);
            fin = addComma(fin);
            document.getElementById('buyatdivmon').innerText  = fin;
            final();
            }else if (mon30){
            let buyat = document.getElementById("buyat").innerText;
            buyat = removeComma(buyat);
            let fin = parseInt(buyat) / 30;
            fin = Math.floor(fin);
            fin = addComma(fin);
            document.getElementById('buyatdivmon').innerText  = fin;
            final();
            }else if (mon36){
            let buyat = document.getElementById("buyat").innerText;
            buyat = removeComma(buyat);
            let fin = parseInt(buyat) / 36;
            fin = Math.floor(fin);
            fin = addComma(fin);
            document.getElementById('buyatdivmon').innerText  = fin;
            final();
            }
        }
        function final(){
            let device =document.getElementById('buyatdivmon').innerText;
            device = removeComma(device);
            let charge =document.getElementById('mon_charge').innerText;
            charge = removeComma(charge);
            let finfin = parseInt(device)+parseInt(charge);
            finfin=addComma(finfin);
            document.getElementById('pay').innerText  = finfin;
        }
 
        
    </script>
</head>
<body>
        <div id="headLogo">
          <a href="../../../../demo.html">
            <img src="../../../../logos/logo.png" alt="폰바라기">
          </a>
        </div>
        <div id="headLogo2">
          <a href="../../../sk_sales.html">
            <img src="../../../../logos/skt_img.png" alt="SK LOGO">
          </a>
        </div>

        <div id="navBar">
            <div id="navBarBox">
                <ul id = "navBarButton">
                    <li class="nav"><a href="../../../sk_sales.html">&nbsp;SK&nbsp;</a></li>
                    <li class="nav"><a href="../../../lg_sales.html">&nbsp;LG&nbsp;</a></li>
                    <li class="nav"><a href="../../../sk_sales.html">&nbsp;KT&nbsp;</a></li>
                    <li class="nav"><a href="#">갤럭시</a></li>
                    <li class="nav"><a href="#">아이폰</a></li>
                    <li class="nav"><a href="#">공짜폰</a></li>
                </ul>
            </div>
        </div>


        <section id="pro_content_box">
            <div id="productNameBox">
                <h2 class="productName"> &nbsp;아이폰 13 128GB&nbsp; </h2>
            </div>
            
    <hr class="ruler">
            <div id="pro_itembox">
                    <img class="pro_pimg" src="../../../../img/iphone/13.jpg"><br>
                    <!-- <button style="height:10px;" onclick='calc_go()'>meow
                    </button> -->
            </div>
            <div id="buttonpad">
                <aside id="main_aside">            <!--2행 콘텐츠 사이드-->
                    <div>
                    <input type="radio" class="dis1" name="pfdiscount" value="444444" id="MNP" onclick=";" checked>
                    번호이동
                    </input>
                    <input type="radio" class="dis1" name="pfdiscount" value="555555"id="CHANGE" onclick="">
                    기기변경
                    </input><br>
                    </div>


                    <div>
                    <input type="radio" class="dis2" name="discount" value="111111" id="slctv_contract" onclick="" checked>
                    선택약정할인
                    </input>
                    <input type="radio" class="dis2" name="discount" value="222222"id="anncd_subsidies" onclick="">
                    공시지원금
                    </input><br>
                    </div>

                    <div>
                        <input type="radio" class="mon" name="month" value="24" id="month24" onclick="" checked>
                        24
                        </input>
                        <input type="radio" class="mon" name="month" value="30"id="month30" onclick="">
                        30
                        </input>
                        <input type="radio" class="mon" name="month" value="36"id="month36" onclick="">
                        36
                        </input><br>
                        </div>

                    <div>
                    <input type="radio" class="charge" name="charge" id="charge1" value="130000"onclick="">
                    5GX 프라임 플러스
                    </input><br>
                    <input type="radio" class="charge" name="charge" id="charge2" value="110000" onclick="" checked>
                    5GX 프라임
                    </input><br>
                    <input type="radio" class="charge" name="charge" id="charge3" value="90000" onclick="">
                    5GX 레귤러 플러스
                    </input><br>
                    <input type="radio" class="charge" name="charge" id="charge4" value="80000" onclick="">
                    5GX 레귤러
                    </input><br>
                    <input type="radio" class="charge" name="charge" id="charge5" value="70000" onclick="">
                    베이직 플러스
                    </input><br>
                    <input type="radio" class="charge" name="charge" id="charge6" value="50000" onclick="">
                    슬림
                    </input><br>
                    <input type="radio" class="charge" name="charge" id="charge7" value="40000" onclick="">
                    베이직
                    </input><br>
                    <input type="radio" class="charge" name="charge" id="charge8" value="30000" onclick="">
                    0틴 5G(만 18세 이하)
                    </input><br>
                    <input type="radio" class="charge" name="charge" id="charge9" value="20000" onclick="">
                    5G ZEM 퍼펙트(만 12세 이하)
                    </input><br>
                    <input type="radio" class="charge" name="charge" id="charge10" value="20000" onclick="">
                    5G ZEM 베스트(만 12세 이하)
                    </input><br>
                    </div>
                </aside>
            </div>
            <div style="display: none;">
                공시지원금
                <span id="anncd1">400000</span>
                <span id="anncd2">350000</span>
                <span id="anncd3">30000</span>
                <span id="anncd4">29000</span>
                <span id="anncd5">28000</span>
                <span id="anncd6">25000</span>
                <span id="anncd7">24000</span>
                <span id="anncd8">23000</span>
                <span id="anncd9">22000</span>
                <span id="anncd10">20000</span>
                공시추가
                <span id="apf1">500000</span>
                <span id="apf2">100000</span>
                <span id="apf3">50000</span>
                <span id="apf4">40000</span>
                <span id="apf5">0</span>
                <span id="apf6">0</span>
                <span id="apf7">0</span>
                <span id="apf8">0</span>
                <span id="apf9">0</span>
                <span id="apf10">0</span>
                공시번이추가
                <span id="mapf1">500001</span>
                <span id="mapf2">100001</span>
                <span id="mapf3">50001</span>
                <span id="mapf4">40001</span>
                <span id="mapf5">1</span>
                <span id="mapf6">1</span>
                <span id="mapf7">1</span>
                <span id="mapf8">1</span>
                <span id="mapf9">1</span>
                <span id="mapf10">1</span>
                선약추가
                <span id="bpf1">500000</span>
                <span id="bpf2">450000</span>
                <span id="bpf3">410000</span>
                <span id="bpf4">400000</span>
                <span id="bpf5">300000</span>
                <span id="bpf6">300000</span>
                <span id="bpf7">300000</span>
                <span id="bpf8">200000</span>
                <span id="bpf9">200000</span>
                <span id="bpf10">150000</span>
                선약번이추가
                <span id="mbpf1">500001</span>
                <span id="mbpf2">450001</span>
                <span id="mbpf3">410001</span>
                <span id="mbpf4">400001</span>
                <span id="mbpf5">300001</span>
                <span id="mbpf6">300001</span>
                <span id="mbpf7">300001</span>
                <span id="mbpf8">200001</span>
                <span id="mbpf9">200001</span>
                <span id="mbpf10">150001</span>
            </div>
            <div id="calcpad">

                <div>
                  <span>아이폰 13 128GB</span><br>
                  <span>출고가</span>
                  <span id="price" value="1000000">1,000,000</span>
                  <span>원</span><br>
                  <span>공시지원금 할인</span>
                  <span id="discount1" >0</span><br>
                  <span>추가할인</span>
                  <span id="discount2" >450,001</span><br>
                  <span>구매가</span>
                  <span id="buyat" value="">549,999</span><br>
                  <span>월 할부금</span>
                  <span id="buyatdivmon" value="">29166</span><br>
                </div>
                <div>
                  <span>요금제</span><br>
                  <span id="off_charge">110,000</span><br>
                  <span>약정할인</span>
                  <span id="off_discount1" >27,500</span><br>
                  <span>요금</span><br>
                  <span id="mon_charge">82500</span><br>
                  <span>최종 청구 요금</span><br>
                  <span id="pay">111666</span><br>
                </div>

            </div>
        </section>
        <div class="pre-approval" style="text-align : center; margin-top: 10px; margin-bottom: 10px;">
            <img class="img"
              src="../../../../img/pre_approval.PNG"
              alt="사전승낙서"
              style="max-width: 900px; height: auto;">
          </div>
          <div class="gift" style="text-align : center; margin-top: 10px; margin-bottom: 10px;">
            <img class="img"
              src="../../../../img/gift.PNG"
              alt="사은품"
              style="max-width: 900px; height: auto;">
          </div>
          <div class="kakao" style="text-align : center; margin-top: 10px; margin-bottom: 10px;">
            <img class="img"
              src="../../../../img/kakao.PNG"
              alt="카카오톡 상담"
              style="max-width: 900px; height: auto;">
          </div>
    
</body>
<footer>
    <hr class="ruler">
    <br>
    <br>
    <br>
    <hr class="ruler">
</footer>
</html>