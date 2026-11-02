package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.character.info.data.PersonData;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class PlayerInfoCanvas extends Sprite
   {
      
      public static const PROVINCE:XML = <list>
		 <node label="北京" id="beijing"/>
<node label="天津" id="beijing"/>
<node label="上海" id="beijing"/>
<node label="重庆" id="beijing"/>
<node label="河北" id="beijing"/>
<node label="河南" id="beijing"/>
<node label="黑龙江" id="beijing"/>
<node label="吉林" id="beijing"/>
<node label="辽宁" id="beijing"/>
<node label="山东" id="beijing"/>
<node label="内蒙古" id="beijing"/>
<node label="江苏" id="beijing"/>
<node label="安徽" id="beijing"/>
<node label="山西" id="beijing"/>
<node label="陕西" id="beijing"/>
<node label="甘肃" id="beijing"/>
<node label="浙江" id="beijing"/>
<node label="江西" id="beijing"/>
<node label="湖北" id="beijing"/>
<node label="湖南" id="beijing"/>
<node label="贵州" id="beijing"/>
<node label="四川" id="beijing"/>
<node label="云南" id="beijing"/>
<node label="新疆" id="beijing"/>
<node label="宁夏" id="beijing"/>
<node label="青海" id="beijing"/>
<node label="西藏" id="beijing"/>
<node label="广西" id="beijing"/>
<node label="广东" id="beijing"/>
<node label="福建" id="beijing"/>
<node label="海南" id="beijing"/>
<node label="台湾" id="beijing"/>
<node label="香港" id="beijing"/>
<node label="澳门" id="beijing"/>
<node label="海外" id="beijing"/>
	</list>;
      
      public static const CITY:XML = <root>
  <node label="北京" id="北京"/>
  <node label="天津" id="天津"/>
  <node label="上海" id="上海"/>
  <node label="重庆" id="重庆"/>
  <node label="石家庄" id="河北"/>
  <node label="唐山" id="河北"/>
  <node label="秦皇岛" id="河北"/>
  <node label="邯郸" id="河北"/>
  <node label="邢台" id="河北"/>
  <node label="保定" id="河北"/>
  <node label="张家口" id="河北"/>
  <node label="承德" id="河北"/>
  <node label="沧州" id="河北"/>
  <node label="廊坊" id="河北"/>
  <node label="衡水" id="河北"/>
  <node label="郑州" id="河南"/>
  <node label="开封" id="河南"/>
  <node label="洛阳" id="河南"/>
  <node label="平顶山" id="河南"/>
  <node label="焦作" id="河南"/>
  <node label="鹤壁" id="河南"/>
  <node label="新乡" id="河南"/>
  <node label="安阳" id="河南"/>
  <node label="濮阳" id="河南"/>
  <node label="许昌" id="河南"/>
  <node label="漯河" id="河南"/>
  <node label="三门峡" id="河南"/>
  <node label="南阳" id="河南"/>
  <node label="商丘" id="河南"/>
  <node label="信阳" id="河南"/>
  <node label="周口" id="河南"/>
  <node label="驻马店" id="河南"/>
  <node label="济源" id="河南"/>
  <node label="哈尔滨" id="黑龙江"/>
  <node label="齐齐哈尔" id="黑龙江"/>
  <node label="鹤岗" id="黑龙江"/>
  <node label="双鸭山" id="黑龙江"/>
  <node label="鸡西" id="黑龙江"/>
  <node label="大庆" id="黑龙江"/>
  <node label="伊春" id="黑龙江"/>
  <node label="牡丹江" id="黑龙江"/>
  <node label="佳木斯" id="黑龙江"/>
  <node label="七台河" id="黑龙江"/>
  <node label="黑河" id="黑龙江"/>
  <node label="绥化" id="黑龙江"/>
  <node label="大兴安岭" id="黑龙江"/>
  <node label="长春" id="吉林"/>
  <node label="吉林" id="吉林"/>
  <node label="四平" id="吉林"/>
  <node label="辽源" id="吉林"/>
  <node label="通化" id="吉林"/>
  <node label="白山" id="吉林"/>
  <node label="松原" id="吉林"/>
  <node label="白城" id="吉林"/>
  <node label="延边州" id="吉林"/>
  <node label="沈阳" id="辽宁"/>
  <node label="大连" id="辽宁"/>
  <node label="鞍山" id="辽宁"/>
  <node label="抚顺" id="辽宁"/>
  <node label="本溪" id="辽宁"/>
  <node label="丹东" id="辽宁"/>
  <node label="锦州" id="辽宁"/>
  <node label="葫芦岛" id="辽宁"/>
  <node label="营口" id="辽宁"/>
  <node label="盘锦" id="辽宁"/>
  <node label="阜新" id="辽宁"/>
  <node label="辽阳" id="辽宁"/>
  <node label="铁岭" id="辽宁"/>
  <node label="朝阳" id="辽宁"/>
  <node label="济南" id="山东"/>
  <node label="青岛" id="山东"/>
  <node label="淄博" id="山东"/>
  <node label="枣庄" id="山东"/>
  <node label="东营" id="山东"/>
  <node label="潍坊" id="山东"/>
  <node label="烟台" id="山东"/>
  <node label="威海" id="山东"/>
  <node label="济宁" id="山东"/>
  <node label="泰安" id="山东"/>
  <node label="日照" id="山东"/>
  <node label="莱芜" id="山东"/>
  <node label="德州" id="山东"/>
  <node label="临沂" id="山东"/>
  <node label="聊城" id="山东"/>
  <node label="滨州" id="山东"/>
  <node label="菏泽" id="山东"/>
  <node label="呼和浩特" id="内蒙古"/>
  <node label="包头" id="内蒙古"/>
  <node label="乌海" id="内蒙古"/>
  <node label="赤峰" id="内蒙古"/>
  <node label="通辽" id="内蒙古"/>
  <node label="鄂尔多斯" id="内蒙古"/>
  <node label="呼伦贝尔" id="内蒙古"/>
  <node label="乌兰察布" id="内蒙古"/>
  <node label="锡林郭勒" id="内蒙古"/>
  <node label="巴彦淖尔" id="内蒙古"/>
  <node label="阿拉善" id="内蒙古"/>
  <node label="兴安" id="内蒙古"/>
  <node label="南京" id="江苏"/>
  <node label="徐州" id="江苏"/>
  <node label="连云港" id="江苏"/>
  <node label="淮安" id="江苏"/>
  <node label="宿迁" id="江苏"/>
  <node label="盐城" id="江苏"/>
  <node label="扬州" id="江苏"/>
  <node label="泰州" id="江苏"/>
  <node label="南通" id="江苏"/>
  <node label="镇江" id="江苏"/>
  <node label="常州" id="江苏"/>
  <node label="无锡" id="江苏"/>
  <node label="苏州" id="江苏"/>
  <node label="合肥" id="安徽"/>
  <node label="芜湖" id="安徽"/>
  <node label="蚌埠" id="安徽"/>
  <node label="淮南" id="安徽"/>
  <node label="马鞍山" id="安徽"/>
  <node label="淮北" id="安徽"/>
  <node label="铜陵" id="安徽"/>
  <node label="安庆" id="安徽"/>
  <node label="黄山" id="安徽"/>
  <node label="滁州" id="安徽"/>
  <node label="阜阳" id="安徽"/>
  <node label="宿州" id="安徽"/>
  <node label="巢湖" id="安徽"/>
  <node label="六安" id="安徽"/>
  <node label="毫州" id="安徽"/>
  <node label="池州" id="安徽"/>
  <node label="宣城" id="安徽"/>
  <node label="太原" id="山西"/>
  <node label="大同" id="山西"/>
  <node label="朔州" id="山西"/>
  <node label="阳泉" id="山西"/>
  <node label="长治" id="山西"/>
  <node label="晋城" id="山西"/>
  <node label="忻州" id="山西"/>
  <node label="晋中" id="山西"/>
  <node label="临汾" id="山西"/>
  <node label="运城" id="山西"/>
  <node label="吕梁" id="山西"/>
  <node label="西安" id="陕西"/>
  <node label="铜川" id="陕西"/>
  <node label="宝鸡" id="陕西"/>
  <node label="咸阳" id="陕西"/>
  <node label="渭南" id="陕西"/>
  <node label="延安" id="陕西"/>
  <node label="汉中" id="陕西"/>
  <node label="榆林" id="陕西"/>
  <node label="安康" id="陕西"/>
  <node label="商洛" id="陕西"/>
  <node label="兰州" id="甘肃"/>
  <node label="金昌" id="甘肃"/>
  <node label="白银" id="甘肃"/>
  <node label="天水" id="甘肃"/>
  <node label="嘉峪关" id="甘肃"/>
  <node label="武威" id="甘肃"/>
  <node label="张掖" id="甘肃"/>
  <node label="平凉" id="甘肃"/>
  <node label="酒泉" id="甘肃"/>
  <node label="庆阳" id="甘肃"/>
  <node label="定西" id="甘肃"/>
  <node label="陇南" id="甘肃"/>
  <node label="甘南州" id="甘肃"/>
  <node label="临夏州" id="甘肃"/>
  <node label="杭州" id="浙江"/>
  <node label="宁波" id="浙江"/>
  <node label="温州" id="浙江"/>
  <node label="嘉兴" id="浙江"/>
  <node label="湖州" id="浙江"/>
  <node label="绍兴" id="浙江"/>
  <node label="金华" id="浙江"/>
  <node label="衢州" id="浙江"/>
  <node label="舟山" id="浙江"/>
  <node label="台州" id="浙江"/>
  <node label="丽水" id="浙江"/>
  <node label="南昌" id="江西"/>
  <node label="景德镇" id="江西"/>
  <node label="萍乡" id="江西"/>
  <node label="新余" id="江西"/>
  <node label="九江" id="江西"/>
  <node label="鹰潭" id="江西"/>
  <node label="赣州" id="江西"/>
  <node label="吉安" id="江西"/>
  <node label="宜春" id="江西"/>
  <node label="抚州" id="江西"/>
  <node label="上饶" id="江西"/>
  <node label="武汉" id="湖北"/>
  <node label="黄石" id="湖北"/>
  <node label="襄樊" id="湖北"/>
  <node label="十堰" id="湖北"/>
  <node label="荆州" id="湖北"/>
  <node label="宜昌" id="湖北"/>
  <node label="荆门" id="湖北"/>
  <node label="鄂州" id="湖北"/>
  <node label="孝感" id="湖北"/>
  <node label="黄冈" id="湖北"/>
  <node label="咸宁" id="湖北"/>
  <node label="随州" id="湖北"/>
  <node label="恩施" id="湖北"/>
  <node label="仙桃" id="湖北"/>
  <node label="天门" id="湖北"/>
  <node label="潜江" id="湖北"/>
  <node label="神农架" id="湖北"/>
  <node label="长沙" id="湖南"/>
  <node label="株洲" id="湖南"/>
  <node label="湘潭" id="湖南"/>
  <node label="衡阳" id="湖南"/>
  <node label="邵阳" id="湖南"/>
  <node label="岳阳" id="湖南"/>
  <node label="常德" id="湖南"/>
  <node label="张家界" id="湖南"/>
  <node label="益阳" id="湖南"/>
  <node label="郴州" id="湖南"/>
  <node label="永州" id="湖南"/>
  <node label="怀化" id="湖南"/>
  <node label="娄底" id="湖南"/>
  <node label="湘西州" id="湖南"/>
  <node label="贵阳" id="贵州"/>
  <node label="六盘水" id="贵州"/>
  <node label="遵义" id="贵州"/>
  <node label="安顺" id="贵州"/>
  <node label="铜仁" id="贵州"/>
  <node label="毕节" id="贵州"/>
  <node label="黔西南州" id="贵州"/>
  <node label="黔东南州" id="贵州"/>
  <node label="黔南州" id="贵州"/>
  <node label="成都" id="四川"/>
  <node label="自贡" id="四川"/>
  <node label="攀枝花" id="四川"/>
  <node label="泸州" id="四川"/>
  <node label="德阳" id="四川"/>
  <node label="绵阳" id="四川"/>
  <node label="广元" id="四川"/>
  <node label="遂宁" id="四川"/>
  <node label="内江" id="四川"/>
  <node label="乐山" id="四川"/>
  <node label="南充" id="四川"/>
  <node label="宜宾" id="四川"/>
  <node label="广安" id="四川"/>
  <node label="达州" id="四川"/>
  <node label="巴中" id="四川"/>
  <node label="雅安" id="四川"/>
  <node label="眉山" id="四川"/>
  <node label="资阳" id="四川"/>
  <node label="阿坝州" id="四川"/>
  <node label="甘孜州" id="四川"/>
  <node label="凉山州" id="四川"/>
  <node label="昆明" id="云南"/>
  <node label="曲靖" id="云南"/>
  <node label="玉溪" id="云南"/>
  <node label="保山" id="云南"/>
  <node label="昭通" id="云南"/>
  <node label="思茅" id="云南"/>
  <node label="临沧" id="云南"/>
  <node label="丽江" id="云南"/>
  <node label="文山州" id="云南"/>
  <node label="红河州" id="云南"/>
  <node label="西双版纳" id="云南"/>
  <node label="楚雄州" id="云南"/>
  <node label="大理州" id="云南"/>
  <node label="德宏州" id="云南"/>
  <node label="怒江州" id="云南"/>
  <node label="迪庆州" id="云南"/>
  <node label="乌鲁木齐" id="新疆"/>
  <node label="克拉玛依" id="新疆"/>
  <node label="吐鲁番" id="新疆"/>
  <node label="哈密" id="新疆"/>
  <node label="和田" id="新疆"/>
  <node label="阿克苏" id="新疆"/>
  <node label="喀什" id="新疆"/>
  <node label="克孜勒苏" id="新疆"/>
  <node label="巴音郭楞" id="新疆"/>
  <node label="昌吉州" id="新疆"/>
  <node label="博尔塔拉" id="新疆"/>
  <node label="伊犁州" id="新疆"/>
  <node label="石河子" id="新疆"/>
  <node label="阿拉尔" id="新疆"/>
  <node label="图木舒克" id="新疆"/>
  <node label="五家渠" id="新疆"/>
  <node label="银川" id="宁夏"/>
  <node label="石嘴山" id="宁夏"/>
  <node label="吴忠" id="宁夏"/>
  <node label="固原" id="宁夏"/>
  <node label="西宁" id="青海"/>
  <node label="海东" id="青海"/>
  <node label="海北州" id="青海"/>
  <node label="黄南州" id="青海"/>
  <node label="海南州" id="青海"/>
  <node label="果洛州" id="青海"/>
  <node label="玉树州" id="青海"/>
  <node label="海西州" id="青海"/>
  <node label="拉萨" id="西藏"/>
  <node label="那曲" id="西藏"/>
  <node label="昌都" id="西藏"/>
  <node label="山南" id="西藏"/>
  <node label="日喀则" id="西藏"/>
  <node label="阿里" id="西藏"/>
  <node label="林芝" id="西藏"/>
  <node label="南宁" id="广西"/>
  <node label="柳州" id="广西"/>
  <node label="桂林" id="广西"/>
  <node label="梧州" id="广西"/>
  <node label="北海" id="广西"/>
  <node label="防城港" id="广西"/>
  <node label="钦州" id="广西"/>
  <node label="贵港" id="广西"/>
  <node label="玉林" id="广西"/>
  <node label="百色" id="广西"/>
  <node label="贺州" id="广西"/>
  <node label="河池" id="广西"/>
  <node label="来宾" id="广西"/>
  <node label="崇左" id="广西"/>
  <node label="广州" id="广东"/>
  <node label="深圳" id="广东"/>
  <node label="珠海" id="广东"/>
  <node label="汕头" id="广东"/>
  <node label="韶关" id="广东"/>
  <node label="河源" id="广东"/>
  <node label="梅州" id="广东"/>
  <node label="惠州" id="广东"/>
  <node label="汕尾" id="广东"/>
  <node label="东莞" id="广东"/>
  <node label="中山" id="广东"/>
  <node label="江门" id="广东"/>
  <node label="佛山" id="广东"/>
  <node label="阳江" id="广东"/>
  <node label="湛江" id="广东"/>
  <node label="茂名" id="广东"/>
  <node label="肇庆" id="广东"/>
  <node label="清远" id="广东"/>
  <node label="潮州" id="广东"/>
  <node label="揭阳" id="广东"/>
  <node label="云浮" id="广东"/>
  <node label="福州" id="福建"/>
  <node label="厦门" id="福建"/>
  <node label="三明" id="福建"/>
  <node label="莆田" id="福建"/>
  <node label="泉州" id="福建"/>
  <node label="漳州" id="福建"/>
  <node label="南平" id="福建"/>
  <node label="龙岩" id="福建"/>
  <node label="宁德" id="福建"/>
  <node label="海口" id="海南"/>
  <node label="三亚" id="海南"/>
  <node label="五指山" id="海南"/>
  <node label="琼海" id="海南"/>
  <node label="儋州" id="海南"/>
  <node label="文昌" id="海南"/>
  <node label="万宁" id="海南"/>
  <node label="东方" id="海南"/>
  <node label="澄迈" id="海南"/>
  <node label="定安" id="海南"/>
  <node label="屯昌" id="海南"/>
  <node label="临高" id="海南"/>
  <node label="白沙" id="海南"/>
  <node label="昌江" id="海南"/>
  <node label="乐东" id="海南"/>
  <node label="陵水" id="海南"/>
  <node label="保亭" id="海南"/>
  <node label="琼中" id="海南"/>
  <node label="台湾" id="台湾"/>
  <node label="香港" id="香港"/>
  <node label="澳门" id="澳门"/>
  <node label="海外" id="海外"/>
</root>;
      
      public var $parent:DisplayObject;
      
      public var bg:Bitmap;
      
      private var avatarPhoto:Bitmap;
      
      private var nameInput:FTextInput;
      
      private var birthdayLabel_year:FTextArea;
      
      private var birthdayBtn_year:FSimpleButton;
      
      private var birthdayCanvas_year:FCanvas;
      
      private var birthdayLis_year:FList;
      
      private var birthdayScroll_year:FVScorllBar;
      
      private var birthdayLabel_month:FTextArea;
      
      private var birthdayBtn_month:FSimpleButton;
      
      private var birthdayCanvas_month:FCanvas;
      
      private var birthdayList_month:FList;
      
      private var birthdayScroll_month:FVScorllBar;
      
      private var birthdayLabel_day:FTextArea;
      
      private var birthdayBtn_day:FSimpleButton;
      
      private var birthdayCanvas_day:FCanvas;
      
      private var birthdayList_day:FList;
      
      private var birthdayScroll_day:FVScorllBar;
      
      private var sexLabel:FTextArea;
      
      private var sexBtn:FSimpleButton;
      
      private var sexCanvas:FCanvas;
      
      private var sexList:FList;
      
      private var sexScroll:FVScorllBar;
      
      private var bloodLabel:FTextArea;
      
      private var bloodBtn:FSimpleButton;
      
      private var bloodCanvas:FCanvas;
      
      private var bloodList:FList;
      
      private var bloodScroll:FVScorllBar;
      
      private var provinceLabel:FTextArea;
      
      private var provinceBtn:FSimpleButton;
      
      private var provinceCanvas:FCanvas;
      
      private var provinceList:FList;
      
      private var provinceScroll:FVScorllBar;
      
      private var cityLabel:FTextArea;
      
      private var cityBtn:FSimpleButton;
      
      private var cityCanvas:FCanvas;
      
      private var cityList:FList;
      
      private var cityScroll:FVScorllBar;
      
      private var professionInput:FTextInput;
      
      private var schoolInput:FTextInput;
      
      private var mailInput:FTextInput;
      
      private var webInput:FTextInput;
      
      private var qqInput:FTextInput;
      
      private var phoneInput:FTextInput;
      
      private var checkBox1:FCheckBox;
      
      private var checkBox2:FCheckBox;
      
      private var checkBox3:FCheckBox;
      
      private var uploadBtn:SecondButton;
      
      private var submitBtn:SecondButton;
      
      public function PlayerInfoCanvas()
      {
         var fb:FLabel;
         var xml:XML;
         var len:int;
         var i:int = 0;
         super();
         this.bg = StaticValue.getBitmapByClassName("ui.marriage.attribute.ui");
         this.bg.name = "ui.marriage.attribute.ui";
         addChild(this.bg);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 11;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"昵称");
         }
         addChild(fb);
         this.nameInput = new FTextInput();
         with(this.nameInput)
         {
            x = 228;
            y = 11;
            width = 160;
            height = 20;
            maxChars = 6;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanTextWords(this,"输入名字");
         }
         addChild(this.nameInput);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 36;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"生日");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 60;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"性别");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 292;
            y = 60;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"血型");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 83;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"省份");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 292;
            y = 83;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"城市");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 107;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"职业");
         }
         addChild(fb);
         this.professionInput = new FTextInput();
         with(this.professionInput)
         {
            x = 228;
            y = 107;
            width = 160;
            height = 20;
            maxChars = 10;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.professionInput);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 131;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"院校");
         }
         addChild(fb);
         this.schoolInput = new FTextInput();
         with(this.schoolInput)
         {
            x = 228;
            y = 131;
            width = 160;
            height = 20;
            maxChars = 12;
            textColor = StaticValue.WHITE;
            text = "1";
         }
         addChild(this.schoolInput);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 155;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "MAIL";
         }
         addChild(fb);
         this.mailInput = new FTextInput();
         with(this.mailInput)
         {
            x = 228;
            y = 155;
            width = 160;
            height = 20;
            maxChars = 25;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.mailInput);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 180;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "HTTP";
         }
         addChild(fb);
         this.webInput = new FTextInput();
         with(this.webInput)
         {
            x = 228;
            y = 180;
            width = 160;
            height = 20;
            maxChars = 25;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.webInput);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 203;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"腾讯QQ");
         }
         addChild(fb);
         this.webInput = new FTextInput();
         with(this.webInput)
         {
            x = 254;
            y = 203;
            width = 138;
            height = 20;
            maxChars = 15;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.webInput);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 227;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"联系电话");
         }
         addChild(fb);
         this.phoneInput = new FTextInput();
         with(this.phoneInput)
         {
            x = 254;
            y = 227;
            width = 138;
            height = 20;
            maxChars = 15;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.phoneInput);
         fb = new FLabel();
         with(fb)
         {
            x = 196;
            y = 250;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"*绿色为必填项");
         }
         addChild(fb);
         this.provinceLabel = new FTextArea();
         with(this.provinceLabel)
         {
            x = 229;
            y = 83;
            defaultTextFormat = StaticValue.format;
            width = 40;
            height = 20;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.provinceLabel);
         this.provinceBtn = new FSimpleButton();
         this.provinceBtn.skin = "bottomButton";
         addChild(this.provinceBtn);
         this.provinceBtn.x = this.provinceLabel.x + this.provinceLabel.width;
         this.provinceBtn.y = this.provinceLabel.y - 2;
         this.provinceBtn.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.provinceCanvas = new FCanvas();
         this.provinceCanvas.skin = "backGroud";
         this.provinceCanvas.width = this.provinceLabel.width + 4 + this.provinceBtn.width;
         this.provinceCanvas.height = 94;
         this.provinceCanvas.x = this.provinceLabel.x - 4;
         this.provinceCanvas.y = this.provinceLabel.y + 16;
         addChild(this.provinceCanvas);
         this.provinceCanvas.visible = false;
         this.provinceList = new FList();
         this.provinceList.skin = "list";
         this.provinceList.listWidth = this.provinceCanvas.width - 22;
         this.provinceList.x = 2;
         this.provinceList.y = 2;
         this.provinceList.itemRenderer = new StrengthenListRender();
         this.provinceList.dataProvider = PROVINCE;
         this.provinceCanvas.addChild(this.provinceList);
         this.provinceList.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.provinceScroll = new FVScorllBar(this.provinceList,90);
         this.provinceCanvas.addChild(this.provinceScroll);
         this.provinceScroll.x = this.provinceCanvas.width - 18;
         this.provinceScroll.y = 2;
         this.cityLabel = new FTextArea();
         with(this.cityLabel)
         {
            x = 323;
            y = 83;
            defaultTextFormat = StaticValue.format;
            width = 52;
            height = 20;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.cityLabel);
         this.cityBtn = new FSimpleButton();
         this.cityBtn.skin = "bottomButton";
         addChild(this.cityBtn);
         this.cityBtn.x = this.cityLabel.x + this.cityLabel.width;
         this.cityBtn.y = this.cityLabel.y - 2;
         this.cityBtn.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.cityCanvas = new FCanvas();
         this.cityCanvas.skin = "backGroud";
         this.cityCanvas.width = this.cityLabel.width + 4 + this.cityBtn.width;
         this.cityCanvas.height = 94;
         this.cityCanvas.x = this.cityLabel.x - 4;
         this.cityCanvas.y = this.cityLabel.y + 16;
         addChild(this.cityCanvas);
         this.cityCanvas.visible = false;
         this.cityList = new FList();
         this.cityList.skin = "list";
         this.cityList.listWidth = this.cityCanvas.width - 22;
         this.cityList.x = 2;
         this.cityList.y = 2;
         this.cityList.itemRenderer = new StrengthenListRender();
         this.cityCanvas.addChild(this.cityList);
         this.cityList.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.cityScroll = new FVScorllBar(this.cityList,90);
         this.cityCanvas.addChild(this.cityScroll);
         this.cityScroll.x = this.cityCanvas.width - 18;
         this.cityScroll.y = 2;
         this.sexLabel = new FTextArea();
         with(this.sexLabel)
         {
            x = 229;
            y = 59;
            defaultTextFormat = StaticValue.format;
            width = 40;
            height = 20;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.sexLabel);
         this.sexBtn = new FSimpleButton();
         this.sexBtn.skin = "bottomButton";
         addChild(this.sexBtn);
         this.sexBtn.x = this.sexLabel.x + this.sexLabel.width;
         this.sexBtn.y = this.sexLabel.y - 2;
         this.sexBtn.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.sexCanvas = new FCanvas();
         this.sexCanvas.skin = "backGroud";
         this.sexCanvas.width = this.sexLabel.width + 4 + this.sexBtn.width;
         this.sexCanvas.height = 94;
         this.sexCanvas.x = this.sexLabel.x - 4;
         this.sexCanvas.y = this.sexLabel.y + 16;
         addChild(this.sexCanvas);
         this.sexCanvas.visible = false;
         this.sexList = new FList();
         this.sexList.skin = "list";
         this.sexList.listWidth = this.sexCanvas.width - 22;
         this.sexList.x = 2;
         this.sexList.y = 2;
         this.sexList.itemRenderer = new StrengthenListRender();
         this.sexList.dataProvider = <list>
