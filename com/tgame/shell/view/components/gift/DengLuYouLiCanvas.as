package com.tgame.shell.view.components.gift
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.gift.itemrender.DengLuYouLiGiftListRender;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.*;
   
   public class DengLuYouLiCanvas extends FCanvas
   {
      
      private var _parent:DisplayObject;
      
      private var container:Sprite;
      
      private var scroll:FVScorllBar;
      
      private var giftContainer:FCanvas;
      
      private var giftList:FList;
      
      private var countLabel:FTextArea;
      
      public function DengLuYouLiCanvas()
      {
         var lb:FLabel;
         var ft:FTextArea = null;
         var line:Bitmap = null;
         super();
         skin = "box";
         width = 450;
         height = 307;
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 2;
         this.container.y = 2;
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,430,303);
            endFill();
         }
         this.scroll = new FVScorllBar(this.container,303);
         addChild(this.scroll);
         this.scroll.x = 432;
         this.scroll.y = 2;
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 10;
            wordWrap = true;
            width = 420;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,0) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanTextWords(this,3) + "</font><br>" + "</textformat>";
         }
         this.container.addChild(ft);
         line = StaticValue.getBitmapByClassName("ui.line");
         this.container.addChild(line);
         line.width = 430;
         line.y = ft.y + ft.height + 10;
         this.countLabel = new FTextArea();
         with(this.countLabel)
         {
            x = 10;
            y = line.y + 12;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         this.container.addChild(this.countLabel);
         this.giftContainer = new FCanvas();
         this.giftContainer.skin = "box";
         this.container.addChild(this.giftContainer);
         this.giftContainer.x = 0;
         this.giftContainer.y = this.countLabel.y + this.countLabel.height + 10;
         this.giftContainer.width = 430;
         line = StaticValue.getBitmapByClassName("ui.line");
         this.giftContainer.addChild(line);
         line.width = 426;
         line.x = 2;
         line.y = 23;
         lb = new FLabel();
         with(lb)
         {
            x = 8;
            y = 3;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,4);
         }
         this.giftContainer.addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 185;
            y = 3;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,5);
         }
         this.giftContainer.addChild(lb);
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new DengLuYouLiGiftListRender();
         this.giftList.listWidth = 426;
         this.giftContainer.addChild(this.giftList);
         this.giftList.x = 2;
         this.giftList.y = 25;
         this.resize();
      }
      
      private function resize() : void
      {
         this.giftContainer.height = this.giftList.height + 25;
         this.scroll.update();
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         DengLuYouLiGiftListRender.$parent = param1;
      }
      
      public function setPrize(param1:int, param2:Array) : void
      {
         this.giftList.dataProvider = param2;
         this.countLabel.htmlText = "<textformat leading=\'3\'>" + LanResManager.getLanTextWords(this,6,[param1]) + "</textformat>";
         this.resize();
      }
   }
}

