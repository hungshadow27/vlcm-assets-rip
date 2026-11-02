package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNjubaopenPanel extends FPanel
   {
      
      public static const UI_INPUTYUANBAO_CLICK:String = "UI_INPUTYUANBAO_CLICK";
      
      public static const UI_GETJINPIAO_CLICK:String = "UI_GETJINPIAO_CLICK";
      
      private var ft:FTextArea;
      
      private var btnInput:SecondButton;
      
      private var btnGet:SecondButton;
      
      private var ftDesc:FTextArea;
      
      private var ftMoney:FTextArea;
      
      private var spr:Sprite;
      
      private var top:FCanvas;
      
      private var ty:int;
      
      public function YNjubaopenPanel()
      {
         super();
         width = 380;
         height = 420;
         titleText = LanResManager.getLanCommonTextWords("聚宝盆");
         this.showCloseButton = true;
         this.dragAble = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.spr = new Sprite();
         addChild(this.spr);
         this.top = new FCanvas();
         this.top.width = 360;
         this.top.height = 80;
         this.top.skin = "box";
         this.top.x = 10;
         this.top.y = 2;
         addChild(this.top);
         this.ftDesc = new FTextArea();
         this.ftDesc.x = 20;
         this.ftDesc.y = 10;
         this.ftDesc.width = 265;
         this.ftDesc.textColor = StaticValue.YELLOW;
         this.ftDesc.wordWrap = true;
         this.ftDesc.height = 60;
         addChild(this.ftDesc);
         this.btnInput = new SecondButton();
         this.btnInput.x = 300;
         this.btnInput.y = 10;
         this.btnInput.label = LanResManager.getLanCommonTextWords("放入元宝");
         this.btnInput.name = "input";
         this.btnInput.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnInput);
         this.ftMoney = new FTextArea();
         this.ftMoney.x = 20;
         this.ftMoney.y = 54;
         this.ftMoney.width = 350;
         this.ftMoney.height = 25;
         this.ftMoney.textColor = StaticValue.BlUE20;
         addChild(this.ftMoney);
         this.top = new FCanvas();
         this.top.width = 360;
         this.top.height = 88;
         this.top.skin = "box";
         this.top.x = 10;
         this.top.y = 290;
         addChild(this.top);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 300;
         this.ft.textColor = StaticValue.GREEN;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("备注：") + "<br>" + LanResManager.getLanCommonTextWords("参加活动可以有机会获得更多优惠。") + "<br>" + LanResManager.getLanCommonTextWords("每一种优惠只能获取一次") + "<br>" + LanResManager.getLanCommonTextWords("错过当天奖励，之后无法补领。");
         this.ft.width = 500;
         this.ft.height = 100;
         this.ft.wordWrap = true;
         addChild(this.ft);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var btn:SecondButton = e.target as SecondButton;
         switch(btn.name)
         {
            case "input":
               FAlert.show(LanResManager.getLanCommonTextWords("确定放入元宝？"),LanResManager.getLanCommonTextWords("提示"),2,function(param1:FAlertEvent = null):void
               {
                  if(Boolean(param1) && param1.eventData != FAlert.OK)
                  {
                     return;
                  }
                  dispatchEvent(new BaseEvent(UI_INPUTYUANBAO_CLICK,"",ty));
               });
               break;
            case "get":
               dispatchEvent(new BaseEvent(UI_GETJINPIAO_CLICK,"",this.ty));
         }
      }
      
      public function setData(param1:int, param2:String, param3:String, param4:int, param5:Array) : void
      {
         var _loc8_:FTextArea = null;
         var _loc9_:SecondButton = null;
         var _loc10_:String = null;
         var _loc11_:Boolean = false;
         var _loc12_:Bitmap = null;
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         var _loc6_:int = 0;
         if(param1 == 5)
         {
            height = 249;
            this.top.y = 200;
            this.ft.y = 210;
            this.ft.visible = false;
            this.top.visible = false;
         }
         else if(param1 == 6)
         {
            height = 249 - 30;
            this.top.y = 200 - 30;
            this.ft.y = 210 - 30;
            this.ft.visible = false;
            this.top.visible = false;
         }
         else
         {
            height = 420;
            this.top.y = 290;
            this.ft.y = 300;
            this.ft.visible = true;
            this.top.visible = true;
         }
         var _loc7_:int = 0;
         while(_loc7_ < param5.length)
         {
            _loc8_ = new FTextArea();
            _loc8_.x = 20;
            _loc8_.y = 90 + 30 * _loc7_;
            _loc8_.htmlText = param5[_loc7_].desc;
            _loc8_.width = 200;
            _loc8_.textColor = StaticValue.WHITE;
            this.spr.addChild(_loc8_);
            _loc9_ = new SecondButton();
            _loc9_.x = 280;
            _loc9_.y = 85 + 30 * _loc7_;
            _loc9_.name = "get";
            _loc10_ = "";
            _loc11_ = false;
            if(param5[_loc7_].state == "0")
            {
               _loc10_ = LanResManager.getLanCommonTextWords("可领取");
               _loc11_ = true;
            }
            else if(param5[_loc7_].state == 1)
            {
               _loc10_ = LanResManager.getLanCommonTextWords("已过期");
               _loc11_ = false;
            }
            else if(param5[_loc7_].state == 2)
            {
               _loc10_ = LanResManager.getLanCommonTextWords("未开始");
               _loc11_ = false;
            }
            else if(param5[_loc7_].state == 3)
            {
               _loc10_ = LanResManager.getLanCommonTextWords("已领取");
               _loc11_ = false;
            }
            else if(param5[_loc7_].state == 4)
            {
               _loc10_ = LanResManager.getLanCommonTextWords("未参与");
               _loc11_ = false;
            }
            _loc9_.label = _loc10_;
            _loc9_.enabled = _loc11_;
            _loc9_.addEventListener(MouseEvent.CLICK,this.onClick);
            this.spr.addChild(_loc9_);
            _loc12_ = new Bitmap();
            _loc12_ = StaticValue.getBitmapByClassName("ui.line");
            _loc12_.x = 20;
            _loc12_.y = 110 + 30 * _loc7_;
            _loc12_.width = 345;
            this.spr.addChild(_loc12_);
            _loc7_++;
         }
         this.ftDesc.htmlText = param2;
         this.ftMoney.htmlText = param3;
      }
      
      public function setType(param1:int) : void
      {
         this.ty = param1;
         if(param1 == 2)
         {
            titleText = LanResManager.getLanCommonTextWords("高级聚宝盆");
         }
         else if(param1 == 1)
         {
            titleText = LanResManager.getLanCommonTextWords("聚宝盆");
         }
         else if(param1 == 3)
         {
            titleText = LanResManager.getLanCommonTextWords("超级聚宝盆");
         }
         else if(param1 == 4)
         {
            titleText = LanResManager.getLanCommonTextWords("聚宝盆中");
         }
         else if(param1 == 5)
         {
            titleText = LanResManager.getLanCommonTextWords("黄金绿发");
         }
         else if(param1 == 6)
         {
            titleText = LanResManager.getLanCommonTextWords("黄金绿发下");
         }
         else if(param1 == 7)
         {
            titleText = LanResManager.getLanCommonTextWords("聚宝盆");
         }
         else if(param1 == 8)
         {
            titleText = LanResManager.getLanCommonTextWords("高级聚宝盆");
         }
         else if(param1 == 9)
         {
            titleText = LanResManager.getLanCommonTextWords("超级聚宝盆");
         }
      }
   }
}

