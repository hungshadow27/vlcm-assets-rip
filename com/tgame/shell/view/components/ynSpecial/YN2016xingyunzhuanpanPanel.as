package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import gs.TweenLite;
   import gs.easing.Quad;
   
   public class YN2016xingyunzhuanpanPanel extends FPanel
   {
      
      public static const YN_QUANMINGCHOUJIANG_LIANGQU:String = "YN_QUANMINGCHOUJIANG_LIANGQU";
      
      public static const YN_QUANMINGCHOUJIANG_KAISHI:String = "YN_QUANMINGCHOUJIANG_KAISHI";
      
      public static const YN_XINGYUNZHUANPAN_DUIHUANWUPIN:String = "YN_XINGYUNZHUANPAN_DUIHUANWUPIN";
      
      public static const YN_XINGYUNZHUANPAN_KAIJIANGJILU:String = "YN_XINGYUNZHUANPAN_KAIJIANGJILU";
      
      private var goodsArr:Array;
      
      private var goodsContainer:Sprite;
      
      private var btnKaiShi:NewSkinButton;
      
      private var btnLingQu:NewSkinButton;
      
      private var lineSpr:Sprite;
      
      private var ft:FTextArea;
      
      private var ftBaojin:FTextArea;
      
      private var ftTime:FTextArea;
      
      private var ftJileizhi:FTextArea;
      
      private var listSpr:Sprite;
      
      private var fList:FList;
      
      private var listscroll:FVScorllBar;
      
      private var tabSpr:Sprite;
      
      private var tab:FTabBar;
      
      private var ftBX:FTextArea;
      
      private var ftGR:FTextArea;
      
      private var sprBX:Sprite;
      
      private var sprGR:Sprite;
      
      private var tabscroll1:FVScorllBar;
      
      private var tabscroll2:FVScorllBar;
      
      private var head:Sprite;
      
      private var head1:Sprite;
      
      private var tx:int = -1;
      
      private var curIndex:int = 0;
      
      public function YN2016xingyunzhuanpanPanel()
      {
         super();
         width = 660;
         height = 377 + 43;
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - 900,Tools.currentStage.stageHeight - 450));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      private function init() : void
      {
         var bg1:DisplayObject;
         var yb:DisplayObject;
         var line:DisplayObject;
         var ar:Array;
         var i:int;
         var bg2:DisplayObject = null;
         var o:Object = null;
         bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2016xingyunzhuanpan/bg.swf");
         bg2.x = 10;
         bg2.y = 0;
         addChild(bg2);
         bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2016xingyunzhuanpan/bg_yuan.swf");
         bg1.x = 10 - 222;
         bg1.y = 0 - 92;
         addChild(bg1);
         yb = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2016xingyunzhuanpan/yb.swf");
         yb.x = 460 - 222;
         yb.y = 95 - 92;
         addChild(yb);
         this.btnKaiShi = new NewSkinButton();
         this.btnKaiShi.skin = "ynXYZP_CJ_Button";
         this.btnKaiShi.x = 268 - 85 - 222;
         this.btnKaiShi.y = 261 - 50 - 92;
         addChild(this.btnKaiShi);
         this.btnKaiShi.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnLingQu = new NewSkinButton();
         this.btnLingQu.skin = "ynXYZP_LQ_Button";
         this.btnLingQu.x = 268 - 85 - 222;
         this.btnLingQu.y = 261 - 50 - 92;
         addChild(this.btnLingQu);
         this.btnLingQu.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.goodsContainer = new Sprite();
         addChild(this.goodsContainer);
         this.lineSpr = new Sprite();
         addChild(this.lineSpr);
         this.lineSpr.x = 200 + 120 - 75 - 15 - 222;
         this.lineSpr.y = 140 + 110 + 50 - 30 - 92;
         line = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/2016xingyunzhuanpan/jiantou.swf");
         line.x = -100 + 75 + 15;
         line.y = 0 - 110 - 50 + 30;
         this.lineSpr.addChild(line);
         this.ftBaojin = new FTextArea();
         this.ftBaojin.x = 565 - 222;
         this.ftBaojin.y = 110 - 92;
         this.ftBaojin.htmlText = "目前拥有宝金：";
         this.ftBaojin.width = 270;
         this.ftBaojin.height = 20;
         addChild(this.ftBaojin);
         this.ftTime = new FTextArea();
         this.ftTime.x = 460 - 222;
         this.ftTime.y = 135 - 92;
         this.ftTime.htmlText = "活动剩余时间：";
         this.ftTime.width = 350;
         this.ftTime.height = 20;
         addChild(this.ftTime);
         this.ft = new FTextArea();
         this.ft.x = 460 - 222;
         this.ft.y = 155 - 92;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("每一次抽奖，玩家收到50宝金，另外玩家有机会抽到：10%宝金或25%宝金或50%宝金。");
         this.ft.width = 375;
         this.ft.height = 40;
         this.ft.wordWrap = true;
         this.ft.multiline = true;
         addChild(this.ft);
         this.ftJileizhi = new FTextArea();
         this.ftJileizhi.x = 460 + 20 - 222;
         this.ftJileizhi.y = 198 - 92;
         this.ftJileizhi.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>积累值：</font>XXX";
         this.ftJileizhi.width = 375;
         this.ftJileizhi.height = 20;
         addChild(this.ftJileizhi);
         this.listSpr = new Sprite();
         addChild(this.listSpr);
         with(this.listSpr)
         {
            x = 462 - 222;
            y = 160 + 60 - 92;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,168,200);
            graphics.endFill();
         }
         this.fList = new FList();
         this.fList.skin = "list";
         this.fList.itemRenderer = new YN2016xingyunzhuanpanRenderer();
         this.fList.listWidth = 168;
         this.listSpr.addChild(this.fList);
         this.fList.mouseEnabled = false;
         this.fList.x = 0;
         this.fList.y = 0;
         this.listscroll = new FVScorllBar(this.listSpr,126);
         this.listscroll.x = 417;
         this.listscroll.y = 131;
         this.tabSpr = new Sprite();
         addChild(this.tabSpr);
         this.tab = new FTabBar();
         this.tab.addButton(LanResManager.getLanCommonTextWords("宝箱记录"),this.onTab);
         this.tab.addButton(LanResManager.getLanCommonTextWords("个人记录"),this.onTab);
         this.tab.x = 645 + 15 - 222;
         this.tab.y = 195 - 92;
         this.tabSpr.addChild(this.tab);
         this.sprBX = new Sprite();
         with(this.sprBX)
         {
            x = 655 - 222;
            y = 220 - 92;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,185,125);
            graphics.endFill();
         }
         addChild(this.sprBX);
         this.sprGR = new Sprite();
         with(this.sprGR)
         {
            x = 655 - 222;
            y = 220 - 92;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,185,125);
            graphics.endFill();
         }
         this.sprGR.visible = false;
         addChild(this.sprGR);
         this.ftBX = new FTextArea();
         this.ftBX.x = 5;
         this.ftBX.y = 5;
         this.ftBX.width = 190;
         this.ftBX.multiline = true;
         this.ftBX.wordWrap = true;
         this.sprBX.addChild(this.ftBX);
         this.ftGR = new FTextArea();
         this.ftGR.x = 5;
         this.ftGR.y = 5;
         this.ftGR.width = 190;
         this.ftGR.multiline = true;
         this.ftGR.wordWrap = true;
         this.sprGR.addChild(this.ftGR);
         this.tabscroll1 = new FVScorllBar(this.sprBX,126);
         this.tabscroll1.x = 190 + 655 + 4 - 222;
         this.tabscroll1.y = 131;
         addChild(this.tabscroll1);
         this.tabscroll2 = new FVScorllBar(this.sprGR,126);
         this.tabscroll2.x = 190 + 655 + 4 - 222;
         this.tabscroll2.y = 131;
         addChild(this.tabscroll2);
         this.ft = new FTextArea();
         this.ft.x = 460 - 222;
         this.ft.y = 355 - 92;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("备注：") + "</font><br>" + LanResManager.getLanCommonTextWords("1.每一次兑换积累值，只能兑换唯一") + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1次") + "</font><br>" + LanResManager.getLanCommonTextWords("2.只能使用元宝参加抽奖活动") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("（不能使用金票）") + "</font><br>" + LanResManager.getLanCommonTextWords("3.每一次抽奖消耗：") + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("100元宝/次") + "</font><br>" + LanResManager.getLanCommonTextWords("4.每一次抽奖获得：") + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1积累值") + "</font><br>" + LanResManager.getLanCommonTextWords("5.每一次抽奖获得：") + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("50宝金") + "</font></textformat>";
         this.ft.width = 375;
         this.ft.height = 120;
         this.ft.wordWrap = true;
         this.ft.multiline = true;
         addChild(this.ft);
         ar = [];
         i = 0;
         while(i < 17)
         {
            o = new Object();
            o.goodsID = 1001 + i;
            o.goodsIndex = i + 1;
            o.jileizhi = 100 * (i + 1);
            ar.push(o);
            i++;
         }
         this.setGoods(ar);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onTab(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("宝箱记录"):
               dispatchEvent(new BaseEvent(YN_XINGYUNZHUANPAN_KAIJIANGJILU,"",1));
               break;
            case LanResManager.getLanCommonTextWords("个人记录"):
               dispatchEvent(new BaseEvent(YN_XINGYUNZHUANPAN_KAIJIANGJILU,"",2));
         }
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.btnKaiShi:
               this.tx = 1;
               dispatchEvent(new BaseEvent(YN_QUANMINGCHOUJIANG_KAISHI));
               break;
            case this.btnLingQu:
               dispatchEvent(new BaseEvent(YN_QUANMINGCHOUJIANG_LIANGQU));
         }
      }
      
      public function setJilu(param1:String, param2:int = 1) : void
      {
         var _loc3_:Array = param1.split("<");
         this.ftBX.height = this.ftGR.height = 18 * int(_loc3_.length);
         if(param2 == 1)
         {
            this.ftBX.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
            this.tab.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("宝箱记录"));
            this.sprBX.visible = true;
            this.sprGR.visible = false;
            this.tabscroll1.update(true);
         }
         else
         {
            this.ftGR.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
            this.tab.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("个人记录"));
            this.sprBX.visible = false;
            this.sprGR.visible = true;
            this.tabscroll2.update(true);
         }
      }
      
      public function setQuanMingChouJiangData(param1:int = 0, param2:Array = null, param3:Boolean = false, param4:int = 0, param5:Array = null, param6:int = 0, param7:int = 0, param8:String = "", param9:String = "", param10:int = 0) : void
      {
         var _loc11_:int = 0;
         var _loc12_:ItemFace = null;
         YN2016xingyunzhuanpanRenderer.$parent = this;
         this.fList.dataProvider = param5;
         this.ftBaojin.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("目前拥有宝金：") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.setGoods(param2);
         this.setJilu(param8,1);
         this.ftJileizhi.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前积累值：") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + param6 + "</font>";
         this.ftTime.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动剩余时间：") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + Math.floor(param7 / (3600 * 24)) + LanResManager.getLanCommonTextWords("天") + Math.floor(param7 / 3600) + LanResManager.getLanCommonTextWords("时") + Math.floor(param7 % 3600 / 60) + LanResManager.getLanCommonTextWords("分") + "</font>";
         if(param3)
         {
            this.btnKaiShi.visible = false;
            this.btnLingQu.visible = true;
            this.curIndex = param4;
            if(param10 == 1)
            {
               _loc11_ = 15;
               if(this.curIndex > 9)
               {
                  _loc11_ = 5;
               }
               this.lineSpr.rotation = this.curIndex * 22 - (_loc11_ + this.curIndex);
               _loc12_ = this.goodsContainer.getChildByName("" + param4) as ItemFace;
               _loc12_.showGiftSelect(true);
               this.btnKaiShi.enabled = false;
               this.btnLingQu.enabled = true;
            }
         }
         else
         {
            this.btnKaiShi.visible = true;
            this.btnLingQu.visible = false;
            this.lineSpr.rotation = 0;
            this.btnKaiShi.enabled = true;
            this.btnLingQu.enabled = false;
         }
      }
      
      public function setTurn(param1:int = 0, param2:int = 5, param3:int = 1440) : void
      {
         var _loc5_:ItemFace = null;
         this.btnKaiShi.enabled = false;
         this.btnLingQu.enabled = false;
         this.lineSpr.rotation = 0;
         if(this.curIndex)
         {
            _loc5_ = this.goodsContainer.getChildByName("" + this.curIndex) as ItemFace;
            _loc5_.showGiftSelect(false);
         }
         this.curIndex = param1;
         var _loc4_:int = 15;
         if(this.curIndex > 9)
         {
            _loc4_ = 5;
         }
         TweenLite.to(this.lineSpr,param2,{
            "rotation":param3 + this.curIndex * 22 - (_loc4_ + this.curIndex),
            "onComplete":this.setStartButton,
            "ease":Quad.easeInOut
         });
      }
      
      public function setTurnData(param1:int, param2:int) : void
      {
         if(!param2)
         {
            return;
         }
         this.setTurn(param2);
      }
      
      public function setStartButton(param1:Boolean = false) : void
      {
         this.btnKaiShi.visible = false;
         this.btnLingQu.visible = true;
         this.btnLingQu.enabled = true;
         var _loc2_:ItemFace = this.goodsContainer.getChildByName("" + this.curIndex) as ItemFace;
         _loc2_.showGiftSelect(!param1);
      }
      
      public function setGoods(param1:Array) : void
      {
         var _loc3_:Bitmap = null;
         var _loc4_:ItemFace = null;
         while(this.goodsContainer.numChildren > 0)
         {
            this.goodsContainer.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc4_ = new ItemFace(new Goods(param1[_loc2_].goodsID));
            _loc4_.name = param1[_loc2_].goodsIndex + "";
            switch(param1[_loc2_].goodsIndex)
            {
               case 1:
                  _loc3_.x = 23;
                  _loc3_.y = -16;
                  break;
               case 2:
                  _loc3_.x = 82;
                  _loc3_.y = 8;
                  break;
               case 3:
                  _loc3_.x = 128;
                  _loc3_.y = 49;
                  break;
               case 4:
                  _loc3_.x = 157;
                  _loc3_.y = 106;
                  break;
               case 5:
                  _loc3_.x = 164;
                  _loc3_.y = 163;
                  break;
               case 6:
                  _loc3_.x = 146;
                  _loc3_.y = 223;
                  break;
               case 7:
                  _loc3_.x = 109;
                  _loc3_.y = 276;
                  break;
               case 8:
                  _loc3_.x = 56;
                  _loc3_.y = 313;
                  break;
               case 9:
                  _loc3_.x = -8;
                  _loc3_.y = 323;
                  break;
               case 10:
                  _loc3_.x = -67;
                  _loc3_.y = 312;
                  break;
               case 11:
                  _loc3_.x = -124;
                  _loc3_.y = 277;
                  break;
               case 12:
                  _loc3_.x = -161;
                  _loc3_.y = 223;
                  break;
               case 13:
                  _loc3_.x = -173;
                  _loc3_.y = 163;
                  break;
               case 14:
                  _loc3_.x = -168;
                  _loc3_.y = 105;
                  break;
               case 15:
                  _loc3_.x = -138;
                  _loc3_.y = 53;
                  break;
               case 16:
                  _loc3_.x = -93;
                  _loc3_.y = 10;
                  break;
               case 17:
                  _loc3_.x = -36;
                  _loc3_.y = -14;
            }
            this.goodsContainer.addChild(_loc3_);
            _loc4_.x = _loc3_.x + 2;
            _loc4_.y = _loc3_.y + 2;
            this.goodsContainer.addChild(_loc4_);
            _loc2_++;
         }
      }
   }
}

