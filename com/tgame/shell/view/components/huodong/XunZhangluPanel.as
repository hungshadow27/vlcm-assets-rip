package com.tgame.shell.view.components.huodong
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class XunZhangluPanel extends FPanel
   {
      
      public static const OK_BTN_CLICK:String = "OK_BTN_CLICK";
      
      public static const UDPATE_BTN_CLICK:String = "UDPATE_BTN_CLICK";
      
      private var bgCanvas:FCanvas;
      
      private var img:Bitmap;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var ok_btn:SecondButton;
      
      private var update_btn:SecondButton;
      
      private var item:ItemFace;
      
      private var goodsPos:Point;
      
      private var dist_goodId:int;
      
      public function XunZhangluPanel()
      {
         this.goodsPos = new Point();
         super();
         dragAble = true;
         titleText = LanResManager.getLanCommonTextWords("最终勋章炉");
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 305;
         height = 200;
         addEventListener(FCloseEvent.CLOSE,this._close);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 120 - 35 + 45;
         this.img.y = 15 - 3 + 10;
         this.goodsPos.x = this.img.x + 2;
         this.goodsPos.y = this.img.y + 2;
         this.img = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         addChild(this.img);
         this.img.width = 193 + 90;
         this.img.height = 25 + 20;
         this.img.x = 11;
         this.img.y = 60 + 20;
         this.img = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.img);
         this.img.width = 193 + 90;
         this.img.x = 11;
         this.img.y = 60 + 30 - 3 - 5;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            x = 50 + 15;
            y = 65 + 30 - 3 - 3;
            textColor = StaticValue.GREEN;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("元宝刷新：每次消耗10元宝");
         }
         addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 170 - 40 + 45;
            y = 27 - 3 + 10;
            textColor = StaticValue.ORANGE;
            autoSize = TextFieldAutoSize.LEFT;
         }
         this.fta1.htmlText = LanResManager.getLanCommonTextWords("×1");
         addChild(this.fta1);
         this.ok_btn = new SecondButton();
         this.ok_btn.label = LanResManager.getLanCommonTextWords("确认领取");
         this.ok_btn.x = 82 - 10;
         this.ok_btn.y = 136;
         addChild(this.ok_btn);
         this.ok_btn.addEventListener(MouseEvent.CLICK,this._onClick);
         this.update_btn = new SecondButton();
         this.update_btn.label = LanResManager.getLanCommonTextWords("元宝刷新");
         this.update_btn.x = 174 - 10;
         this.update_btn.y = 136;
         addChild(this.update_btn);
         this.update_btn.addEventListener(MouseEvent.CLICK,this._onClick);
      }
      
      private function _close(param1:FCloseEvent = null) : void
      {
         this.alert_tip();
      }
      
      private function alert_tip() : void
      {
         var str:String = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("关闭面板后将不会获得任何道具") + "</font>" + "</textformat>";
         FAlert.show(str,"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               onClose();
            }
         });
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function _onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.ok_btn:
               dispatchEvent(new BaseEvent(OK_BTN_CLICK,"",this.dist_goodId));
               break;
            case this.update_btn:
               dispatchEvent(new BaseEvent(UDPATE_BTN_CLICK,""));
         }
      }
      
      public function setGoods(param1:Goods) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.dist_goodId = param1.id;
         this.item.x = this.goodsPos.x;
         this.item.y = this.goodsPos.y;
         addChild(this.item);
      }
   }
}

