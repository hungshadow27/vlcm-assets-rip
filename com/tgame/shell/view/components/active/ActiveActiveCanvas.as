package com.tgame.shell.view.components.active
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.GiftPanel;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.*;
   
   public class ActiveActiveCanvas extends Sprite
   {
      
      public static const UI_ACTIVEACTIVE_SEARCH_CLICK:String = "UI_ACTIVEACTIVE_SEARCH_CLICK";
      
      public static const ITEM_LINK_CLICK:String = "ITEM_LINK_CLICK";
      
      public var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var check1:FCheckBox;
      
      private var subBtn:SecondButton;
      
      private var listContainer:Sprite;
      
      private var listContainer2:Sprite;
      
      private var Scroll:FVScorllBar;
      
      private var Scroll2:FVScorllBar;
      
      private var giftList:FList;
      
      private var particularFt:FTextArea;
      
      public var bgImg:Bitmap;
      
      private var selectGrade:FLabel;
      
      private var selectBtn:FSimpleButton;
      
      private var selectList:FList;
      
      private var listContainer3:FCanvas;
      
      public function ActiveActiveCanvas()
      {
         var img9:F9GridBitmap = null;
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.huodong.huodong.ui";
         addChild(this.bgImg);
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 590;
            height = 35;
            x = 25;
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
            graphics.drawRect(0,0,562,232);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new ActiveActiveListRender();
         this.giftList.listWidth = 562;
         this.giftList.listHeight = 23;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.Scroll = new FVScorllBar(this.listContainer,232);
         addChild(this.Scroll);
         this.Scroll.x = 570;
         this.Scroll.y = 27;
         this.listContainer2 = new Sprite();
         addChild(this.listContainer2);
         with(this.listContainer2)
         {
            x = 5;
            y = 265;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,560,70);
            graphics.endFill();
         }
         this.particularFt = new FTextArea();
         with(this.particularFt)
         {
            x = 0;
            y = 0;
            width = 560;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            htmlText = "";
         }
         this.particularFt.addEventListener(TextEvent.LINK,this.onLink);
         this.listContainer2.addChild(this.particularFt);
         this.Scroll2 = new FVScorllBar(this.listContainer2,75);
         addChild(this.Scroll2);
         this.Scroll2.x = 570;
         this.Scroll2.y = 265;
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 3;
         this.check1.y = 354;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         img9 = Tools.get9GridBitmpByName("inputBg");
         addChild(img9);
         img9.width = 120;
         img9.x = 460;
         img9.y = 354;
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 560;
            height = 25;
            x = 24;
            y = 354;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"活动说明",[StaticValue.WHITE_HTML,StaticValue.GREEN_HTML,StaticValue.WHITE_HTML]);
         }
         addChild(this.ft);
         this.selectGrade = new FLabel();
         with(this.selectGrade)
         {
            x = 180 + 288;
            y = 12 + 342;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"所有副本与活动");
         }
         addChild(this.selectGrade);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 272 + 288;
         this.selectBtn.y = 10 + 344;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer3 = new FCanvas();
         this.listContainer3.skin = "backGroud";
         this.listContainer3.x = 150 + 308;
         this.listContainer3.y = 28 + 344;
         addChild(this.listContainer3);
         this.listContainer3.visible = false;
         this.selectList = new FList();
         this.selectList.skin = "list";
         this.selectList.listWidth = 114;
         this.selectList.x = 5;
         this.selectList.y = 2;
         this.selectList.itemRenderer = new StrengthenListRender();
         this.selectList.dataProvider = <list>
											<node label={LanResManager.getLanTextWords(this,"所有副本与活动")} id="0"/>
											<node label={LanResManager.getLanTextWords(this,"仅显示副本")} id="1"/>
											<node label={LanResManager.getLanTextWords(this,"仅显示活动")} id="2"/>
									  </list>;
         this.listContainer3.addChild(this.selectList);
         this.selectList.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.listContainer3.width = this.selectList.width + 10;
         this.listContainer3.height = this.selectList.height + 4;
      }
      
      private function onLink(param1:TextEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(ITEM_LINK_CLICK,"",[param1.text,Tools.currentStage.mouseX,Tools.currentStage.mouseY]));
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         this.listContainer3.visible = !this.listContainer3.visible;
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         var _loc2_:BaseEvent = null;
         this.selectGrade.text = this.selectList.selectItem.label;
         this.listContainer3.visible = false;
         switch(this.selectList.selectItem.id)
         {
            case "0":
               _loc2_ = new BaseEvent(GiftPanel.UI_GIFTPANEL_ACTIVEACTIVECANVAS_SELECT,"",0);
               break;
            case "1":
               _loc2_ = new BaseEvent(GiftPanel.UI_GIFTPANEL_ACTIVEACTIVECANVAS_SELECT,"",1);
               break;
            case "2":
               _loc2_ = new BaseEvent(GiftPanel.UI_GIFTPANEL_ACTIVEACTIVECANVAS_SELECT,"",2);
         }
         this._parent.dispatchEvent(_loc2_);
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         if(this.giftList.selectItem == null)
         {
            return;
         }
         var _loc2_:String = "";
         _loc2_ += "<textformat leading=\'8\'>";
         _loc2_ += this.giftList.selectItem.particular;
         if(this.giftList.selectItem.giftItems.length > 0)
         {
            if(_loc3_ == 0)
            {
               _loc2_ += "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"通关奖励") + "</font>";
            }
            _loc3_ = 0;
            while(_loc3_ < this.giftList.selectItem.giftItems.length)
            {
               _loc2_ += "[" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "<a href=\'event:" + this.giftList.selectItem.giftItems[_loc3_][0] + "\'><u>" + this.giftList.selectItem.giftItems[_loc3_][1] + "</u></a></font>]×" + this.giftList.selectItem.giftItems[_loc3_][2] + "   ";
               _loc3_++;
            }
            _loc2_ += "</font>";
         }
         _loc2_ += "</textformat>";
         this.particularFt.htmlText = _loc2_;
         this.Scroll2.update();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.check1:
               this._parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_ACTIVEACTIVECANVAS_CLECK,"",this.check1.selectState ? true : false));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function SetInitialize(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
         this.particularFt.htmlText = "";
         this.Scroll.update();
         this.Scroll2.update();
      }
   }
}

