package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TCursorManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class ZhuangbeiHuishouPanel extends FPanel
   {
      
      public static const UI_ZHUANGBEI_HUISHOU_OK:String = "UI_ZHUANGBEI_HUISHOU_OK";
      
      public static const UI_ZHUANGBEI_HUISHOU_DRAG_ENTER:String = "UI_ZHUANGBEI_HUISHOU_DRAG_ENTER";
      
      private var ft:FTextArea;
      
      private var djBit1:Bitmap;
      
      private var djBit2:Bitmap;
      
      private var jtBit:Bitmap;
      
      private var ft2:FTextArea;
      
      private var btn:SecondButton;
      
      private var menuContainer:FCanvas;
      
      private var ifItem1:ItemFace;
      
      private var ifItem2:ItemFace;
      
      private var leftGoodContainer:Sprite;
      
      private var rightGoodContainer:Sprite;
      
      private var curGood:Goods;
      
      private var _modal:Boolean;
      
      public function ZhuangbeiHuishouPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 252;
         height = 318;
         titleText = LanResManager.getLanCommonTextWords("装备回收");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.setUI();
      }
      
      public function setUI() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 15;
         this.ft.width = 218;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.wordWrap = true;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("请确认放入的装备！") + "<br/><b><font color=\'#ff0000\'>" + LanResManager.getLanCommonTextWords("确认回收之后，原装备将消失");
         addChild(this.ft);
         this.menuContainer = new FCanvas();
         this.menuContainer.skin = "backGroud";
         addChild(this.menuContainer);
         this.menuContainer.width = 232;
         this.menuContainer.height = 80;
         this.menuContainer.x = 10;
         this.menuContainer.y = 70;
         this.djBit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit1.x = 50 - 2;
         this.djBit1.y = 102 - 10;
         addChild(this.djBit1);
         this.djBit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit2.x = 170 - 2;
         this.djBit2.y = 102 - 10;
         addChild(this.djBit2);
         this.jtBit = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.4");
         this.jtBit.rotation = -90;
         this.jtBit.x = 89;
         this.jtBit.y = 129 - 10;
         addChild(this.jtBit);
         this.ft2 = new FTextArea();
         this.ft2.x = 15;
         this.ft2.y = 173 - 5;
         this.ft2.width = 220;
         this.ft2.wordWrap = true;
         this.ft2.autoSize = TextFieldAutoSize.LEFT;
         this.ft2.textColor = StaticValue.RED;
         this.ft2.htmlText = LanResManager.getLanCommonTextWords("活动中只需要使用任意一件装备");
         addChild(this.ft2);
         this.btn = new SecondButton();
         this.btn.x = 90;
         this.btn.y = 252;
         this.btn.label = LanResManager.getLanCommonTextWords("装备回收");
         addChild(this.btn);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.leftGoodContainer = new Sprite();
         addChild(this.leftGoodContainer);
         this.leftGoodContainer.x = 50;
         this.leftGoodContainer.y = 94;
         with(this.leftGoodContainer.graphics)
         {
            beginFill(0,0.5);
            drawRect(0,0,35,35);
            endFill();
         }
         this.leftGoodContainer.addEventListener(MouseEvent.MOUSE_UP,this.handleMouseUp,false,30);
         this.rightGoodContainer = new Sprite();
         addChild(this.rightGoodContainer);
         this.rightGoodContainer.x = 170;
         this.rightGoodContainer.y = 94;
         with(this.rightGoodContainer.graphics)
         {
            beginFill(0,0.5);
            drawRect(0,0,35,35);
            endFill();
         }
      }
      
      private function handleMouseUp(param1:MouseEvent) : void
      {
         if(Boolean(TCursorManager.currentItemFace) && TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            this.curGood = TCursorManager.currentItemFace.getBaseItem() as Goods;
            this.setGood(this.curGood);
         }
      }
      
      public function setGood(param1:Goods = null) : void
      {
         while(this.leftGoodContainer.numChildren > 0)
         {
            this.leftGoodContainer.removeChildAt(0);
         }
         if(param1 == null)
         {
            return;
         }
         this.leftGoodContainer.addChild(new ItemFace(param1));
      }
      
      public function setRightGoods(param1:Goods = null) : void
      {
         while(this.rightGoodContainer.numChildren > 0)
         {
            this.rightGoodContainer.removeChildAt(0);
         }
         if(param1 == null)
         {
            return;
         }
         this.rightGoodContainer.addChild(new ItemFace(param1));
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
            this.clearGoods();
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.curGood)
         {
            this.dispatchEvent(new BaseEvent(UI_ZHUANGBEI_HUISHOU_OK,"",this.curGood));
         }
         this.clearGoods();
      }
      
      private function clearGoods() : void
      {
         while(this.leftGoodContainer.numChildren > 0)
         {
            this.leftGoodContainer.removeChildAt(0);
            this.curGood = null;
         }
      }
   }
}

