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
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class RongXunDanPanel extends FPanel
   {
      
      public static const UI_RONGXUEDAN_OPTION_PANEL_STONE_CLICK:String = "UI_RONGXUEDAN_OPTION_PANEL_STONE_CLICK";
      
      public static const UI_RONGXUEDAN_OPTION_PANEL_DRAG_ENTER:String = "UI_RONGXUEDAN_OPTION_PANEL_DRAG_ENTER";
      
      public static const UI_RONGXUEDAN_START:String = "UI_RONGXUEDAN_START";
      
      private var container:Sprite;
      
      private var okBtn:SecondButton;
      
      private var item:ItemFace;
      
      public function RongXunDanPanel()
      {
         var ft:FTextArea;
         var img:Bitmap = null;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 330;
         height = 197;
         titleText = LanResManager.getLanCommonTextWords("融雪丹");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         ft = new FTextArea();
         with(ft)
         {
            x = 15;
            y = 5;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,0,[StaticValue.PURPLE_HTML,StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML]) + "</textformat>";
         }
         addChild(ft);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 202;
         img.y = 105;
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 10;
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,310,152);
            endFill();
         }
         this.container.addEventListener(MouseEvent.MOUSE_UP,this.onDrag,false,30);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("开始融合");
         addChild(this.okBtn);
         this.okBtn.x = 248;
         this.okBtn.y = 122;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.setITem();
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onDrag(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_RONGXUEDAN_OPTION_PANEL_DRAG_ENTER));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_RONGXUEDAN_START));
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_RONGXUEDAN_OPTION_PANEL_STONE_CLICK));
      }
      
      public function setITem(param1:Goods = null) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.removeEventListener(MouseEvent.CLICK,this.onItemClick);
            this.item.parent.removeChild(this.item);
         }
         if(!param1)
         {
            this.okBtn.enabled = false;
            return;
         }
         this.okBtn.enabled = true;
         this.item = new ItemFace(param1);
         this.item.addEventListener(MouseEvent.CLICK,this.onItemClick);
         addChild(this.item);
         this.item.x = 204;
         this.item.y = 107;
      }
   }
}

