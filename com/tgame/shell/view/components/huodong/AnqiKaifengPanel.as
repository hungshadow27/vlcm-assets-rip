package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class AnqiKaifengPanel extends FPanel
   {
      
      public static const UI_KAIFENG_CLICK:String = "UI_KAIFENG_CLICK";
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var btn:SecondButton;
      
      private var djBit3:Bitmap;
      
      private var ifItem1:ItemFace;
      
      private var menuContainer:FCanvas;
      
      public function AnqiKaifengPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 252;
         height = 301;
         titleText = LanResManager.getLanCommonTextWords("孔雀翎开封");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.menuContainer = new FCanvas();
         this.menuContainer.skin = "backGroud";
         addChild(this.menuContainer);
         this.menuContainer.width = 232;
         this.menuContainer.height = 80;
         this.menuContainer.x = 10;
         this.menuContainer.y = 66;
         this.ft1 = new FTextArea();
         this.ft1.x = 11;
         this.ft1.y = 25;
         this.ft1.autoSize = TextFieldAutoSize.LEFT;
         this.ft1.textColor = StaticValue.WHITE;
         this.ft1.htmlText = "";
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         this.ft2.x = 20;
         this.ft2.y = 152;
         this.ft2.textColor = StaticValue.WHITE;
         this.ft2.width = 225;
         this.ft2.height = 75;
         this.ft2.wordWrap = true;
         this.ft2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("孔雀翎乃顶级暗器，由孔雀山庄历代相传，其中封印着不可思议的能力。使用暗器开封打磨石可进行开封") + "</font>";
         addChild(this.ft2);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("开封");
         addChild(this.btn);
         this.btn.x = (this.width - this.btn.width) / 2;
         this.btn.y = 235;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.dispatchEvent(new BaseEvent(UI_KAIFENG_CLICK));
         this.onClose();
      }
      
      public function setShuxingNum(param1:int) : void
      {
         this.ft1.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("孔雀翎开封属性：攻击") + "+" + param1 + "</font>";
      }
      
      public function setGoods(param1:Goods) : void
      {
         this.djBit3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit3.x = (this.width - this.djBit3.width) / 2;
         this.djBit3.y = 88;
         addChild(this.djBit3);
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            this.ifItem1.parent.removeChild(this.ifItem1);
         }
         this.ifItem1 = new ItemFace(param1);
         this.ifItem1.x = (this.width - this.djBit3.width) / 2 + 2;
         this.ifItem1.y = 90;
         if(param1.count == 0)
         {
            this.ifItem1.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.ifItem1.filters = [];
         }
         addChild(this.ifItem1);
      }
   }
}

