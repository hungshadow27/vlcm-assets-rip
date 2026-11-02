package com.tgame.shell.view.components.ride
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.RideFeedPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class NiePanTupoCanvas extends Sprite
   {
      
      public var _parent3:DisplayObject;
      
      public var _parent2:DisplayObject;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var img:Bitmap;
      
      private var daojuming:FTextArea;
      
      private var lingwuyaoqiu:FTextArea;
      
      private var buyBtn:SecondButton;
      
      private var kslwBtn:SecondButton;
      
      public var zdlwBtn:SecondButton;
      
      private var goodsId:int;
      
      private var item:ItemFace;
      
      public function NiePanTupoCanvas()
      {
         var _loc1_:FCanvas = null;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 300;
         this.bgCanvas.height = 100;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         _loc1_ = new FCanvas();
         _loc1_.skin = "canvas1";
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 300;
         _loc1_.height = 100;
         addChild(_loc1_);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.daojuming = new FTextArea();
         addChild(this.daojuming);
         this.daojuming.multiline = true;
         this.daojuming.autoSize = TextFieldAutoSize.LEFT;
         this.daojuming.wordWrap = true;
         this.daojuming.width = 220;
         this.daojuming.height = 120;
         this.daojuming.x = 20;
         this.daojuming.y = 10;
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 25;
         this.img.y = 30;
         this.lingwuyaoqiu = new FTextArea();
         addChild(this.lingwuyaoqiu);
         this.lingwuyaoqiu.multiline = true;
         this.lingwuyaoqiu.autoSize = TextFieldAutoSize.LEFT;
         this.lingwuyaoqiu.wordWrap = true;
         this.lingwuyaoqiu.width = 220;
         this.lingwuyaoqiu.height = 120;
         this.lingwuyaoqiu.x = 25 + 75;
         this.lingwuyaoqiu.y = 30;
         this.lingwuyaoqiu.textColor = StaticValue.BlUE20;
         this.lingwuyaoqiu.htmlText = "";
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 23;
         this.buyBtn.y = 70;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 45 + 50;
         this.kslwBtn.y = 70;
         this.kslwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 155 + 30;
         this.zdlwBtn.y = 70;
         this.zdlwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kslwBtn:
               this._parent2.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_NIEPAN_KAISHINIEPAN));
               break;
            case this.zdlwBtn:
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this._parent2.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_NIEPAN_ZHIDONGNIEPAN,"",true));
               }
               else
               {
                  this._parent2.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_NIEPAN_ZHIDONGNIEPAN,"",false));
               }
               break;
            case this.buyBtn:
               this._parent2.dispatchEvent(new BaseEvent(RideFeedPanel.UI_RIDE_FEED_NIEPAN_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this._parent3.dispatchEvent(new BaseEvent(NiePanCanvas.UI_NIEPANTUPO_CLOSE_CLICK));
      }
      
      public function setGoods(param1:Goods, param2:Boolean, param3:int) : void
      {
         var _loc4_:String = null;
         this.goodsId = param1.id;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 25 + 2;
         this.item.y = 30 + 2;
         addChild(this.item);
         if(!param2)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.item.filters = [];
         }
         this.daojuming.htmlText = "<font  color =\'" + StaticValue.ORANGE_HTML + "\'>" + param1.res.name + "</font>";
         if(param2)
         {
            _loc4_ = LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1.res.name + " X " + param3 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         else
         {
            _loc4_ = LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1.res.name + " X " + param3 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         _loc4_ += "</textformat>";
         this.lingwuyaoqiu.htmlText = _loc4_;
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         }
         else
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("停止领悟");
         }
      }
   }
}

