package com.tgame.shell.view.components.kuafulunjianBackpack
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.KuafuLunjianBackpack;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class KuafuLjianItemSplitPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var count:FTextInput;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var total:int = 0;
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      public function KuafuLjianItemSplitPanel()
      {
         var lb:FTextArea;
         var img:F9GridBitmap = null;
         super();
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 172;
         height = 162;
         titleText = LanResManager.getLanCommonTextWords("物品拆分");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         lb = new FTextArea();
         with(lb)
         {
            x = 9;
            y = 2;
            width = 155;
            height = 50;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            wordWrap = true;
            text = LanResManager.getLanTextWords(this,"您的物品将拆分为两堆");
         }
         addChild(lb);
         img = Tools.get9GridBitmpByName("inputBg");
         addChild(img);
         img.width = 60;
         img.x = 52;
         img.y = 54;
         this.count = new FTextInput();
         with(this.count)
         {
            width = 50;
            height = 20;
            x = 57;
            y = 54;
            restrict = "0-9";
            textColor = StaticValue.ORANGE;
         }
         this.count.addEventListener(Event.CHANGE,this.onChange);
         addChild(this.count);
         this.addBtn = new FSimpleButton();
         this.addBtn.skin = "sumButton";
         addChild(this.addBtn);
         this.addBtn.x = 112;
         this.addBtn.y = 55;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         addChild(this.subBtn);
         this.subBtn.x = 52 - this.subBtn.width;
         this.subBtn.y = 55;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 15;
         this.okBtn.y = 102;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 172 - 15 - this.cancelBtn.width;
         this.cancelBtn.y = 102;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onChange(param1:Event) : void
      {
         if(int(this.count.text) < 0)
         {
            this.count.text = "0";
         }
         if(int(this.count.text) > this.total)
         {
            this.count.text = this.total.toString();
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtn:
               if(int(this.count.text) > 1)
               {
                  this.count.text = String(int(this.count.text) - 1);
               }
               break;
            case this.addBtn:
               if(int(this.count.text) < this.total - 1)
               {
                  this.count.text = String(int(this.count.text) + 1);
               }
               break;
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(KuafuLunjianBackpack.UI_KUAFULUNJIAN_SPLITITEM,"",int(this.count.text)));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function setTotal(param1:int) : void
      {
         this.total = param1;
         this.count.text = param1.toString();
      }
   }
}