<node label="男" id="10"/>
<node label="女" id="10"/>
													</list>;
         this.sexCanvas.addChild(this.sexList);
         this.sexList.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.sexScroll = new FVScorllBar(this.sexList,90);
         this.sexCanvas.addChild(this.sexScroll);
         this.sexScroll.x = this.sexCanvas.width - 18;
         this.sexScroll.y = 2;
         this.bloodLabel = new FTextArea();
         with(this.bloodLabel)
         {
            x = 323;
            y = 59;
            defaultTextFormat = StaticValue.format;
            width = 52;
            height = 20;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.bloodLabel);
         this.bloodBtn = new FSimpleButton();
         this.bloodBtn.skin = "bottomButton";
         addChild(this.bloodBtn);
         this.bloodBtn.x = this.bloodLabel.x + this.bloodLabel.width;
         this.bloodBtn.y = this.bloodLabel.y - 2;
         this.bloodBtn.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.bloodCanvas = new FCanvas();
         this.bloodCanvas.skin = "backGroud";
         this.bloodCanvas.width = this.bloodLabel.width + 4 + this.bloodBtn.width;
         this.bloodCanvas.height = 94;
         this.bloodCanvas.x = this.bloodLabel.x - 4;
         this.bloodCanvas.y = this.bloodLabel.y + 16;
         addChild(this.bloodCanvas);
         this.bloodCanvas.visible = false;
         this.bloodList = new FList();
         this.bloodList.skin = "list";
         this.bloodList.listWidth = this.bloodCanvas.width - 22;
         this.bloodList.x = 2;
         this.bloodList.y = 2;
         this.bloodList.itemRenderer = new StrengthenListRender();
         this.bloodList.dataProvider = <list>
