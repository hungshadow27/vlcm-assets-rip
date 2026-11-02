package com.tgame.shell.view.components.active
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.ActivePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ActiverInstanceCanvas extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var check1:FCheckBox;
      
      private var subBtn:SecondButton;
      
      private var listContainer:Sprite;
      
      private var Scroll:FVScorllBar;
      
      private var giftList:FList;
      
      private var particularFt:FTextArea;
      
      public var bgImg:Bitmap;
      
      public function ActiverInstanceCanvas()
      {
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.activer.instance.ui";
         addChild(this.bgImg);
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 437;
            height = 35;
            x = 30;
            y = 6;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,"活动安排") + "</font>";
         }
         addChild(this.ft);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 5;
            y = 26;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,457,182);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new ActiverInstanceListRender();
         this.giftList.listWidth = 457;
         this.giftList.listHeight = 23;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,182);
         addChild(this.Scroll);
         this.Scroll.x = 465;
         this.Scroll.y = 27;
         this.particularFt = new FTextArea();
         with(this.particularFt)
         {
            width = 437;
            height = 65;
            x = 12;
            y = 220;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.particularFt);
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 3;
         this.check1.y = 294;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 137;
            height = 25;
            x = 24;
            y = 296;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"只显示我可以参与的活动") + "</font>";
         }
         addChild(this.ft);
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(this.giftList.selectItem == null)
         {
            return;
         }
         this.particularFt.htmlText = "<textformat leading=\'8\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + this.giftList.selectItem.particular + "</font>" + "</textformat>";
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.check1:
               this._parent.dispatchEvent(new BaseEvent(ActivePanel.UI_ACTIVERINSTANCE_CHECK_CLICK,"",this.check1.selectState ? true : false));
         }
      }
      
      public function SetInitialize(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
         this.particularFt.htmlText = "";
         this.Scroll.update();
      }
   }
}

