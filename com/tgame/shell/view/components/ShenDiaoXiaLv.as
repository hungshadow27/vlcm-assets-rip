package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class ShenDiaoXiaLv extends FPanel
   {
      
      public static var $parent:DisplayObject;
      
      public static const UI_SHENDIAOXIALV_REFRESHBTN_CLICK:String = "UI_SHENDIAOXIALV_REFRESHBTN_CLICK";
      
      public static const UI_SHENDIAOXIALV_LINGQUBTN_CLICK:String = "UI_SHENDIAOXIALV_LINGQUBTN_CLICK";
      
      public static const UI_SHENDIAOXIALV_TUIHUIUBTN_CLICK:String = "UI_SHENDIAOXIALV_TUIHUIUBTN_CLICK";
      
      public static const UI_SHENDIAOXIALV_SHENQING_CLICK:String = "UI_SHENDIAOXIALV_SHENQING_CLICK";
      
      public static const UI_SHENDIAOXIALV_SHANGJIAOSUIPIAN_CLICK:String = "UI_SHENDIAOXIALV_SHANGJIAOSUIPIAN_CLICK";
      
      public static const UI_SHENDIAOXIALV_PREVIOUS_CLICK:String = "UI_SHENDIAOXIALV_PREVIOUS_CLICK";
      
      public static const UI_SHENDIAOXIALV_NEXT_CLICK:String = "UI_SHENDIAOXIALV_NEXT_CLICK";
      
      public static const UI_SHENDIAOXIALV_CLOSE:String = "UI_SHENDIAOXIALV_CLOSE";
      
      private var shenqinglist:FList;
      
      private var bit:Bitmap;
      
      private var fc1:FCanvas;
      
      private var shuaxinBtn:SmallButton;
      
      private var lingquBtn:SecondButton;
      
      private var tuihuiBtn:SecondButton;
      
      private var shijian:FTextArea;
      
      private var shendiaohuodong:ShenDiaoXiaLvShenQingHuoDongPanel;
      
      private var shendiaolist:ShenDiaoXiaLvListPanel;
      
      private var arr:Array;
      
      private var fanyeSpr:Sprite;
      
      private var shangyiyeBtn:FSimpleButton;
      
      private var xiayiyeBtn:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var look:int;
      
      private var tf:TextFormat;
      
      private var bg1:DisplayObject;
      
      public function ShenDiaoXiaLv()
      {
         var _loc1_:FTextArea = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 549 - 2 - 4;
         height = 435 - 3 + 50 + 20 - 40;
         titleText = LanResManager.getLanCommonTextWords("神雕情缘");
         this.addEventListener(FCloseEvent.CLOSE,this._onclose);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shendiaoxialv/sdxlBg.swf");
         this.bg1.visible = true;
         this.bg1.x = 10;
         this.bg1.y = 2;
         addChild(this.bg1);
         this.fc1 = new FCanvas();
         this.fc1.x = 10;
         this.fc1.y = 2;
         this.fc1.width = 529;
         this.fc1.height = 435 + 20;
         this.fc1.skin = "box_transparence";
         this.fc1 = new FCanvas();
         this.fc1.x = 10 + 2;
         this.fc1.y = 2 + 2;
         this.fc1.width = 529 - 4;
         this.fc1.height = 245 - 50 + 13 + 1;
         this.fc1.skin = "box_transparence";
         this.fc1 = new FCanvas();
         this.fc1.x = 10 + 2;
         this.fc1.y = 247 + 2 - 50 + 13;
         this.fc1.width = 529 - 4;
         this.fc1.height = 186 + 50 - 13 + 20;
         this.fc1.skin = "box_transparence";
         this.bit = StaticValue.getBitmapByClassName("ui.char.dugu.lineBar");
         this.bit.width = 545 - 26;
         this.bit.x = 14;
         this.bit.y = 4 + 5;
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.wordWrap = true;
         _loc1_.width = 50;
         _loc1_.height = 96;
         _loc1_.x = 30 + 5 - 17 - 4;
         _loc1_.y = 7;
         _loc1_.htmlText = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("线路") + "</font></textformat>";
         addChild(_loc1_);
         var _loc2_:FTextArea = new FTextArea();
         _loc2_.multiline = true;
         _loc2_.autoSize = TextFieldAutoSize.LEFT;
         _loc2_.wordWrap = true;
         _loc2_.width = 100;
         _loc2_.height = 96;
         _loc2_.x = 30 + 5 + 71 + 15;
         _loc2_.y = 7;
         _loc2_.htmlText = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前中标申请人") + "</font></textformat>";
         addChild(_loc2_);
         var _loc3_:FTextArea = new FTextArea();
         _loc3_.multiline = true;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.wordWrap = true;
         _loc3_.width = 100;
         _loc3_.height = 96;
         _loc3_.x = 30 + 5 + 204 + 42 + 18;
         _loc3_.y = 7;
         _loc3_.htmlText = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前中标碎片") + "</font></textformat>";
         addChild(_loc3_);
         var _loc4_:FTextArea = new FTextArea();
         _loc4_.multiline = true;
         _loc4_.autoSize = TextFieldAutoSize.LEFT;
         _loc4_.wordWrap = true;
         _loc4_.width = 100;
         _loc4_.height = 96;
         _loc4_.x = 30 + 5 + 303 + 30 + 10 + 5;
         _loc4_.y = 7;
         _loc4_.htmlText = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("我所上交碎片") + "</font></textformat>";
         addChild(_loc4_);
         var _loc5_:FTextArea = new FTextArea();
         _loc5_.multiline = true;
         _loc5_.autoSize = TextFieldAutoSize.LEFT;
         _loc5_.wordWrap = true;
         _loc5_.width = 60;
         _loc5_.height = 96;
         _loc5_.x = 30 + 5 + 417 + 15 + 4;
         _loc5_.y = 7;
         _loc5_.htmlText = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("申请操作") + "</font></textformat>";
         addChild(_loc5_);
         this.shenqinglist = new FList();
         this.shenqinglist.doubleClickEnabled = true;
         this.shenqinglist.skin = "list";
         this.shenqinglist.listWidth = 534 - 12 - 1 - 1;
         this.shenqinglist.listHeight = 177;
         this.shenqinglist.itemRenderer = new ShenDiaoXiaLvListPanel();
         ShenDiaoXiaLvListPanel.$parent = this;
         addChild(this.shenqinglist);
         this.shenqinglist.x = 12;
         this.shenqinglist.y = 30 - 2 - 1;
         this.fanyeSpr = new Sprite();
         addChild(this.fanyeSpr);
         this.shangyiyeBtn = new FSimpleButton();
         this.shangyiyeBtn.skin = "previousButton";
         this.fanyeSpr.addChild(this.shangyiyeBtn);
         this.shangyiyeBtn.x = 210 - 156;
         this.shangyiyeBtn.y = 210 - 2;
         this.shangyiyeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.fanyeSpr.addChild(this.cengshu);
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.width = 55;
         this.cengshu.height = 20 - 1;
         this.cengshu.x = 210 + 30 - 7 - 156;
         this.cengshu.y = 210 - 2;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>1/2</font>";
         this.xiayiyeBtn = new FSimpleButton();
         this.xiayiyeBtn.skin = "nextButton";
         this.fanyeSpr.addChild(this.xiayiyeBtn);
         this.xiayiyeBtn.x = 210 + 80 - 156;
         this.xiayiyeBtn.y = 210 - 2;
         this.xiayiyeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         var _loc6_:FTextArea = new FTextArea();
         _loc6_.multiline = true;
         _loc6_.autoSize = TextFieldAutoSize.LEFT;
         _loc6_.wordWrap = true;
         _loc6_.width = 300;
         _loc6_.height = 20;
         _loc6_.x = 210;
         _loc6_.y = 207;
         _loc6_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击右侧刷新按钮查看最新活动申请情况") + "</font>";
         addChild(_loc6_);
         var _loc7_:FTextArea = new FTextArea();
         _loc7_.multiline = true;
         _loc7_.autoSize = TextFieldAutoSize.LEFT;
         _loc7_.wordWrap = true;
         _loc7_.width = 517 - 17;
         _loc7_.height = 140;
         _loc7_.x = 27;
         _loc7_.y = 266 - 50 - 9 + 13 + 20;
         _loc7_.htmlText = "<textformat ><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("各个线路在申请时间结束前上交侠侣碎片数最多的夫妻获得神雕情缘活动的举办权，其他申请者上交的侠侣碎片将在活动结束后被退回。") + "</font></textformat>";
         addChild(_loc7_);
         var _loc8_:FTextArea = new FTextArea();
         _loc8_.multiline = true;
         _loc8_.autoSize = TextFieldAutoSize.LEFT;
         _loc8_.wordWrap = true;
         _loc8_.width = 517 - 17;
         _loc8_.height = 140;
         _loc8_.x = 27;
         _loc8_.y = 266 - 50 - 9 + 13 + 20 + 35;
         _loc8_.htmlText = "<textformat ><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("申请神雕情缘活动举办权最少需要100枚侠侣碎片，只能同时对一条线路进行活动申请，一旦申请则当日内无法申请其他线路的活动举办权，请慎重考虑后再行申请！") + "</font></textformat>";
         addChild(_loc8_);
         var _loc9_:FTextArea = new FTextArea();
         _loc9_.multiline = true;
         _loc9_.autoSize = TextFieldAutoSize.LEFT;
         _loc9_.wordWrap = true;
         _loc9_.width = 517 - 17;
         _loc9_.height = 140;
         _loc9_.x = 27;
         _loc9_.y = 266 - 50 - 9 + 13 + 20 + 70;
         _loc9_.htmlText = "<textformat ><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("神雕情缘活动开始后，襄阳城中将出现神雕背负申请者夫妻绕城飞行一周，神雕所过之处将会带给附近玩家大量的经验与真气奖励！在活动结束后，申请者夫妻将各获得一枚神雕之羽。") + "</font></textformat>";
         addChild(_loc9_);
         var _loc10_:Bitmap = StaticValue.getBitmapByClassName("ui.line");
         _loc10_.width = 510;
         _loc10_.x = 20;
         _loc10_.y = 345 + 13 + 25;
         var _loc11_:FTextArea = new FTextArea();
         _loc11_.multiline = true;
         _loc11_.autoSize = TextFieldAutoSize.LEFT;
         _loc11_.wordWrap = true;
         _loc11_.width = 550;
         _loc11_.height = 96;
         _loc11_.x = 27;
         _loc11_.y = 337 + 23 + 13 + 20 - 36 + 8;
         _loc11_.htmlText = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("距离神雕情缘活动申请结束时间还有：") + "</font></textformat>";
         addChild(_loc11_);
         this.shijian = new FTextArea();
         this.shijian.multiline = true;
         this.shijian.autoSize = TextFieldAutoSize.LEFT;
         this.shijian.wordWrap = true;
         this.shijian.width = 550;
         this.shijian.height = 96;
         this.shijian.x = 27 + 195 + 20;
         this.shijian.y = 337 + 23 + 13 + 20 - 36 + 8;
         this.shijian.htmlText = "<textformat ><font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("我不告诉你还有两分钟") + "</font></textformat>";
         addChild(this.shijian);
         this.shuaxinBtn = new SmallButton();
         this.shuaxinBtn.label = LanResManager.getLanCommonTextWords("刷新");
         addChild(this.shuaxinBtn);
         this.shuaxinBtn.x = 465 + 16;
         this.shuaxinBtn.y = 210 - 4;
         this.shuaxinBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBtn = new SecondButton();
         this.lingquBtn.label = LanResManager.getLanCommonTextWords("领取神雕之羽");
         addChild(this.lingquBtn);
         this.lingquBtn.x = 407 - 330;
         this.lingquBtn.y = 380 + 15 - 5 + 9;
         this.lingquBtn.toolTip = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功举办神雕情缘活动后将获得一") + "<br>" + LanResManager.getLanCommonTextWords("枚神雕之羽，请于神雕情缘活动结") + "<br>" + LanResManager.getLanCommonTextWords("束后领取") + "</font></textformat>";
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tuihuiBtn = new SecondButton();
         this.tuihuiBtn.label = LanResManager.getLanCommonTextWords("领取退回的侠侣碎片");
         addChild(this.tuihuiBtn);
         this.tuihuiBtn.x = 407 - 40 - 15;
         this.tuihuiBtn.y = 380 + 15 - 5 + 9;
         this.tuihuiBtn.toolTip = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("申请神雕情缘活动失败时，通过本") + "<br>" + LanResManager.getLanCommonTextWords("按钮领取退回的侠侣碎片，服务器") + "<br>" + LanResManager.getLanCommonTextWords("重新启动时将清空退回的侠侣碎片，") + "<br>" + LanResManager.getLanCommonTextWords("请尽快领取") + "</font></textformat>";
         this.tuihuiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function _onclose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeBtn:
               dispatchEvent(new BaseEvent(UI_SHENDIAOXIALV_PREVIOUS_CLICK,"",this.look - 1));
               break;
            case this.xiayiyeBtn:
               dispatchEvent(new BaseEvent(UI_SHENDIAOXIALV_NEXT_CLICK,"",this.look + 1));
               break;
            case this.shuaxinBtn:
               this.dispatchEvent(new BaseEvent(UI_SHENDIAOXIALV_REFRESHBTN_CLICK));
               break;
            case this.lingquBtn:
               this.dispatchEvent(new BaseEvent(UI_SHENDIAOXIALV_LINGQUBTN_CLICK));
               break;
            case this.tuihuiBtn:
               this.dispatchEvent(new BaseEvent(UI_SHENDIAOXIALV_TUIHUIUBTN_CLICK));
         }
      }
      
      public function setInitialize(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.shenqinglist.dataProvider = param1;
         this.shenqinglist.setSelectItemByIndex(1);
         this.setDaoJiShi(param2);
         this.setYeShu(param3,param4);
      }
      
      private function setDaoJiShi(param1:int) : void
      {
         var _loc2_:int = param1 / 60 / 60;
         var _loc3_:int = param1 / 60 % 60;
         this.shijian.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc2_ + "小时" + _loc3_ + LanResManager.getLanCommonTextWords("分钟") + "</font>";
         if(param1 == 0)
         {
            this.shijian.htmlText = "<font size = \'14\'color = \'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("申请活动暂未开启。") + "</font>";
         }
      }
      
      public function showshendiaohuodong(param1:int) : void
      {
         if(ReloginManager.isInKuafu)
         {
            NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
            return;
         }
         if(this.shendiaohuodong == null)
         {
            this.shendiaohuodong = new ShenDiaoXiaLvShenQingHuoDongPanel();
            this.shendiaohuodong.$parent = this;
         }
         this.shendiaohuodong.visible = true;
         this.shendiaohuodong.setLine(param1);
         this.shendiaohuodong.setTupoInit();
         POPWindowManager.showWindow(this.shendiaohuodong);
      }
      
      public function setYeShu(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         this.look = param2;
         if(param1 > 6)
         {
            _loc3_ = 0;
            if(param1 % 6 == 0)
            {
               _loc3_ = param1 / 6;
            }
            else
            {
               _loc3_ = param1 / 6 + 1;
            }
            if(param2 == 1)
            {
               this.shangyiyeBtn.enabled = false;
            }
            else
            {
               this.shangyiyeBtn.enabled = true;
            }
            if(param2 == _loc3_)
            {
               this.xiayiyeBtn.enabled = false;
            }
            else
            {
               this.xiayiyeBtn.enabled = true;
            }
            this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param2 + "/" + _loc3_ + "</font>";
            this.fanyeSpr.visible = true;
         }
         else
         {
            this.fanyeSpr.visible = false;
         }
      }
   }
}

