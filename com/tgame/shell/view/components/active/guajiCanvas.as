package com.tgame.shell.view.components.active
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.GiftPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.*;
   
   public class guajiCanvas extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var addLabel:FTextArea;
      
      private var noLabel:FTextArea;
      
      public var _parent:DisplayObject;
      
      public var _parent2:DisplayObject;
      
      private var listContainer:Sprite;
      
      private var textContainer:Sprite;
      
      private var giftList:FList;
      
      public function guajiCanvas()
      {
         var bg:DisplayObject;
         var fc:FCanvas = null;
         super();
         fc = new FCanvas();
         fc.skin = "canvas1";
         fc.x = 0;
         fc.y = 0;
         fc.width = 300 + 14;
         fc.height = 190 + 33;
         addChild(fc);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/richang/guajixiaojiemian.swf");
         bg.x = 9;
         bg.y = 12;
         addChild(bg);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 0;
            y = 0;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,300,190);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new GuajiList();
         this.giftList.listWidth = 292;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 12;
         this.giftList.y = 13;
         this.textContainer = new Sprite();
         this.listContainer.addChild(this.textContainer);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(ActiveFubenPKCanvas.UI_GUAJI_GUANBI_CLICK));
      }
      
      private function onTextLink(param1:TextEvent) : void
      {
         this._parent2.dispatchEvent(new BaseEvent(GiftPanel.UI_XINZENGGUAJILAN_BTN_CLICK));
      }
      
      public function setGuajiPanel(param1:int, param2:int, param3:Array) : void
      {
         this.giftList.dataProvider = param3;
         this.addGuajilanNum(param1,param2);
      }
      
      public function addGuajilanNum(param1:int, param2:int) : void
      {
         var j:int;
         var kaiqiNum:int = param1;
         var goodsNum:int = param2;
         while(this.textContainer.numChildren > 0)
         {
            this.textContainer.removeChildAt(0);
         }
         this.addLabel = new FTextArea();
         with(this.addLabel)
         {
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\'event:\'>" + LanResManager.getLanCommonTextWords("点击新增队列，消耗") + goodsNum + LanResManager.getLanCommonTextWords("个高级扩展符") + "</a></font>";
         }
         this.textContainer.addChild(this.addLabel);
         this.addLabel.addEventListener(TextEvent.LINK,this.onTextLink);
         if(kaiqiNum >= 5)
         {
            this.addLabel.visible = false;
         }
         else
         {
            this.addLabel.visible = true;
            this.addLabel.x = 70 - 40;
            this.addLabel.y = 40 * kaiqiNum + 22;
         }
         j = 4;
         while(j > kaiqiNum)
         {
            this.noLabel = new FTextArea();
            with(this.noLabel)
            {
               
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.WHITE;
               filters = StaticValue.filter;
               htmlText = LanResManager.getLanCommonTextWords("未开启");
            }
            this.noLabel.x = 145;
            this.noLabel.y = 40 * j + 22;
            this.textContainer.addChild(this.noLabel);
            j--;
         }
      }
   }
}

