package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.instanceportal.FubenTongguanCanvas;
   import com.tgame.shell.view.components.instanceportal.GumuMishiChuansongListRender;
   import com.tgame.shell.view.components.instanceportal.IngressFubenTishiCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class GumuMishiChuansongPanel extends FPanel
   {
      
      public static const UI_GUMUMISHI_BTNCLICK:String = "UI_GUMUMISHI_BTNCLICK";
      
      private var tip:FTextArea;
      
      private var tip1:FTextArea;
      
      private var tip2:FTextArea;
      
      private var jlxxFta:FTextArea;
      
      private var fbsmFta:FTextArea;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var check1:FCheckBox;
      
      private var SubBtn:SecondButton;
      
      private var FubenlingBtn:SecondButton;
      
      private var ShowJsbBtn:SecondButton;
      
      private var ewjlFta:FTextArea;
      
      private var shujuArr:Array;
      
      private var IngressFuben:IngressFubenTishiCanvas;
      
      private var FubenTongguan:FubenTongguanCanvas;
      
      private var listContainerX1:Sprite;
      
      private var ScrollX1:FVScorllBar;
      
      private var giftListX1:FList;
      
      private var spr1:Sprite;
      
      private var fc1:FCanvas;
      
      private var line:Bitmap;
      
      public function GumuMishiChuansongPanel()
      {
         this.shujuArr = new Array();
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 535;
         height = 276;
         this.titleText = LanResManager.getLanCommonTextWords("古墓密室传送");
         this.fc1 = new FCanvas();
         this.fc1.x = 10;
         this.fc1.y = 2;
         this.fc1.width = 290;
         this.fc1.height = 316 - 86;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 174 + 125;
         this.fc1.y = 2;
         this.fc1.width = 400 - 43 - 130;
         this.fc1.height = 316 - 86;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.line = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.line);
         this.line.width = 20;
         this.line.height = 2;
         this.line.x = 162;
         this.line.y = 8;
         this.line.rotation = 90;
         this.line = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.line);
         this.line.width = 286;
         this.line.height = 2;
         this.line.x = 12;
         this.line.y = 28;
         this.line = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.line);
         this.line.width = 286;
         this.line.height = 2;
         this.line.x = 12;
         this.line.y = 28 + 177;
         this.line = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.line);
         this.line.width = 400 - 50 - 130;
         this.line.height = 2;
         this.line.x = 303;
         this.line.y = 28 + 24;
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 250;
            height = 20;
            x = 55;
            y = 8;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("场景名称推荐等级") + "</font>";
         }
         addChild(this.tip);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 13;
            y = 30;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,265,175);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new GumuMishiChuansongListRender();
         this.giftList.listWidth = 265;
         this.listContainer.addChild(this.giftList);
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,175);
         addChild(this.Scroll);
         this.Scroll.x = 280;
         this.Scroll.y = 30;
         this.spr1 = new Sprite();
         addChild(this.spr1);
         this.spr1.y = 206;
         this.ShowJsbBtn = new SecondButton();
         this.ShowJsbBtn.label = LanResManager.getLanCommonTextWords("进入练级");
         this.spr1.addChild(this.ShowJsbBtn);
         this.ShowJsbBtn.x = 230 - 107;
         this.ShowJsbBtn.y = 1;
         this.ShowJsbBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 120;
            height = 20;
            x = 307;
            y = 20;
            textColor = StaticValue.ORANGE;
            text = LanResManager.getLanCommonTextWords("地图规则");
         }
         addChild(this.tip);
         this.jlxxFta = new FTextArea();
         with(this.jlxxFta)
         {
            width = 100;
            height = 20;
            x = 332;
            y = 28;
            textColor = StaticValue.ORANGE;
            htmlText = "";
         }
         addChild(this.jlxxFta);
         this.listContainerX1 = new Sprite();
         addChild(this.listContainerX1);
         with(this.listContainerX1)
         {
            x = 307;
            y = 60;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,196,142);
            graphics.endFill();
         }
         this.ScrollX1 = new FVScorllBar(this.listContainerX1,142);
         addChild(this.ScrollX1);
         this.ScrollX1.x = 505;
         this.ScrollX1.y = 60;
      }
      
      private function onClose(param1:FCloseEvent) : void
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
            case this.ShowJsbBtn:
               if(this.giftList.selectItem == null)
               {
                  return;
               }
               dispatchEvent(new BaseEvent(UI_GUMUMISHI_BTNCLICK,"",this.giftList.selectItem.id));
         }
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         var fbsmFta:FTextArea;
         var e:MouseEvent = param1;
         if(this.giftList.selectItem == null)
         {
            return;
         }
         while(this.listContainerX1.numChildren > 0)
         {
            this.listContainerX1.removeChildAt(0);
         }
         fbsmFta = new FTextArea();
         with(fbsmFta)
         {
            width = 196;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'8\'>" + giftList.selectItem.say + "</textformat>";
         }
         this.listContainerX1.addChild(fbsmFta);
         this.ScrollX1.update();
      }
      
      public function setInitializePlay(param1:Array) : void
      {
         while(this.listContainerX1.numChildren > 0)
         {
            this.listContainerX1.removeChildAt(0);
         }
         this.shujuArr = param1;
         this.giftList.dataProvider = param1;
         this.Scroll.update();
      }
   }
}

