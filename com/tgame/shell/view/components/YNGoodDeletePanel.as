package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class YNGoodDeletePanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var input:FTextInput;
      
      private var item:ItemFace;
      
      private var bit:Bitmap;
      
      private var btnOk:SecondButton;
      
      private var btnCancel:SecondButton;
      
      private var itemSpr:Sprite;
      
      private var gid:int;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var go:Goods;
      
      public function YNGoodDeletePanel()
      {
         super();
         width = 220;
         height = 175;
         skin = "panel_btn";
         dragAble = true;
         titleText = LanResManager.getLanCommonTextWords("物品销毁");
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.input.text = "";
         while(this.itemSpr.numChildren > 0)
         {
            this.itemSpr.removeChildAt(0);
         }
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bit.x = 95;
         this.bit.y = 25;
         addChild(this.bit);
         this.itemSpr = new Sprite();
         addChild(this.itemSpr);
         this.itemSpr.x = 97;
         this.itemSpr.y = 27;
         with(this.itemSpr.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.itemSpr.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 70;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("输入密码：");
         addChild(this.ft);
         this.input = new FTextInput();
         this.input.textColor = 16777215;
         this.input.border = true;
         addChild(this.input);
         this.input.x = 75;
         this.input.y = 70;
         this.input.width = 120;
         this.input.height = 20;
         this.btnOk = new SecondButton();
         this.btnOk.y = 110;
         this.btnOk.label = LanResManager.getLanCommonTextWords("删除");
         this.btnOk.x = this.width / 2 - this.width / 2 / 2 - this.btnOk.width / 2;
         this.btnOk.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnOk);
         this.btnCancel = new SecondButton();
         this.btnCancel.y = 110;
         this.btnCancel.label = LanResManager.getLanCommonTextWords("取消");
         this.btnCancel.x = this.width / 2 + this.width / 2 / 2 - this.btnCancel.width / 2;
         this.btnCancel.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnCancel);
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         this.setItem();
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.itemSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.itemSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this.itemSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         switch(param1.target)
         {
            case this.btnOk:
               PipeManager.sendMsg(PipeConstants.SEND_YUENANGOODDELETE,[this.gid,this.input.text]);
               break;
            case this.btnCancel:
               this.onClose();
         }
      }
      
      private function setItem() : void
      {
         while(this.itemSpr.numChildren > 0)
         {
            this.itemSpr.removeChildAt(0);
         }
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            this.go = TCursorManager.currentItemFace.getBaseItem() as Goods;
            this.gid = this.go.position;
            this.item = new ItemFace(this.go);
            this.item.x = 0;
            this.item.y = 0;
            this.itemSpr.addChild(this.item);
         }
      }
   }
}

