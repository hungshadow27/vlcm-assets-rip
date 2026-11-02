package com.tgame.shell.view.components.temp
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.*;
   import flash.text.*;
   
   public class ShenLongFuLianZiPanel extends FPanel
   {
      
      public static const UI_SHENLONGHUSHENFU_HUFU_PUT:String = "UI_SHENLONGHUSHENFU_HUFU_PUT";
      
      public static const UI_SHENLONGHUSHENFU_HUFU_GET:String = "UI_SHENLONGHUSHENFU_HUFU_GET";
      
      public static const UI_SHENLONGHUSHENFU_START:String = "UI_SHENLONGHUSHENFU_START";
      
      private var tip:FTextArea;
      
      private var getBtn:SmallButton;
      
      private var okBtn:SecondButton;
      
      private var item1:ItemFace;
      
      private var item2:ItemFace;
      
      private var item3:ItemFace;
      
      public function ShenLongFuLianZiPanel()
      {
         var v:Vector.<Bitmap>;
         var ft:FTextArea;
         var img:Bitmap = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 326;
         height = 325;
         titleText = LanResManager.getLanCommonTextWords("神龙护身符");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.amulet.shenlong.ui";
         addChild(img);
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         ft = new FTextArea();
         with(ft)
         {
            x = 82;
            y = 7;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
         }
         ft.htmlText = LanResManager.getLanTextWords(this,"属性加成");
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 20;
            y = 65;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
         }
         ft.htmlText = LanResManager.getLanTextWords(this,"炼制所需材料",[StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML]);
         addChild(ft);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 124;
            y = 186;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.GREEN;
         }
         this.tip.htmlText = LanResManager.getLanTextWords(this,"活动期间炼制");
         addChild(this.tip);
         this.getBtn = new SmallButton();
         with(this.getBtn)
         {
            x = 20 - 7;
            y = 174;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         this.getBtn.label = LanResManager.getLanTextWords(this,"放入护符");
         addChild(this.getBtn);
         this.okBtn = new SecondButton();
         with(this.okBtn)
         {
            label = LanResManager.getLanCommonTextWords("开始炼制");
            x = (panelWidth - okBtn.width) / 2;
            y = 260;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         this.okBtn.label = LanResManager.getLanCommonTextWords("开始炼制");
         addChild(this.okBtn);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.getBtn:
               if(this.getBtn.label == LanResManager.getLanTextWords(this,"放入护符"))
               {
                  dispatchEvent(new BaseEvent(UI_SHENLONGHUSHENFU_HUFU_PUT));
               }
               else
               {
                  dispatchEvent(new BaseEvent(UI_SHENLONGHUSHENFU_HUFU_GET));
               }
               break;
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_SHENLONGHUSHENFU_START));
         }
      }
      
      public function isShowHouDongTip(param1:Boolean) : void
      {
         this.tip.visible = param1;
      }
      
      public function setItem_shenlong(param1:Goods) : void
      {
         if(Boolean(this.item1) && Boolean(this.item1.parent))
         {
            this.item1.parent.removeChild(this.item1);
         }
         this.item1 = new ItemFace(param1);
         addChild(this.item1);
         this.item1.x = 25;
         this.item1.y = 14;
      }
      
      public function setItem_hufu(param1:Goods) : void
      {
         if(Boolean(this.item2) && Boolean(this.item2.parent))
         {
            this.item2.parent.removeChild(this.item2);
         }
         if(param1)
         {
            this.getBtn.label = LanResManager.getLanTextWords(this,"取出护符");
            this.item2 = new ItemFace(param1);
            addChild(this.item2);
            this.item2.x = 25;
            this.item2.y = 198;
         }
         else
         {
            this.getBtn.label = LanResManager.getLanTextWords(this,"放入护符");
         }
      }
      
      public function setItem_julingzhu(param1:Goods) : void
      {
         if(Boolean(this.item3) && Boolean(this.item3.parent))
         {
            this.item3.parent.removeChild(this.item3);
         }
         if(!param1)
         {
            return;
         }
         this.item3 = new ItemFace(param1);
         addChild(this.item3);
         this.item3.x = 78;
         this.item3.y = 198;
      }
   }
}

