package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class ShuxingDazaokaPanel extends FPanel
   {
      
      public static const UI_SHUXINGDAZAOKA_ZHUANGBEI_CLICK:String = "UI_SHUXINGDAZAOKA_ZHUANGBEI_CLICK";
      
      public static const UI_SHUXINGDAZAOKA_QUEDING_CLICK:String = "UI_SHUXINGDAZAOKA_QUEDING_CLICK";
      
      private var setItemBtn:SmallButton;
      
      private var item:ItemFace;
      
      private var startBtn:SecondButton;
      
      private var line:Bitmap;
      
      public function ShuxingDazaokaPanel()
      {
         var text1:FTextArea;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 260;
         height = 180;
         titleText = LanResManager.getLanCommonTextWords("属性打造卡");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.line);
         this.line.x = 30;
         this.line.y = 20;
         text1 = new FTextArea();
         with(text1)
         {
            width = 160;
            height = 80;
            x = 85;
            y = 25;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            wordWrap = true;
            htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanTextWords(this,"使用属性打造卡可以将条相同附加属性的装备升级为条相同属性的装1",[StaticValue.GREEN_HTML]) + "</textformat>";
         }
         addChild(text1);
         this.setItemBtn = new SmallButton();
         this.setItemBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         addChild(this.setItemBtn);
         this.setItemBtn.x = 22;
         this.setItemBtn.y = 70;
         this.setItemBtn.addEventListener(MouseEvent.CLICK,this.onSetItem);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.startBtn);
         this.startBtn.x = 110;
         this.startBtn.y = 115;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onSetItem(param1:MouseEvent) : void
      {
         if(this.setItemBtn.label == LanResManager.getLanCommonTextWords("放入装备"))
         {
            dispatchEvent(new BaseEvent(UI_SHUXINGDAZAOKA_ZHUANGBEI_CLICK,"",1));
         }
         else
         {
            dispatchEvent(new BaseEvent(UI_SHUXINGDAZAOKA_ZHUANGBEI_CLICK,"",2));
         }
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_SHUXINGDAZAOKA_QUEDING_CLICK));
      }
      
      public function setItem(param1:Goods) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 32;
         this.item.y = 22;
         addChild(this.item);
         this.setItemBtn.label = LanResManager.getLanCommonTextWords("取出装备");
      }
      
      public function getItem() : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.setItemBtn.label = LanResManager.getLanCommonTextWords("放入装备");
      }
   }
}

