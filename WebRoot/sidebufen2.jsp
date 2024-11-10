<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <div class="layout bg4">
    <div class="ind_news">
      <ul>
        <a >
        <li>
          <span>
            <h3>新闻动态</h3>
            <h4>全面了解助学新版</h4>
          </span>
          <div>
          <img src="qtimages/picture/in_01.png">
          </div>
        </li>
        </a>
        <a>
        <li>
          <span>
            <h3>招贤纳士</h3>
            <h4>汇聚天下英才</h4>
          </span>
          <div>
          <img src="qtimages/picture/in_02.png">
          </div>
        </li>
        </a>
        <a>
        <li>
          <span>
            <h3>价值愿景</h3>
            <h4>开创不同凡响的未来</h4>
          </span>
          <div>
          <img src="qtimages/picture/in_03.png">
          </div>
        </li>
        </a>
        <a>
        <li style="background:none;">
          <span>
            <h3>媒体视频</h3>
            <h4>发现精彩瞬间</h4>
          </span>
          <div>
          <img src="qtimages/picture/in_04.png">
          </div>
        </li>
        </a>
      </ul>
    </div>
  </div>
<script type="text/javascript" >
$(document).ready(function() {
  $(".ind_news li").hover(function() {
        $(this).find("img").stop().animate({ marginTop: "-5px" }, 200);
        $(this).addClass("ind_news_color")
    },function(){
        $(this).find("img").stop().animate({ marginTop: "0" }, 300);
        $(this).removeClass("ind_news_color")
    });
  });
</script>