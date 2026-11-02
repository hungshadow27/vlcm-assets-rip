package com.tgame.shell.view.components.ynOnline
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.YNOnLinePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class YNonlineRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      private var bt_bit:Bitmap;
      
      private var line:Bitmap;
      
      public function YNonlineRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FTextArea;
         var bit:Bitmap;
         var go:Goods;
         var btn:SecondButton;
         var item:ItemFace;
         _height = 60;
         this.line = new Bitmap();
         this.line = StaticValue.getBitmapByClassName("ui.line");
         this.line.x = 4;
         this.line.y = 60;
         this.line.width = 380;
         addChild(this.line);
         lb = new FTextArea();
         with(lb)
         {
            x = 10;
            y = 18;
            width = 80;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = data.desc;
         }
         addChild(lb);
         bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         bit.x = 170;
         bit.y = 4;
         addChild(bit);
         go = new Goods(data.gid);
         lb = new FTextArea();
         with(lb)
         {
            x = 170 - 20 - 20;
            y = 43;
            width = 150;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = go.res.name + "*" + data.gnum;
         }
         addChild(lb);
         btn = new SecondButton();
         btn.x = 310 - 40;
         btn.y = 20;
         btn.name = data.id;
         btn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(btn);
         if(data.state == 0)
         {
            btn.label = LanResManager.getLanCommonTextWords("不可领取");
            btn.enabled = false;
         }
         else if(data.state == 1)
         {
            btn.label = LanResManager.getLanCommonTextWords("可领取");
            btn.enabled = true;
         }
         else
         {
            btn.label = LanResManager.getLanCommonTextWords("已领取");
            btn.enabled = false;
         }
         item = new ItemFace(go);
         item.x = 172;
         item.y = 6;
         addChild(item);
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         $parent.dispatchEvent(new BaseEvent(YNOnLinePanel.UI_YNONLINE_CLICK,"",data.id));
      }
   }
}

