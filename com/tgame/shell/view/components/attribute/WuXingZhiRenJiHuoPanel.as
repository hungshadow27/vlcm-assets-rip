package com.tgame.shell.view.components.attribute
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
   
   public class WuXingZhiRenJiHuoPanel extends FPanel
   {
      
      public static const UI_JIHUOWUXINGZHIREN_CLICK:String = "UI_JIHUOWUXINGZHIREN_CLICK";
      
      private var ft:FTextArea;
      
      private var djBit1:Bitmap;
      
      private var btn:SecondButton;
      
      private var btn1:SecondButton;
      
      private var menuContainer:FCanvas;
      
      private var ifItem3:ItemFace;
      
      private var djBit3:Bitmap;
      
      public function WuXingZhiRenJiHuoPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 440;
         height = 150;
         titleText = "";
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("激活");
         addChild(this.btn);
         this.btn.x = 120;
         this.btn.y = 85;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btn1 = new SecondButton();
         this.btn1.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.btn1);
         this.btn1.x = 280;
         this.btn1.y = 85;
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         this.ft.x = 100;
         this.ft.y = 15;
         this.ft.width = 320;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.wordWrap = true;
         this.ft.filters = StaticValue.filter;
         this.ft.htmlText = "";
         addChild(this.ft);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setWuXingZhiRenJiHuo() : void
      {
         titleText = LanResManager.getLanCommonTextWords("激活五行之刃");
         this.ft.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家可以使用五行之刃激活对应的五行属性");
      }
      
      public function setGoods3(param1:Goods = null, param2:Boolean = true) : void
      {
         this.djBit3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit3.x = 30;
         this.djBit3.y = 20;
         addChild(this.djBit3);
         if(this.ifItem3 != null && this.ifItem3.parent != null)
         {
            this.ifItem3.parent.removeChild(this.ifItem3);
         }
         if(param1 == null)
         {
            return;
         }
         this.ifItem3 = new ItemFace(param1);
         this.ifItem3.x = 32;
         this.ifItem3.y = 22;
         if(param1.count == 0)
         {
            this.ifItem3.filters = Tools.blackWhiteFilter;
         }
         if(param2 == false)
         {
            this.ifItem3.filters = Tools.blackWhiteFilter;
         }
         addChild(this.ifItem3);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch((param1.target as SecondButton).label)
         {
            case LanResManager.getLanCommonTextWords("激活"):
               this.dispatchEvent(new BaseEvent(UI_JIHUOWUXINGZHIREN_CLICK));
               this.onClose();
               break;
            case LanResManager.getLanCommonTextWords("取消"):
               this.onClose();
         }
      }
   }
}