<node label="O型" id="10"/>
<node label="A型" id="10"/>
<node label="B型" id="10"/>
<node label="AB型" id="10"/>
<node label="其他型" id="10"/>
													</list>;
         this.bloodCanvas.addChild(this.bloodList);
         this.bloodList.setSelectItemByIndex(0);
         this.bloodList.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.bloodScroll = new FVScorllBar(this.bloodList,90);
         this.bloodCanvas.addChild(this.bloodScroll);
         this.bloodScroll.x = this.bloodCanvas.width - 18;
         this.bloodScroll.y = 2;
         this.birthdayLabel_year = new FTextArea();
         with(this.birthdayLabel_year)
         {
            x = 228;
            y = 36;
            defaultTextFormat = StaticValue.format;
            width = 33;
            height = 20;
            textColor = StaticValue.WHITE;
            text = "1980";
         }
         addChild(this.birthdayLabel_year);
         this.birthdayBtn_year = new FSimpleButton();
         this.birthdayBtn_year.skin = "bottomButton";
         addChild(this.birthdayBtn_year);
         this.birthdayBtn_year.x = this.birthdayLabel_year.x + this.birthdayLabel_year.width;
         this.birthdayBtn_year.y = this.birthdayLabel_year.y - 2;
         this.birthdayBtn_year.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.birthdayCanvas_year = new FCanvas();
         this.birthdayCanvas_year.skin = "backGroud";
         this.birthdayCanvas_year.width = 54;
         this.birthdayCanvas_year.height = 94;
         this.birthdayCanvas_year.x = this.birthdayLabel_year.x - 4;
         this.birthdayCanvas_year.y = this.birthdayLabel_year.y + 16;
         addChild(this.birthdayCanvas_year);
         this.birthdayCanvas_year.visible = false;
         xml = <list/>;
         len = 2011;
         i = 1910;
         while(i < len)
         {
            xml.appendChild(<node label={i}/>);
            i++;
         }
         this.birthdayLis_year = new FList();
         this.birthdayLis_year.skin = "list";
         this.birthdayLis_year.listWidth = this.birthdayCanvas_year.width - 22;
         this.birthdayLis_year.x = 2;
         this.birthdayLis_year.y = 2;
         this.birthdayLis_year.itemRenderer = new StrengthenListRender();
         this.birthdayLis_year.dataProvider = xml;
         this.birthdayCanvas_year.addChild(this.birthdayLis_year);
         this.birthdayLis_year.setSelectItemByIndex(0);
         this.birthdayLis_year.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.birthdayScroll_year = new FVScorllBar(this.birthdayLis_year,90);
         this.birthdayCanvas_year.addChild(this.birthdayScroll_year);
         this.birthdayScroll_year.x = this.birthdayCanvas_year.width - 18;
         this.birthdayScroll_year.y = 2;
         this.birthdayLabel_month = new FTextArea();
         with(this.birthdayLabel_month)
         {
            x = 299;
            y = 36;
            defaultTextFormat = StaticValue.format;
            width = 19;
            height = 20;
            textColor = StaticValue.WHITE;
            text = "01";
         }
         addChild(this.birthdayLabel_month);
         this.birthdayBtn_month = new FSimpleButton();
         this.birthdayBtn_month.skin = "bottomButton";
         addChild(this.birthdayBtn_month);
         this.birthdayBtn_month.x = this.birthdayLabel_month.x + this.birthdayLabel_month.width;
         this.birthdayBtn_month.y = this.birthdayLabel_month.y - 2;
         this.birthdayBtn_month.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.birthdayCanvas_month = new FCanvas();
         this.birthdayCanvas_month.skin = "backGroud";
         this.birthdayCanvas_month.width = this.birthdayLabel_month.width + 4 + this.birthdayBtn_month.width;
         this.birthdayCanvas_month.height = 94;
         this.birthdayCanvas_month.x = this.birthdayLabel_month.x - 4;
         this.birthdayCanvas_month.y = this.birthdayLabel_month.y + 16;
         addChild(this.birthdayCanvas_month);
         this.birthdayCanvas_month.visible = false;
         xml = <list/>;
         len = 13;
         i = 1;
         while(i < len)
         {
            xml.appendChild(<node label={i}/>);
            i++;
         }
         this.birthdayList_month = new FList();
         this.birthdayList_month.skin = "list";
         this.birthdayList_month.listWidth = this.birthdayCanvas_month.width - 22;
         this.birthdayList_month.x = 2;
         this.birthdayList_month.y = 2;
         this.birthdayList_month.itemRenderer = new StrengthenListRender();
         this.birthdayList_month.dataProvider = xml;
         this.birthdayCanvas_month.addChild(this.birthdayList_month);
         this.birthdayList_month.setSelectItemByIndex(0);
         this.birthdayList_month.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.birthdayScroll_month = new FVScorllBar(this.birthdayList_month,90);
         this.birthdayCanvas_month.addChild(this.birthdayScroll_month);
         this.birthdayScroll_month.x = this.birthdayCanvas_month.width - 18;
         this.birthdayScroll_month.y = 2;
         this.birthdayLabel_day = new FTextArea();
         with(this.birthdayLabel_day)
         {
            x = 358;
            y = 36;
            defaultTextFormat = StaticValue.format;
            width = 19;
            height = 20;
            textColor = StaticValue.WHITE;
            text = "01";
         }
         addChild(this.birthdayLabel_day);
         this.birthdayBtn_day = new FSimpleButton();
         this.birthdayBtn_day.skin = "bottomButton";
         addChild(this.birthdayBtn_day);
         this.birthdayBtn_day.x = this.birthdayLabel_day.x + this.birthdayLabel_day.width;
         this.birthdayBtn_day.y = this.birthdayLabel_day.y - 2;
         this.birthdayBtn_day.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.birthdayCanvas_day = new FCanvas();
         this.birthdayCanvas_day.skin = "backGroud";
         this.birthdayCanvas_day.width = this.birthdayLabel_day.width + 4 + this.birthdayBtn_day.width;
         this.birthdayCanvas_day.height = 94;
         this.birthdayCanvas_day.x = this.birthdayLabel_day.x - 4;
         this.birthdayCanvas_day.y = this.birthdayLabel_day.y + 16;
         addChild(this.birthdayCanvas_day);
         this.birthdayCanvas_day.visible = false;
         xml = <list/>;
         len = 32;
         i = 1;
         while(i < len)
         {
            xml.appendChild(<node label={i}/>);
            i++;
         }
         this.birthdayList_day = new FList();
         this.birthdayList_day.skin = "list";
         this.birthdayList_day.listWidth = this.birthdayCanvas_day.width - 22;
         this.birthdayList_day.x = 2;
         this.birthdayList_day.y = 2;
         this.birthdayList_day.itemRenderer = new StrengthenListRender();
         this.birthdayList_day.dataProvider = xml;
         this.birthdayCanvas_day.addChild(this.birthdayList_day);
         this.birthdayList_day.setSelectItemByIndex(0);
         this.birthdayList_day.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.birthdayScroll_day = new FVScorllBar(this.birthdayList_day,90);
         this.birthdayCanvas_day.addChild(this.birthdayScroll_day);
         this.birthdayScroll_day.x = this.birthdayCanvas_day.width - 18;
         this.birthdayScroll_day.y = 2;
         this.uploadBtn = new SecondButton();
         this.uploadBtn.label = LanResManager.getLanTextWords(this,"上传形象照片");
         addChild(this.uploadBtn);
         this.uploadBtn.x = 50;
         this.uploadBtn.y = 328;
         this.uploadBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.checkBox1 = new FCheckBox();
         this.checkBox1.skin = "checkBox1";
         this.checkBox1.border = true;
         this.checkBox1.textColor = StaticValue.WHITE;
         this.checkBox1.text = LanResManager.getLanTextWords(this,"完全保密");
         this.checkBox1.addEventListener(MouseEvent.CLICK,this.onCheck);
         addChild(this.checkBox1);
         this.checkBox1.x = 200;
         this.checkBox1.y = 298;
         this.checkBox2 = new FCheckBox();
         this.checkBox2.skin = "checkBox1";
         this.checkBox2.border = true;
         this.checkBox2.textColor = StaticValue.WHITE;
         this.checkBox2.text = LanResManager.getLanTextWords(this,"向好友开放");
         this.checkBox2.addEventListener(MouseEvent.CLICK,this.onCheck);
         addChild(this.checkBox2);
         this.checkBox2.x = 200;
         this.checkBox2.y = 316;
         this.checkBox3 = new FCheckBox();
         this.checkBox3.skin = "checkBox1";
         this.checkBox3.border = true;
         this.checkBox3.textColor = StaticValue.WHITE;
         this.checkBox3.text = LanResManager.getLanTextWords(this,"完全开放");
         this.checkBox3.addEventListener(MouseEvent.CLICK,this.onCheck);
         addChild(this.checkBox3);
         this.checkBox3.x = 200;
         this.checkBox3.y = 335;
         this.submitBtn = new SecondButton();
         this.submitBtn.label = LanResManager.getLanTextWords(this,"提交资料");
         addChild(this.submitBtn);
         this.submitBtn.x = 307;
         this.submitBtn.y = 313;
         this.submitBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkBox1:
               this.checkBox2.selectState = this.checkBox3.selectState = false;
               break;
            case this.checkBox2:
               this.checkBox1.selectState = this.checkBox3.selectState = false;
               break;
            case this.checkBox3:
               this.checkBox2.selectState = this.checkBox1.selectState = false;
         }
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.birthdayBtn_year:
               this.birthdayCanvas_year.visible = !this.birthdayCanvas_year.visible;
               break;
            case this.birthdayBtn_month:
               this.birthdayCanvas_month.visible = !this.birthdayCanvas_month.visible;
               break;
            case this.birthdayBtn_day:
               this.birthdayCanvas_day.visible = !this.birthdayCanvas_day.visible;
               break;
            case this.sexBtn:
               this.sexCanvas.visible = !this.sexCanvas.visible;
               break;
            case this.bloodBtn:
               this.bloodCanvas.visible = !this.bloodCanvas.visible;
               break;
            case this.provinceBtn:
               this.provinceCanvas.visible = !this.provinceCanvas.visible;
               break;
            case this.cityBtn:
               this.cityCanvas.visible = !this.cityCanvas.visible;
         }
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         switch(param1.currentTarget)
         {
            case this.birthdayLis_year:
               this.birthdayLabel_year.text = this.birthdayLis_year.selectItem.label;
               this.birthdayCanvas_year.visible = false;
               break;
            case this.birthdayList_month:
               this.birthdayLabel_month.text = this.birthdayList_month.selectItem.label;
               this.birthdayCanvas_month.visible = false;
               break;
            case this.birthdayList_day:
               this.birthdayLabel_day.text = this.birthdayList_day.selectItem.label;
               this.birthdayCanvas_day.visible = false;
               break;
            case this.sexList:
               this.sexLabel.text = this.sexList.selectItem.label;
               this.sexCanvas.visible = false;
               break;
            case this.bloodList:
               this.bloodLabel.text = this.bloodList.selectItem.label;
               this.bloodCanvas.visible = false;
               break;
            case this.provinceList:
               this.provinceLabel.text = this.provinceList.selectItem.label;
               this.provinceCanvas.visible = false;
               _loc2_ = <list/>;
               _loc4_ = CITY.children().length();
               _loc3_ = 0;
               while(_loc3_ < _loc4_)
               {
                  if(CITY.node[_loc3_].@id == this.provinceList.selectItem.label)
                  {
                     _loc2_.appendChild(CITY.node[_loc3_]);
                  }
                  _loc3_++;
               }
               this.cityList.dataProvider = _loc2_;
               this.cityScroll.update();
               this.cityList.setSelectItemByIndex(0);
               this.cityLabel.text = this.cityList.selectItem.label;
               break;
            case this.cityList:
               this.cityLabel.text = this.cityList.selectItem.label;
               this.cityCanvas.visible = false;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.uploadBtn:
            case this.submitBtn:
         }
      }
      
      public function setData(param1:PersonData) : void
      {
         this.nameInput.text = param1.nickName;
      }
   }
}

