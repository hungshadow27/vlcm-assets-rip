package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class QianchuiBailianYouhaoduPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var barBar:ColorBar;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var jinBtn:FSimpleButton;
      
      private var LingjiangBtn:SecondButton;
      
      private var partyIco1:Bitmap;
      
      private var partyIco2:Bitmap;
      
      private var partyIco3:Bitmap;
      
      private var partyIco4:Bitmap;
      
      private var partyIco5:Bitmap;
      
      private var partyIco6:Bitmap;
      
      private var partyIco7:Bitmap;
      
      private var partyIco8:Bitmap;
      
      private var partyIco9:Bitmap;
      
      private var fc:FCanvas;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var spr1:Sprite;
      
      private var spr2:Sprite;
      
      private var spr3:Sprite;
      
      private var spr4:Sprite;
      
      private var spr5:Sprite;
      
      public function QianchuiBailianYouhaoduPanel()
      {
         var fta:FTextArea;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 392;
         height = 363;
         titleText = LanResManager.getLanCommonTextWords("历练兑换");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         fta = new FTextArea();
         with(fta)
         {
            width = 150;
            height = 50;
            x = 20;
            y = 15;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'16\'>" + "<font color=\'#fbf992\'>" + "    【" + LanResManager.getLanCommonTextWords("蓝品锻造锤") + "】" + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每颗增加历练值") + "：1" + "</font>" + "</textformat>";
         }
         addChild(fta);
         this.partyIco1 = new Bitmap(new BitmapData(35,35,true,0));
         this.partyIco1.x = 10;
         this.partyIco1.y = 0;
         addChild(this.partyIco1);
         this.partyIco1.bitmapData = StaticValue.getBitmapByClassName("ui.qianchuibailian.chuizi.1").bitmapData;
         fta = new FTextArea();
         with(fta)
         {
            width = 150;
            height = 50;
            x = 143;
            y = 15;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'16\'>" + "<font color=\'#fbf992\'>" + "    【" + LanResManager.getLanCommonTextWords("绿品锻造锤") + "】" + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每颗增加历练值") + "：2" + "</font>" + "</textformat>";
         }
         addChild(fta);
         this.partyIco2 = new Bitmap(new BitmapData(35,35,true,0));
         this.partyIco2.x = 133;
         this.partyIco2.y = 0;
         addChild(this.partyIco2);
         this.partyIco2.bitmapData = StaticValue.getBitmapByClassName("ui.qianchuibailian.chuizi.2").bitmapData;
         fta = new FTextArea();
         with(fta)
         {
            width = 150;
            height = 50;
            x = 268;
            y = 15;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'16\'>" + "<font color=\'#fbf992\'>" + "    【" + LanResManager.getLanCommonTextWords("紫品神锻锤") + "】" + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每颗增加历练值") + "：3" + "</font>" + "</textformat>";
         }
         addChild(fta);
         this.partyIco3 = new Bitmap(new BitmapData(35,35,true,0));
         this.partyIco3.x = 258;
         this.partyIco3.y = 0;
         addChild(this.partyIco3);
         this.partyIco3.bitmapData = StaticValue.getBitmapByClassName("ui.qianchuibailian.chuizi.3").bitmapData;
         this.fc = new FCanvas();
         this.fc.skin = "box";
         this.fc.x = 10;
         this.fc.y = 60;
         this.fc.width = 373;
         this.fc.height = 190;
         addChild(this.fc);
         fta = new FTextArea();
         with(fta)
         {
            width = 300;
            x = 16;
            y = 65;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'8\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当锻造历练值达到对应数值时，您将可以获得对应的金榛子") + "：" + "</font><br>" + "<font color=\'#fbf992\'>" + "      " + LanResManager.getLanCommonTextWords("锻造历练值") + "\t                       " + LanResManager.getLanCommonTextWords("对应奖励") + "\t" + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "100   " + LanResManager.getLanCommonTextWords("经验金榛子") + "     " + LanResManager.getLanCommonTextWords("内含16颗修为丹，其中八颗为：神武修为丹") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "300   " + LanResManager.getLanCommonTextWords("真气金榛子") + "     " + LanResManager.getLanCommonTextWords("内含16颗真气丹，其中八颗为：神武真气丹") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "600   " + LanResManager.getLanCommonTextWords("秘籍金榛子") + "     " + LanResManager.getLanCommonTextWords("内含16本完整秘籍，所有极品秘籍均可出现") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "1000  " + LanResManager
            .getLanCommonTextWords("宝石金榛子") + "     " + LanResManager.getLanCommonTextWords("内含16颗宝石，所有品级宝石均会出现多颗") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "1500  " + LanResManager.getLanCommonTextWords("满星金榛子") + "     " + LanResManager.getLanCommonTextWords("内含16件满星装备，其中至少4件满星武器") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当历练值达到1500时，可以领取总计：五颗不同的金榛子") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("注意：历练值将在每晚24点固定清零，重新计数，请及时领走奖励") + "</font>" + "</textformat>";
         }
         addChild(fta);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            width = 300;
            height = 50;
            x = 16;
            y = 255;
            filters = StaticValue.filter;
            textColor = 16513426;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'fbf992\'>" + LanResManager.getLanCommonTextWords("当前历练值") + "：       XX/1500" + "</font><br>" + "</textformat>";
         }
         addChild(this.ft1);
         this.partyIco5 = new Bitmap(new BitmapData(35,35,true,0));
         this.partyIco5.x = 75;
         this.partyIco5.y = 275;
         addChild(this.partyIco5);
         this.partyIco5.bitmapData = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg").bitmapData;
         this.partyIco5.width = 220;
         this.barBar = new ColorBar(5,205,5,false);
         addChild(this.barBar);
         this.barBar.x = 82;
         this.barBar.y = 278;
         this.spr1 = new Sprite();
         this.spr1.x = 89;
         this.spr1.y = 270;
         addChild(this.spr1);
         this.partyIco4 = new Bitmap(new BitmapData(35,35,true,0));
         this.partyIco4.x = 0;
         this.partyIco4.y = 0;
         this.spr1.addChild(this.partyIco4);
         this.partyIco4.bitmapData = StaticValue.getBitmapByClassName("ui.squirrel.pinecone.gold").bitmapData;
         this.spr1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.spr1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.spr1.addEventListener(MouseEvent.CLICK,this.onMouseTip1);
         this.spr2 = new Sprite();
         this.spr2.x = 108;
         this.spr2.y = 270;
         addChild(this.spr2);
         this.partyIco6 = new Bitmap(new BitmapData(35,35,true,0));
         this.partyIco6.x = 0;
         this.partyIco6.y = 0;
         this.spr2.addChild(this.partyIco6);
         this.partyIco6.bitmapData = StaticValue.getBitmapByClassName("ui.squirrel.pinecone.gold").bitmapData;
         this.spr2.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip2);
         this.spr2.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip2);
         this.spr2.addEventListener(MouseEvent.CLICK,this.onMouseTip2);
         this.spr3 = new Sprite();
         this.spr3.x = 150;
         this.spr3.y = 270;
         addChild(this.spr3);
         this.partyIco7 = new Bitmap(new BitmapData(35,35,true,0));
         this.partyIco7.x = 0;
         this.partyIco7.y = 0;
         this.spr3.addChild(this.partyIco7);
         this.partyIco7.bitmapData = StaticValue.getBitmapByClassName("ui.squirrel.pinecone.gold").bitmapData;
         this.spr3.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.spr3.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         this.spr3.addEventListener(MouseEvent.CLICK,this.onMouseTip3);
         this.spr4 = new Sprite();
         this.spr4.x = 209;
         this.spr4.y = 270;
         addChild(this.spr4);
         this.partyIco8 = new Bitmap(new BitmapData(35,35,true,0));
         this.spr4.addChild(this.partyIco8);
         this.partyIco8.bitmapData = StaticValue.getBitmapByClassName("ui.squirrel.pinecone.gold").bitmapData;
         this.spr4.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip4);
         this.spr4.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip4);
         this.spr4.addEventListener(MouseEvent.CLICK,this.onMouseTip4);
         this.spr5 = new Sprite();
         this.spr5.x = 277;
         this.spr5.y = 270;
         addChild(this.spr5);
         this.partyIco9 = new Bitmap(new BitmapData(35,35,true,0));
         this.spr5.addChild(this.partyIco9);
         this.partyIco9.bitmapData = StaticValue.getBitmapByClassName("ui.squirrel.pinecone.gold").bitmapData;
         this.spr5.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip5);
         this.spr5.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip5);
         this.spr5.addEventListener(MouseEvent.CLICK,this.onMouseTip5);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            width = 300;
            height = 50;
            x = 16;
            y = 295;
            filters = StaticValue.filter;
            textColor = 16513426;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'#fbf992\'>" + LanResManager.getLanCommonTextWords("可领数量") + "：     XX    XX    XX    XX    XX" + "</font><br>" + "</textformat>";
         }
         addChild(this.ft2);
         this.LingjiangBtn = new SecondButton();
         this.LingjiangBtn.label = LanResManager.getLanCommonTextWords("领取金榛子");
         addChild(this.LingjiangBtn);
         this.LingjiangBtn.x = 300;
         this.LingjiangBtn.y = 290;
         this.LingjiangBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.spr1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("经验金榛子") + "】" + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"与寻宝鼠的友好度",[100]) + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("内含16颗修为丹，其中八颗为：神武修为丹") + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("双击金榛子可以打开兑奖界面") + "】" + "</font><br>" + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.spr1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function onMouseTip2(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.spr2.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("真气金榛子") + "】" + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"与寻宝鼠的友好度",[300]) + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("内含16颗真气丹，其中八颗为：神武真气丹") + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("双击金榛子可以打开兑奖界面") + "】" + "</font><br>" + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.spr2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
         }
      }
      
      private function onMouseTip3(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.spr3.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("秘籍金榛子") + "】" + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"与寻宝鼠的友好度",[600]) + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("内含16本完整秘籍，所有极品秘籍均可出现") + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("双击金榛子可以打开兑奖界面") + "】" + "</font><br>" + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.spr3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
         }
      }
      
      private function onMouseTip4(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.spr4.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("宝石金榛子") + "】" + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"与寻宝鼠的友好度",[1000]) + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("内含16颗宝石，所有品级宝石均会出现多颗") + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("双击金榛子可以打开兑奖界面") + "】" + "</font><br>" + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.spr4.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
         }
      }
      
      private function onMouseTip5(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.spr5.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("10星紫装金榛子") + "】" + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"与寻宝鼠的友好度",[1500]) + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("内含16件10星紫装，其中至少4件10星紫武器") + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + "【" + LanResManager.getLanCommonTextWords("双击金榛子可以打开兑奖界面") + "】" + "</font><br>" + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.spr5.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.LingjiangBtn:
               this.$parent.dispatchEvent(new BaseEvent(QianchuiBailianPanel.UI_QIANCHUIBAILIAN_LINGQU_ZHENZI_CLICK));
         }
      }
      
      public function setFriendVilue(param1:Array) : void
      {
         this.ft1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前友好度") + "：       " + param1[0] + "/1500" + "</font><br>" + "</textformat>";
         this.barBar.setValue(param1[0] % 1501,1500);
         this.ft2.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("可领数量") + "     " + param1[1] + "  " + param1[2] + "      " + param1[3] + "         " + param1[4] + "          " + param1[5] + "" + "</font><br>" + "</textformat>";
      }
   }
}

