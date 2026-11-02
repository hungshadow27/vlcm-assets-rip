package com.tgame.shell.view.components.duanwujie
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class DuanWuJiePanel extends FPanel
   {
      
      public static const UI_DUANWUJIE:String = "UI_DUANWUJIE";
      
      public static const UI_GETXUNZHANG:String = "UI_GETXUNZHANG";
      
      public static const UI_DUANWUJIE_USEITEM:String = "UI_DUANWUJIE_USEITEM";
      
      public static const UI_DUANWUJIE_QIANDAO:String = "UI_DUANWUJIE_QIANDAO";
      
      public static const UI_DUANWUJIE_DUIHUAN:String = "UI_DUANWUJIE_DUIHUAN";
      
      public static const UI_DUANWUJIE_TIJIAO:String = "UI_DUANWUJIE_TIJIAO";
      
      public static const UI_DUANWUJIE_GETJIANGLI:String = "UI_DUANWUJIE_GETJIANGLI";
      
      public static const UI_DUANWUJIE_GETMUMA:String = "UI_DUANWUJIE_GETMUMA";
      
      public static const UI_DUANWUJIE_JIANGCHI:String = "UI_DUANWUJIE_JIANGCHI";
      
      public static const UI_DUANWUJIE_PAIHANG:String = "UI_DUANWUJIE_PAIHANG";
      
      private var tf:TextFormat;
      
      private var huodongneirong:FTextArea;
      
      private var lingquBtn:SecondButton;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var bit:DisplayObject;
      
      private var tod_bit:DisplayObject;
      
      private var qiandaoBtn:SecondButton;
      
      private var duihuanBtn:SecondButton;
      
      private var tijiaoBtn:SecondButton;
      
      private var jiangliBtn:SecondButton;
      
      private var tabBar:FTabBar;
      
      private var item1:ItemFace;
      
      private var item2:ItemFace;
      
      private var item3:ItemFace;
      
      private var subBtn:FSimpleButton;
      
      private var sumBtn:FSimpleButton;
      
      private var count:FTextInput;
      
      private var duihuanCount:int = 0;
      
      private var subBtnX:FSimpleButton;
      
      private var sumBtnX:FSimpleButton;
      
      private var duihuanFts:FTextArea;
      
      private var countX:FTextInput;
      
      private var MaxFts:FTextArea;
      
      private var MAXCountX:int = 0;
      
      private var tijiaoFts:FTextArea;
      
      private var jiangliye:int = 0;
      
      private var jiangchiSpr:Sprite;
      
      private var paihang:DuanWuJieRankPanel;
      
      private var CjBar:ColorBar;
      
      private var TCball1:MovieClip;
      
      private var longzhou:DisplayObject;
      
      private var longSpr:Sprite;
      
      private var huoyuebaifenbi:FTextArea;
      
      public function DuanWuJiePanel()
      {
         var bg:DisplayObject;
         var ft1:FTextArea;
         var spr1:Sprite;
         var spr2:Sprite;
         var box:FCanvas = null;
         var ft:FTextArea = null;
         var loadUrl:String = null;
         var img:F9GridBitmap = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("浓情端午");
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 370 + 30 + 60 + 100 + 111;
         height = 403 + 2 + 2 + 180;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tf = new TextFormat();
         this.tf.align = "center";
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duanwujie/bg.swf");
         bg.x = 10;
         bg.y = 2;
         addChild(bg);
         box = new FCanvas();
         box.skin = "box";
         box.x = 228 + 10;
         box.y = 2;
         box.width = 300 + 11;
         box.height = 70;
         box = new FCanvas();
         box.skin = "box";
         box.x = 228 + 10;
         box.y = 70;
         box.width = 300 + 11;
         box.height = 403 + 2 - 70 - 73;
         ft1 = new FTextArea();
         ft1.wordWrap = true;
         ft1.multiline = true;
         ft1.x = 30;
         ft1.y = 20;
         ft1.width = 250 + 50;
         ft1.height = 40;
         ft1.htmlText = "<font size = \'15\' color =\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("一见粽情") + "</font>";
         this.qiandaoBtn = new SecondButton();
         addChild(this.qiandaoBtn);
         this.qiandaoBtn.x = 150 + 240;
         this.qiandaoBtn.y = 70 - 20;
         this.qiandaoBtn.label = LanResManager.getLanCommonTextWords("签到");
         this.qiandaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         ft = new FTextArea();
         ft.x = 20;
         ft.y = 120 - 4 - 2;
         ft.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("活跃度") + "</font>";
         addChild(ft);
         ft = new FTextArea();
         ft.x = 490 + 7;
         ft.y = 140;
         ft.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("粽叶") + "</font>";
         addChild(ft);
         ft = new FTextArea();
         ft.x = 490 + 87 + 7;
         ft.y = 140;
         ft.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("馅料") + "</font>";
         addChild(ft);
         ft = new FTextArea();
         ft.x = 535 + 3;
         ft.y = 277 - 3;
         ft.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("粽子") + "</font>";
         addChild(ft);
         ft = new FTextArea();
         ft.x = 530 + 7;
         ft.y = 12;
         ft.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("需要签到3天") + "</font>";
         addChild(ft);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duanwujie/huoyuekuang.swf");
         bg.x = 60 + 1;
         bg.y = 111 + 1;
         addChild(bg);
         this.CjBar = new ColorBar(7,388,9);
         addChild(this.CjBar);
         this.CjBar.x = 69 - 4;
         this.CjBar.y = 152 - 11 - 27;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/duanwujie/hailang.swf";
         this.TCball1 = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            TCball1 = _loc2_.content as MovieClip;
            TCball1.x = 45;
            TCball1.y = 107;
            addChild(TCball1);
         },null,false,loadUrl);
         this.huoyuebaifenbi = new FTextArea();
         addChild(this.huoyuebaifenbi);
         this.huoyuebaifenbi.width = 50;
         this.huoyuebaifenbi.height = 20;
         this.huoyuebaifenbi.filters = StaticValue.filter;
         this.huoyuebaifenbi.x = 242;
         this.huoyuebaifenbi.y = 116;
         this.huodongneirong = new FTextArea();
         addChild(this.huodongneirong);
         this.huodongneirong.width = 400 + 20;
         this.huodongneirong.height = 240 + 70;
         this.huodongneirong.wordWrap = true;
         this.huodongneirong.x = 35 - 8;
         this.huodongneirong.y = 100 + 42;
         this.huodongneirong.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动说明：") + "<br>" + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动时间：5月31日 00:00 – 6月2日 22:00") + "<br>" + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1.为了庆祝端午佳节，签到3日即送“一见粽情”勋章。") + "<br>" + LanResManager.getLanCommonTextWords("2.全地图所有怪物均有几率掉落粽叶、馅料、气球、飞镖、粽子，1个馅料和2个粽叶可以兑换1个粽子，提交粽子增加活跃度。") + "<br>" + LanResManager.getLanCommonTextWords("3.活跃度到达指定阶段会有相应奖励，当到达100%时可领取“粽成眷属”勋章。") + "<br>" + LanResManager.getLanCommonTextWords("4.气球使用之后会出现在头顶，最多可使用三个气球，气球会随着时间推移而变大。") + "<br>" + LanResManager.getLanCommonTextWords("5.保护气球5分钟，不被其他玩家击破，您将会获得气球里所有奖励。") + "<br>" + LanResManager.getLanCommonTextWords("6.使用飞镖击破其他玩家气球，掉落的奖励可自由拾取。") + "<br>" + LanResManager.getLanCommonTextWords("7.玩家提交的粽子数量将会在排行榜中进行排名，活动结束将进行结算。") + "<br>" + "</font><font color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager
         .getLanCommonTextWords("8.前10名玩家，将获得神圣的") + "</font><font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("“七彩木马”") + "</font><font color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("换装永久限量版。") + "<br>" + "</font><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("9.第11-50名玩家，将获得神圣的") + "</font><font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("“七彩木马”") + "</font><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("换装30天版。") + "<br>" + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("10.提交粽子的玩家，将获得神圣的") + "</font><font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("“七彩木马”") + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("换装7天版。") + "<br>" + "</font><font color=\'" + StaticValue
         .WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("11.活动中奖励的领取截止到6月3日 24:00时，届时活动中未领取奖励将全部消失，请您注意，以免对您造成损失，祝您节日快乐。") + "<br></font>";
         this.lingquBtn = new SecondButton();
         addChild(this.lingquBtn);
         this.lingquBtn.x = 240 + 50 + 150 + 100;
         this.lingquBtn.y = 100 + 60 - 80 + 2;
         this.lingquBtn.label = LanResManager.getLanCommonTextWords("领取勋章");
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.duihuanFts = new FTextArea();
         addChild(this.duihuanFts);
         this.duihuanFts.width = 200;
         this.duihuanFts.height = 20;
         this.duihuanFts.x = 410 + 71;
         this.duihuanFts.y = 220 - 80 + 65;
         this.MaxFts = new FTextArea();
         addChild(this.MaxFts);
         this.MaxFts.width = 200;
         this.MaxFts.height = 20;
         this.MaxFts.x = 410 + 71;
         this.MaxFts.y = 220 + 20 + 30 + 58;
         this.tijiaoFts = new FTextArea();
         addChild(this.tijiaoFts);
         this.tijiaoFts.width = 200;
         this.tijiaoFts.height = 20;
         this.tijiaoFts.x = 410 + 71;
         this.tijiaoFts.y = 220 + 20 + 20 + 30 + 77;
         spr1 = new Sprite();
         spr1.x = 330 + 150;
         spr1.y = 45 + 60 + 70 - 2;
         addChild(spr1);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         spr1.addChild(this.subBtn);
         this.subBtn.x = 72 - 25;
         this.subBtn.y = 81 - 25;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick1);
         ft = new FTextArea();
         addChild(ft);
         ft.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("兑换") + "</font>";
         ft.width = 25 + 5;
         ft.height = 20;
         ft.x = 410 + 71;
         ft.y = 220 - 80 + 65 + 20 + 5;
         img = Tools.get9GridBitmpByName("countBg");
         spr1.addChild(img);
         img.width = 70;
         img.x = 98 - 27;
         img.y = 83 - 27 - 1;
         this.count = new FTextInput();
         this.count.defaultTextFormat = this.tf;
         this.count.restrict = "0-9";
         this.count.text = "1";
         this.count.textColor = 16777215;
         spr1.addChild(this.count);
         this.count.x = 94 - 21;
         this.count.y = 83 - 27;
         this.count.width = 68;
         this.count.height = 20;
         this.count.addEventListener(Event.CHANGE,this.onChange);
         this.sumBtn = new FSimpleButton();
         this.sumBtn.skin = "sumButton";
         spr1.addChild(this.sumBtn);
         this.sumBtn.x = 168 + 25 - 45;
         this.sumBtn.y = 81 - 25;
         this.sumBtn.addEventListener(MouseEvent.CLICK,this.onClick1);
         this.duihuanBtn = new SecondButton();
         addChild(this.duihuanBtn);
         this.duihuanBtn.x = 240 + 50 + 150 + 80;
         this.duihuanBtn.y = 100 + 30 + 60 + 70 - 10;
         this.duihuanBtn.label = LanResManager.getLanCommonTextWords("兑换粽子");
         this.duihuanBtn.addEventListener(MouseEvent.CLICK,this.onClick1);
         spr2 = new Sprite();
         spr2.x = 330 + 150;
         spr2.y = 45 + 60 + 70 + 45;
         addChild(spr2);
         this.subBtnX = new FSimpleButton();
         this.subBtnX.skin = "subButton";
         spr2.addChild(this.subBtnX);
         this.subBtnX.x = 72 - 25;
         this.subBtnX.y = 81 - 25 + 70;
         this.subBtnX.addEventListener(MouseEvent.CLICK,this.onClick2);
         ft = new FTextArea();
         addChild(ft);
         ft.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("提交") + "</font>";
         ft.width = 25 + 5;
         ft.height = 20;
         ft.x = 410 + 71;
         ft.y = 220 - 80 + 65 + 138 + 5;
         img = Tools.get9GridBitmpByName("countBg");
         spr2.addChild(img);
         img.width = 70;
         img.x = 98 - 27;
         img.y = 83 - 27 - 1 + 70;
         this.countX = new FTextInput();
         this.countX.restrict = "0-9";
         this.countX.text = "1";
         this.countX.textColor = 16777215;
         this.countX.defaultTextFormat = this.tf;
         spr2.addChild(this.countX);
         this.countX.x = 94 - 21;
         this.countX.y = 83 - 27 + 70;
         this.countX.width = 68;
         this.countX.height = 20;
         this.countX.addEventListener(Event.CHANGE,this.onChange2);
         this.sumBtnX = new FSimpleButton();
         this.sumBtnX.skin = "sumButton";
         spr2.addChild(this.sumBtnX);
         this.sumBtnX.x = 168 + 25 - 45;
         this.sumBtnX.y = 81 - 25 + 70;
         this.sumBtnX.addEventListener(MouseEvent.CLICK,this.onClick2);
         this.tijiaoBtn = new SecondButton();
         addChild(this.tijiaoBtn);
         this.tijiaoBtn.x = 240 + 50 + 150 + 80;
         this.tijiaoBtn.y = 100 + 30 + 60 + 170 + 24;
         this.tijiaoBtn.label = LanResManager.getLanCommonTextWords("提交粽子");
         this.tijiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick2);
         this.jiangliBtn = new SecondButton();
         addChild(this.jiangliBtn);
         this.jiangliBtn.x = 240 + 50 + 150 + 130;
         this.jiangliBtn.y = 100 + 30 + 60 + 280 - 3;
         this.jiangliBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.jiangliBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 250 + 220 + 82;
         this.kuang.y = 40 + 60 - 80 + 15;
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 400 + 92;
         this.kuang.y = 170 - 12;
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 470 + 92 + 17;
         this.kuang.y = 170 - 12;
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 350 + 185;
         this.kuang.y = 220 + 70;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 250 + 2 + 220 + 82;
         this.jinengSpr.y = 40 + 2 + 60 - 80 + 15;
         addChild(this.jinengSpr);
         this.jiangchiSpr = new Sprite();
         this.jiangchiSpr.x = 25;
         this.jiangchiSpr.y = 450 + 8;
         addChild(this.jiangchiSpr);
         this.longSpr = new Sprite();
         addChild(this.longSpr);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         this.paihang.guanbi();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lingquBtn:
               dispatchEvent(new BaseEvent(UI_GETXUNZHANG));
               break;
            case this.jiangliBtn:
               dispatchEvent(new BaseEvent(UI_DUANWUJIE_GETJIANGLI,"",this.jiangliye));
               break;
            case this.qiandaoBtn:
               dispatchEvent(new BaseEvent(UI_DUANWUJIE_QIANDAO));
         }
      }
      
      private function setItem(param1:Boolean) : void
      {
         var _loc3_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc2_:Goods = new Goods(370985);
         _loc3_ = new ItemFace(_loc2_);
         this.jinengSpr.addChild(_loc3_);
      }
      
      public function setJiangchi(param1:int, param2:Array, param3:Boolean) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:ItemFace = null;
         this.tabBar = new FTabBar();
         this.tabBar.x = 10 + 6;
         this.tabBar.y = 415 + 10;
         addChild(this.tabBar);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃度20%"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃度40%"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃度60%"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃度80%"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃度100%"),this.onTabClick);
         this.jiangliye = param1;
         switch(param1)
         {
            case 1:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃度20%"));
               break;
            case 2:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃度40%"));
               break;
            case 3:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃度60%"));
               break;
            case 4:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃度80%"));
               break;
            case 5:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃度100%"));
         }
         while(this.jiangchiSpr.numChildren > 0)
         {
            this.jiangchiSpr.removeChildAt(0);
         }
         var _loc4_:int = 0;
         while(_loc4_ < param2.length)
         {
            _loc5_ = new Goods(param2[_loc4_].goodid);
            _loc5_.count = param2[_loc4_].count;
            _loc6_ = new ItemFace(_loc5_);
            _loc6_.x = _loc4_ * 45;
            _loc6_.y = 0;
            this.jiangchiSpr.addChild(_loc6_);
            _loc4_++;
         }
         this.jiangliBtn.enabled = param3;
      }
      
      public function update(param1:Array, param2:int, param3:Boolean, param4:Boolean, param5:int, param6:int, param7:int) : void
      {
         this.setDaoju();
         this.setQiandao(param1,param2,param3);
         this.huoyuebaifenbi.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param5 + "%</font>";
         while(this.longSpr.numChildren > 0)
         {
            this.longSpr.removeChildAt(0);
         }
         this.CjBar.setValue(param5,100);
         this.CjBar.showNumber(false);
         this.longzhou = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duanwujie/xiaolongzhou.swf");
         this.longzhou.x = 27 + param5 * 4;
         this.longzhou.y = 87;
         this.longSpr.addChild(this.longzhou);
         this.setItem(param4);
         if(param4)
         {
            this.lingquBtn.enabled = true;
         }
         else
         {
            this.lingquBtn.enabled = false;
         }
         this.duihuanCount = param6;
         this.duihuanFts.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("最大可兑换粽子数量") + param6 + "</font>";
         this.tijiaoFts.htmlText = "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("提交粽子总数量") + param7 + "</font>";
         this.countX.text = "1";
         this.count.text = "1";
      }
      
      private function setQiandao(param1:Array, param2:int, param3:Boolean) : void
      {
         var _loc4_:int = 0;
         while(_loc4_ < 3)
         {
            if(param1[_loc4_].qiandao)
            {
               this.bit = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duanwujie/bg_yqd.swf");
            }
            else
            {
               this.bit = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duanwujie/bg_wqd.swf");
            }
            this.bit.x = 127 * _loc4_ + 10 + 35;
            this.bit.y = 40 + 7;
            addChild(this.bit);
            if(_loc4_ == param2 - 1)
            {
               this.tod_bit = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/duanwujie/today.swf");
               this.tod_bit.x = this.bit.x + 29 + 5;
               this.tod_bit.y = this.bit.y;
               addChild(this.tod_bit);
            }
            _loc4_++;
         }
         var _loc5_:FTextArea = new FTextArea();
         _loc5_.x = 53;
         _loc5_.y = 55;
         _loc5_.width = 320;
         _loc5_.htmlText = "<font color = \'" + StaticValue.BlUE20_HTML + "\'> " + LanResManager.getLanCommonTextWords("第一日") + "               " + LanResManager.getLanCommonTextWords("第二日") + "               " + LanResManager.getLanCommonTextWords("第三日") + "</font>";
         addChild(_loc5_);
         this.qiandaoBtn.enabled = param3;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("活跃度20%"):
               _loc2_ = 1;
               dispatchEvent(new BaseEvent(UI_DUANWUJIE_JIANGCHI,"",_loc2_));
               break;
            case LanResManager.getLanCommonTextWords("活跃度40%"):
               _loc2_ = 2;
               dispatchEvent(new BaseEvent(UI_DUANWUJIE_JIANGCHI,"",_loc2_));
               break;
            case LanResManager.getLanCommonTextWords("活跃度60%"):
               _loc2_ = 3;
               dispatchEvent(new BaseEvent(UI_DUANWUJIE_JIANGCHI,"",_loc2_));
               break;
            case LanResManager.getLanCommonTextWords("活跃度80%"):
               _loc2_ = 4;
               dispatchEvent(new BaseEvent(UI_DUANWUJIE_JIANGCHI,"",_loc2_));
               break;
            case LanResManager.getLanCommonTextWords("活跃度100%"):
               _loc2_ = 5;
               dispatchEvent(new BaseEvent(UI_DUANWUJIE_JIANGCHI,"",_loc2_));
         }
      }
      
      private function setDaoju() : void
      {
         var _loc1_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(42110,true);
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(42111,true);
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(42112,true);
         this.MAXCountX = _loc3_.count;
         this.MaxFts.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("背包粽子数量") + this.MAXCountX + "</font>";
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         this.item1 = new ItemFace(_loc1_);
         this.item1.x = 400 + 2 + 92;
         this.item1.y = 170 + 2 - 12;
         addChild(this.item1);
         if(this.item2 != null && this.item2.parent != null)
         {
            this.item2.parent.removeChild(this.item2);
         }
         this.item2 = new ItemFace(_loc2_);
         this.item2.x = 470 + 2 + 92 + 17;
         this.item2.y = 170 + 2 - 12;
         addChild(this.item2);
         if(this.item3 != null && this.item3.parent != null)
         {
            this.item3.parent.removeChild(this.item3);
         }
         this.item3 = new ItemFace(_loc3_);
         this.item3.x = 350 + 2 + 185;
         this.item3.y = 220 + 2 + 70;
         addChild(this.item3);
      }
      
      private function onChange(param1:Event) : void
      {
         if(int(this.count.text) <= 1)
         {
            this.count.text = "1";
         }
         if(int(this.count.text) >= this.duihuanCount)
         {
            this.count.text = String(this.duihuanCount);
         }
      }
      
      private function onClick1(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtn:
               if(int(this.count.text) > 1)
               {
                  this.count.text = (int(this.count.text) - 1).toString();
               }
               else
               {
                  this.count.text = "1";
               }
               break;
            case this.sumBtn:
               if(int(this.count.text) >= this.duihuanCount)
               {
                  this.count.text = this.duihuanCount.toString();
               }
               else
               {
                  this.count.text = (int(this.count.text) + 1).toString();
               }
               break;
            case this.duihuanBtn:
               dispatchEvent(new BaseEvent(UI_DUANWUJIE_DUIHUAN,"",int(this.count.text)));
               this.setDaoju();
         }
      }
      
      private function onChange2(param1:Event) : void
      {
         if(int(this.countX.text) <= 1)
         {
            this.countX.text = "1";
         }
         if(int(this.countX.text) >= this.MAXCountX)
         {
            this.countX.text = String(this.MAXCountX);
         }
      }
      
      private function onClick2(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtnX:
               if(int(this.countX.text) > 1)
               {
                  this.countX.text = (int(this.countX.text) - 1).toString();
               }
               else
               {
                  this.countX.text = "1";
               }
               break;
            case this.sumBtnX:
               if(int(this.countX.text) >= this.MAXCountX)
               {
                  this.countX.text = this.MAXCountX.toString();
               }
               else
               {
                  this.countX.text = (int(this.countX.text) + 1).toString();
               }
               break;
            case this.tijiaoBtn:
               dispatchEvent(new BaseEvent(UI_DUANWUJIE_TIJIAO,"",int(this.countX.text)));
               this.setDaoju();
         }
      }
      
      public function setPaihang(param1:int, param2:int, param3:Array, param4:Boolean, param5:int) : void
      {
         if(!this.paihang)
         {
            this.paihang = new DuanWuJieRankPanel();
            this.paihang.$parent = this;
         }
         this.paihang.x = 370 + 30 + 60 + 100 + 111;
         this.paihang.y = -30 - 2;
         this.paihang.dragAble = false;
         addChild(this.paihang);
         this.paihang.updateRank(param1,param2,param3,param4,param5);
      }
   }
}

