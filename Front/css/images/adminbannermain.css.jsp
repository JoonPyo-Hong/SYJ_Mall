/* adminbannermain */
@font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 400; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype'); }
@font-face { font-family: 'NEXON Lv1 Gothic OTF Light'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff') format('woff'); font-weight: normal; font-style: normal; }
       html{
           /* width: 2500px; */
           /* border : 1px solid red; */
       }
       h1{
           font-weight: bold;
           font-family: Arial;
           font-size: 3em; 
           color: #111;
       }

       #left {
           position: absolute;
           left: 0px;
           top: 0px;
           width: 250px;
           height: 3460px;
           /* border: 1px solid black; */
           background-color: #444;
           text-align: center;
           z-index: 10;
       }

       #left .info {
           margin-left: 56px;
           text-align: left;
           font-variant: small-caps;
           font-weight: bold;
           font-size: 1em;
       }

       .accomenu {
           /* margin-top: 30px; */
           margin-left: 10px;
           width : 260px;
           padding-right : 25px;
       }

       .btn {
           box-shadow: 3px 3px 0;
       }

       .b {
           margin-top: 30px;
           float: left;
       }

       .b::after {
           content: " ";
           clear: both;
           display: block;
       }

       /* #btn1 {
           margin-left: 50px;
           margin-right: 20px;
       } */

       #topmenu {
           /* border: 1px solid blue; */
           width: 100%;
           height: 60px;
           position: absolute;
           top: 0;
           float: right;
           align-content: right;
           /* z-index: -1; */
           /* background-color: #BBDED7; */
           /* opacity: .3; */
           
       }
       #topmenu .search {
           /* border: 1px solid black; */
           width: 250px;
           margin-top: 10px;
           float: right;
          
       }
       #topmenu .home {
           /* border: 1px solid black; */
           width: 50px;
           float: right;
           margin-top: 7px;
           cursor: pointer;
           color: #444
       }

       #calendar {
          margin-top: 70px;
          margin-left: -20px;
       }

       #cal {
           position: relative;
           top: 15px;
           left: 5px;
       }

       #bottom {
           position: absolute;
           top: 2000px;
       }

       #sw {
           margin-top: 850px;
           cursor: pointer;
       }

       /* 새로 추가한 코드 */
       /* 관리자 메인메뉴 위에 커서 두면 커서가 포인터로 변환하게만듦 */
       .accomenu tr td:hover {
           cursor : pointer;
       }

        #movetop {
           width: 40px;
           height: 40px;
           background-color: #777;
           position: fixed;
           bottom: 0px;
           right: 0px;
           text-align: center;
           padding-top: 3px;
       }
       #movetop:hover {
           background-color: #444;
           cursor : pointer;
       }

       #movetop {
           text-decoration: none;
           color: white;
           font-weight: bold;
           font-size: 1.5em;
       }

       body{
           font-family: 'NanumBarunGothic';
       }

       /* 아코디언 메뉴 css */
       .ui-state-active {
           background-color: red;
           background-image: url();
       }
       .ui-state-hover {
           background-color: #444;
           background-image: url();

       }

       .ui-accordion-header {
           background: #444;
           color: white;
           text-align: left;
           border: 0px;
           font-family: 'NEXON Lv1 Gothic OTF Light';
           /* font-weight: bolder; */
           
       }
       .ui-accordion-content {
           background: #444;
           color: white;
           text-align: left;
           border: 0px;
           font-family: 'NanumBarunGothic';
       }
       .ui-accordion-content div:hover {
           background: #333;
       }
       .ui-widget-content a{
           color: white;
           text-decoration: none;
       }
       .ui-widget-content span {
           font-size: 10px;
       }
       .ui-accordion .ui-accordion-header {
           /* border: 0px; */
           outline: none;
         
       }