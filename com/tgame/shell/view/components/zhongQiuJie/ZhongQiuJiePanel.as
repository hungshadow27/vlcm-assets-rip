package com.tgame.shell.view.components.zhongQiuJie
{
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class ZhongQiuJiePanel extends FPanel
   {
      
      public static const UI_ZHONGQIUJIE:String = "UI_ZHONGQIUJIE";
      
      public static const UI_ZHONGQIUJIE_DUIHUAN:String = "UI_ZHONGQIUJIE_DUIHUAN";
      
      public static const UI_ZHONGQIUJIE_TIJIAO:String = "UI_ZHONGQIUJIE_TIJIAO";
      
      public static const UI_ZHONGQIUJIE_GETJIANGLI:String = "UI_ZHONGQIUJIE_GETJIANGLI";
      
      public static const UI_ZHONGQIUJIE_GETRANK_GOODS:String = "UI_ZHONGQIUJIE_GETRANK_GOODS";
      
      public static const UI_ZHONGQIUJIE_PAIHANG:String = "UI_ZHONGQIUJIE_PAIHANG";
      
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
      
      private var duiHuanInput:FTextInput;
      
      private var canDuiHuanNum:int = 0;
      
      private var subBtnX:FSimpleButton;
      
      private var sumBtnX:FSimpleButton;
      
      private var duihuanFts:FTextArea;
      
      private var tiJiaoInput:FTextInput;
      
      private var MaxFts:FTextArea;
      
      private var canTuiJiaoNum:int = 0;
      
      private var tijiaoFts:FTextArea;
      
      private var jiangLiIndex:int = 0;
      
      private var jiangchiSpr:Sprite;
      
      private var paihang:ZhongQiuJieRankPanel;
      
      private var CjBar:ColorBar;
      
      private var longzhou:DisplayObject;
      
      private var longSpr:Sprite;
      
      private var huoyuebaifenbi:FTextArea;
      
      private var scroll:FVScorllBar;
      
      private var shuoMingSp:Sprite;
      
      private var barMc:MovieClip;
      
      private var huoYueDu:int = 0;
      
      private var jiangchiAr:Array;
      
      private var num:FTextArea;
      
      public function ZhongQiuJiePanel()
      {
         var bg:DisplayObject;
         var shuoMing:DisplayObject;
         var spr1:Sprite;
         var spr2:Sprite;
         var box:FCanvas = null;
         var ft1:FTextArea = null;
         var ft:FTextArea = null;
         var img:F9GridBitmap = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("中秋节");
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 370 + 30 + 60 + 100 + 111 - 80 - 5 + 2;
         height = 403 + 2 + 2 + 180;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tf = new TextFormat();
         this.tf.align = "center";
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhongQiuJie/bg.swf");
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
         this.qiandaoBtn.x = 150 + 240;
         this.qiandaoBtn.y = 70 - 20;
         this.qiandaoBtn.label = LanResManager.getLanCommonTextWords("签到");
         this.qiandaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         ft = new FTextArea();
         ft.x = 20;
         ft.y = 120 - 4 - 2;
         ft.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("活跃度") + "</font>";
         addChild(ft);
         LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/zhongQiuJie/bar.swf",function(param1:MovieClip):*
         {
            if(param1)
            {
               barMc = param1;
               barMc.x = 65;
               barMc.y = 114;
               barMc.gotoAndStop(huoYueDu);
               addChildAt(barMc,1);
            }
         });
         ft = new FTextArea();
         ft.x = 405;
         ft.y = 140;
         ft.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("月饼馅料") + "</font>";
         addChild(ft);
         ft = new FTextArea();
         ft.x = 505;
         ft.y = 140;
         ft.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("面粉") + "</font>";
         addChild(ft);
         ft = new FTextArea();
         ft.x = 462;
         ft.y = 277 - 3;
         ft.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("月饼") + "</font>";
         addChild(ft);
         ft = new FTextArea();
         ft.x = 530 + 7;
         ft.y = 12;
         ft.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("需要签到3天") + "</font>";
         this.huoyuebaifenbi = new FTextArea();
         addChildAt(this.huoyuebaifenbi,2);
         this.huoyuebaifenbi.width = 50;
         this.huoyuebaifenbi.height = 20;
         this.huoyuebaifenbi.filters = StaticValue.filter;
         this.huoyuebaifenbi.x = 242;
         this.huoyuebaifenbi.y = 116;
         this.huodongneirong = new FTextArea();
         this.huodongneirong.width = 400 + 20;
         this.huodongneirong.height = 240 + 70;
         this.huodongneirong.wordWrap = true;
         this.huodongneirong.x = 35 - 8;
         this.huodongneirong.y = 100 + 42;
         this.huodongneirong.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动说明：") + "<br>" + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动时间：5月31日 00:00 – 6月2日 22:00") + "<br>" + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1.为了庆祝端午佳节，签到3日即送“一见粽情”勋章。") + "<br>" + LanResManager.getLanCommonTextWords("2.全地图所有怪物均有几率掉落粽叶、馅料、气球、飞镖、月饼，1个馅料和2个粽叶可以兑换1个月饼，提交月饼增加活跃度。") + "<br>" + LanResManager.getLanCommonTextWords("3.活跃度到达指定阶段会有相应奖励，当到达100%时可领取“粽成眷属”勋章。") + "<br>" + LanResManager.getLanCommonTextWords("4.气球使用之后会出现在头顶，最多可使用三个气球，气球会随着时间推移而变大。") + "<br>" + LanResManager.getLanCommonTextWords("5.保护气球5分钟，不被其他玩家击破，您将会获得气球里所有奖励。") + "<br>" + LanResManager.getLanCommonTextWords("6.使用飞镖击破其他玩家气球，掉落的奖励可自由拾取。") + "<br>" + LanResManager.getLanCommonTextWords("7.玩家提交的月饼数量将会在排行榜中进行排名，活动结束将进行结算。") + "<br>" + "</font><font color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager
         .getLanCommonTextWords("8.前10名玩家，将获得神圣的") + "</font><font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("“七彩木马”") + "</font><font color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("换装永久限量版。") + "<br>" + "</font><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("9.第11-50名玩家，将获得神圣的") + "</font><font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("“七彩木马”") + "</font><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("换装30天版。") + "<br>" + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("10.提交月饼的玩家，将获得神圣的") + "</font><font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("“七彩木马”") + "</font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("换装7天版。") + "<br>" + "</font><font color=\'" + StaticValue
         .WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("11.活动中奖励的领取截止到6月3日 24:00时，届时活动中未领取奖励将全部消失，请您注意，以免对您造成损失，祝您节日快乐。") + "<br></font>";
         this.shuoMingSp = new Sprite();
         this.shuoMingSp.x = 20 - 3;
         this.shuoMingSp.y = 150;
         addChild(this.shuoMingSp);
         with(this.shuoMingSp)
         {
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,350,450);
            graphics.endFill();
         }
         shuoMing = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhongQiuJie/shuoMing.swf");
         addChild(shuoMing);
         this.shuoMingSp.addChild(shuoMing);
         this.scroll = new FVScorllBar(this.shuoMingSp,235);
         addChild(this.scroll);
         this.scroll.x = 355 + 2;
         this.scroll.y = 150 + 5;
         this.duihuanFts = new FTextArea();
         addChild(this.duihuanFts);
         this.duihuanFts.width = 200;
         this.duihuanFts.height = 20;
         this.duihuanFts.x = 410;
         this.duihuanFts.y = 200;
         this.MaxFts = new FTextArea();
         addChild(this.MaxFts);
         this.MaxFts.width = 200;
         this.MaxFts.height = 20;
         this.MaxFts.x = 410;
         this.MaxFts.y = 335;
         this.tijiaoFts = new FTextArea();
         addChild(this.tijiaoFts);
         this.tijiaoFts.width = 200;
         this.tijiaoFts.height = 20;
         this.tijiaoFts.x = 410;
         this.tijiaoFts.y = 375;
         spr1 = new Sprite();
         spr1.x = 395;
         spr1.y = 165;
         addChild(spr1);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         spr1.addChild(this.subBtn);
         this.subBtn.x = 72 - 25;
         this.subBtn.y = 81 - 25;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick1);
         ft = new FTextArea();
         addChild(ft);
         ft.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("兑换数量:") + "</font>";
         ft.width = 60;
         ft.height = 20;
         ft.x = 380 + 5;
         ft.y = 220;
         img = Tools.get9GridBitmpByName("countBg");
         spr1.addChild(img);
         img.width = 70;
         img.x = 98 - 27;
         img.y = 83 - 27 - 1;
         this.duiHuanInput = new FTextInput();
         this.duiHuanInput.defaultTextFormat = this.tf;
         this.duiHuanInput.restrict = "0-9";
         this.duiHuanInput.text = "1";
         this.duiHuanInput.textColor = 16777215;
         spr1.addChild(this.duiHuanInput);
         this.duiHuanInput.x = 94 - 21;
         this.duiHuanInput.y = 83 - 27;
         this.duiHuanInput.width = 68;
         this.duiHuanInput.height = 20;
         this.duiHuanInput.addEventListener(Event.CHANGE,this.onChange);
         this.sumBtn = new FSimpleButton();
         this.sumBtn.skin = "sumButton";
         spr1.addChild(this.sumBtn);
         this.sumBtn.x = 168 + 25 - 45;
         this.sumBtn.y = 81 - 25;
         this.sumBtn.addEventListener(MouseEvent.CLICK,this.onClick1);
         this.duihuanBtn = new SecondButton();
         addChild(this.duihuanBtn);
         this.duihuanBtn.x = 440;
         this.duihuanBtn.y = 245;
         this.duihuanBtn.label = LanResManager.getLanCommonTextWords("兑换月饼");
         this.duihuanBtn.addEventListener(MouseEvent.CLICK,this.onClick1);
         spr2 = new Sprite();
         spr2.x = 395;
         spr2.y = 230;
         addChild(spr2);
         this.subBtnX = new FSimpleButton();
         this.subBtnX.skin = "subButton";
         spr2.addChild(this.subBtnX);
         this.subBtnX.x = 72 - 25;
         this.subBtnX.y = 81 - 25 + 70;
         this.subBtnX.addEventListener(MouseEvent.CLICK,this.onClick2);
         ft = new FTextArea();
         addChild(ft);
         ft.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("提交数量:") + "</font>";
         ft.width = 60;
         ft.height = 20;
         ft.x = 380 + 5;
         ft.y = 355;
         img = Tools.get9GridBitmpByName("countBg");
         spr2.addChild(img);
         img.width = 70;
         img.x = 98 - 27;
         img.y = 83 - 27 - 1 + 70;
         this.tiJiaoInput = new FTextInput();
         this.tiJiaoInput.restrict = "0-9";
         this.tiJiaoInput.text = "1";
         this.tiJiaoInput.textColor = 16777215;
         this.tiJiaoInput.defaultTextFormat = this.tf;
         spr2.addChild(this.tiJiaoInput);
         this.tiJiaoInput.x = 94 - 21;
         this.tiJiaoInput.y = 83 - 27 + 70;
         this.tiJiaoInput.width = 68;
         this.tiJiaoInput.height = 20;
         this.tiJiaoInput.addEventListener(Event.CHANGE,this.onChange2);
         this.sumBtnX = new FSimpleButton();
         this.sumBtnX.skin = "sumButton";
         spr2.addChild(this.sumBtnX);
         this.sumBtnX.x = 168 + 25 - 45;
         this.sumBtnX.y = 81 - 25 + 70;
         this.sumBtnX.addEventListener(MouseEvent.CLICK,this.onClick2);
         this.tijiaoBtn = new SecondButton();
         addChild(this.tijiaoBtn);
         this.tijiaoBtn.x = 440;
         this.tijiaoBtn.y = 395;
         this.tijiaoBtn.label = LanResManager.getLanCommonTextWords("提交月饼");
         this.tijiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick2);
         this.jiangliBtn = new SecondButton();
         addChild(this.jiangliBtn);
         this.jiangliBtn.x = 480;
         this.jiangliBtn.y = 460;
         this.jiangliBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.jiangliBtn.addEventListener(MouseEvent.CLICK,this.onClick);
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
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.jiangliBtn:
               dispatchEvent(new BaseEvent(UI_ZHONGQIUJIE_GETJIANGLI,"",this.jiangLiIndex + 1));
         }
      }
      
      public function setJiangchi(param1:Array) : void
      {
         this.jiangchiAr = param1;
         this.tabBar = new FTabBar();
         this.tabBar.x = 10 + 6;
         this.tabBar.y = 415 + 10;
         addChild(this.tabBar);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃度20%"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃度40%"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃度60%"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃度80%"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("活跃度100%"),this.onTabClick);
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(param1[_loc2_].isGet != false)
            {
               this.jiangLiIndex = _loc2_;
               break;
            }
            this.jiangLiIndex = 0;
            _loc2_++;
         }
         switch(this.jiangLiIndex)
         {
            case 0:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃度20%"));
               break;
            case 1:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃度40%"));
               break;
            case 2:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃度60%"));
               break;
            case 3:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃度80%"));
               break;
            case 4:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("活跃度100%"));
         }
         this.setJiangLiGoods(this.jiangLiIndex);
      }
      
      public function setJiangLiGoods(param1:int) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.jiangchiSpr.numChildren > 0)
         {
            this.jiangchiSpr.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.jiangchiAr[param1].goodsArr.length)
         {
            _loc3_ = this.jiangchiAr[param1].goodsArr[_loc2_];
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.x = _loc2_ * 45;
            _loc4_.y = 0;
            this.jiangchiSpr.addChild(_loc4_);
            _loc2_++;
         }
         this.jiangliBtn.enabled = this.jiangchiAr[param1].isGet;
      }
      
      public function update(param1:int, param2:int, param3:*, param4:*) : void
      {
         this.huoYueDu = param1;
         this.setDaoju(param3,param4);
         this.huoyuebaifenbi.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "%</font>";
         while(this.longSpr.numChildren > 0)
         {
            this.longSpr.removeChildAt(0);
         }
         if(this.barMc != null)
         {
            this.barMc.gotoAndStop(param1);
         }
         this.longzhou = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhongQiuJie/tuZhi.swf");
         this.longzhou.x = 27 + param1 * 4;
         this.longzhou.y = 70;
         this.longSpr.addChild(this.longzhou);
         this.tijiaoFts.htmlText = "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("提交月饼总数量:") + param2 + "</font>";
         this.tiJiaoInput.text = "1";
         this.duiHuanInput.text = "1";
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("活跃度20%"):
               this.jiangLiIndex = 0;
               break;
            case LanResManager.getLanCommonTextWords("活跃度40%"):
               this.jiangLiIndex = 1;
               break;
            case LanResManager.getLanCommonTextWords("活跃度60%"):
               this.jiangLiIndex = 2;
               break;
            case LanResManager.getLanCommonTextWords("活跃度80%"):
               this.jiangLiIndex = 3;
               break;
            case LanResManager.getLanCommonTextWords("活跃度100%"):
               this.jiangLiIndex = 4;
         }
         this.setJiangLiGoods(this.jiangLiIndex);
      }
      
      private function setDaoju(param1:Array, param2:Goods) : void
      {
         var _loc3_:Goods = param1[0];
         var _loc4_:Goods = param1[1];
         var _loc5_:Goods = param2;
         if(_loc3_.count >= _loc4_.count)
         {
            this.duihuanFts.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("最大可兑换月饼数量:") + _loc4_.count + "</font>";
         }
         else
         {
            this.duihuanFts.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("最大可兑换月饼数量:") + _loc3_.count + "</font>";
         }
         this.canDuiHuanNum = _loc3_.count > _loc4_.count ? _loc4_.count : _loc3_.count;
         this.canTuiJiaoNum = _loc5_.count;
         this.MaxFts.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("背包月饼数量:") + this.canTuiJiaoNum + "</font>";
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         this.item1 = new ItemFace(_loc3_);
         this.item1.x = 413;
         this.item1.y = 170 + 2 - 12;
         addChild(this.item1);
         if(this.item2 != null && this.item2.parent != null)
         {
            this.item2.parent.removeChild(this.item2);
         }
         this.item2 = new ItemFace(_loc4_);
         this.item2.x = 501;
         this.item2.y = 170 + 2 - 12;
         addChild(this.item2);
         if(this.item3 != null && this.item3.parent != null)
         {
            this.item3.parent.removeChild(this.item3);
         }
         this.item3 = new ItemFace(_loc5_);
         this.item3.x = 457;
         this.item3.y = 295;
         addChild(this.item3);
      }
      
      private function onChange(param1:Event) : void
      {
         if(int(this.duiHuanInput.text) <= 1)
         {
            this.duiHuanInput.text = "1";
         }
         if(int(this.duiHuanInput.text) >= this.canDuiHuanNum)
         {
            this.duiHuanInput.text = String(this.canDuiHuanNum);
         }
      }
      
      private function onClick1(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtn:
               if(int(this.duiHuanInput.text) > 1)
               {
                  this.duiHuanInput.text = (int(this.duiHuanInput.text) - 1).toString();
               }
               else
               {
                  this.duiHuanInput.text = "1";
               }
               break;
            case this.sumBtn:
               if(int(this.duiHuanInput.text) >= this.canDuiHuanNum)
               {
                  this.duiHuanInput.text = this.canDuiHuanNum.toString();
               }
               else
               {
                  this.duiHuanInput.text = (int(this.duiHuanInput.text) + 1).toString();
               }
               break;
            case this.duihuanBtn:
               dispatchEvent(new BaseEvent(UI_ZHONGQIUJIE_DUIHUAN,"",int(this.duiHuanInput.text)));
         }
      }
      
      private function onChange2(param1:Event) : void
      {
         if(int(this.tiJiaoInput.text) <= 1)
         {
            this.tiJiaoInput.text = "1";
         }
         if(int(this.tiJiaoInput.text) >= this.canTuiJiaoNum)
         {
            this.tiJiaoInput.text = String(this.canTuiJiaoNum);
         }
      }
      
      private function onClick2(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtnX:
               if(int(this.tiJiaoInput.text) > 1)
               {
                  this.tiJiaoInput.text = (int(this.tiJiaoInput.text) - 1).toString();
               }
               else
               {
                  this.tiJiaoInput.text = "1";
               }
               break;
            case this.sumBtnX:
               if(int(this.tiJiaoInput.text) >= this.canTuiJiaoNum)
               {
                  this.tiJiaoInput.text = this.canTuiJiaoNum.toString();
               }
               else
               {
                  this.tiJiaoInput.text = (int(this.tiJiaoInput.text) + 1).toString();
               }
               break;
            case this.tijiaoBtn:
               dispatchEvent(new BaseEvent(UI_ZHONGQIUJIE_TIJIAO,"",int(this.tiJiaoInput.text)));
         }
      }
      
      public function setPaihang(param1:int, param2:int, param3:Array, param4:Boolean, param5:int) : void
      {
         if(!this.paihang)
         {
            this.paihang = new ZhongQiuJieRankPanel();
            this.paihang.$parent = this;
         }
         this.paihang.x = 587;
         this.paihang.y = -30 - 2;
         this.paihang.dragAble = false;
         addChild(this.paihang);
         this.paihang.updateRank(param1,param2,param3,param4,param5);
      }
   }
}

