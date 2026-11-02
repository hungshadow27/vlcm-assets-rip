package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ReLivePanel extends FPanel
   {
      
      private static var localeBtn:SecondButton;
      
      private static var returnBtn:SecondButton;
      
      private static var ft:FTextArea;
      
      public static const UI_RELIVEPANEL_LOCALE_RELIVE_BTN_CLICK:String = "UI_RELIVEPANEL_LOCALE_RELIVE_BTN_CLICK";
      
      public static const UI_RELIVEPANEL_RETURN_RELIVE_BTN_CLICK:String = "UI_RELIVEPANEL_RETURN_RELIVE_BTN_CLICK";
      
      public static const UI_RELIVEPANEL_BUY_FLOWER_BTN_CLICK:String = "UI_RELIVEPANEL_BUY_FLOWER_BTN_CLICK";
      
      public static const UI_RELIVEPANEL_BUY_BTN_CLICK:String = "UI_RELIVEPANEL_BUY_BTN_CLICK";
      
      private var item:DisplayObject;
      
      private var buyBtn:SecondButton;
      
      private var tip:FLabel;
      
      private var timer:Timer;
      
      public function ReLivePanel()
      {
         var line:Bitmap = null;
         super();
         skin = "sceondPanel_btn";
         dragAble = true;
         width = 295;
         height = 155;
         titleText = LanResManager.getLanCommonTextWords("原地复活");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.item = new Bitmap();
         addChild(this.item);
         this.item.x = 20;
         this.item.y = 12;
         ft = new FTextArea();
         with(ft)
         {
            x = 97;
            y = 6;
            width = 195;
            height = 60;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "<textformat>" + LanResManager.getLanTextWords(this,0) + "</textformat>";
         }
         addChild(ft);
         line = StaticValue.getBitmapByClassName("ui.line");
         addChild(line);
         line.width = 193;
         line.x = 97;
         line.y = 58;
         this.tip = new FLabel();
         with(this.tip)
         {
            x = 97;
            y = 62;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = 15 + LanResManager.getLanTextWords(this,1);
         }
         addChild(this.tip);
         localeBtn = new SecondButton();
         localeBtn.label = LanResManager.getLanTextWords(this,"原地复活");
         addChild(localeBtn);
         localeBtn.x = 50;
         localeBtn.y = 98;
         localeBtn.enabled = false;
         localeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         returnBtn = new SecondButton();
         returnBtn.label = LanResManager.getLanTextWords(this,"回城复活");
         addChild(returnBtn);
         returnBtn.x = width - returnBtn.width - 50;
         returnBtn.y = 98;
         returnBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.timer = new Timer(1000,15);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onCom);
      }
      
      public static function showRelivePanel(param1:int, param2:String, param3:Boolean = false) : ReLivePanel
      {
         var _loc4_:ReLivePanel = new ReLivePanel();
         _loc4_.setFlower(param1,param2,param3);
         POPWindowManager.showWindow(_loc4_);
         return _loc4_;
      }
      
      public static function showRelivePanels(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false) : ReLivePanel
      {
         ft.htmlText = LanResManager.getLanCommonTextWords("在比武大会赛场，可以使用天山雪莲原地复活。请问你现在需要原地复活吗？");
         returnBtn.label = LanResManager.getLanCommonTextWords("传出战场");
         var _loc5_:ReLivePanel = new ReLivePanel();
         _loc5_.setFlower(param1,param2);
         localeBtn.enabled = param3;
         returnBtn.enabled = param4;
         POPWindowManager.showWindow(_loc5_);
         return _loc5_;
      }
      
      public static function showLeitaiPanel(param1:int, param2:String) : ReLivePanel
      {
         var _loc3_:ReLivePanel = new ReLivePanel();
         _loc3_.setHtml(LanResManager.getLanCommonTextWords("可以使用复活圣水复活复活圣水还可使用") + param1 + LanResManager.getLanCommonTextWords("次请问您现在需要复活吗？"));
         _loc3_.setReturnBtn(LanResManager.getLanCommonTextWords("离开擂台"));
         _loc3_.setFlower(param1,param2);
         POPWindowManager.showWindow(_loc3_);
         return _loc3_;
      }
      
      public static function showCishaPanel(param1:int, param2:String) : ReLivePanel
      {
         var _loc3_:ReLivePanel = new ReLivePanel();
         _loc3_.setHtml(LanResManager.getLanCommonTextWords("可以使用回生令牌复活，请问你现在需要原地复活吗？"));
         _loc3_.setReturnBtn(LanResManager.getLanCommonTextWords("否"));
         _loc3_.setFlower(param1,param2);
         POPWindowManager.showWindow(_loc3_);
         return _loc3_;
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.tip.text = 15 - this.timer.currentCount + LanResManager.getLanTextWords(this,1);
      }
      
      private function onCom(param1:TimerEvent) : void
      {
         this.timer.reset();
         this.onClose();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.timer.stop();
         this.timer.reset();
         this.tip.text = 15 + LanResManager.getLanTextWords(this,1);
         POPWindowManager.closeWindow();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case localeBtn:
               dispatchEvent(new BaseEvent(UI_RELIVEPANEL_LOCALE_RELIVE_BTN_CLICK));
               this.onClose();
               break;
            case returnBtn:
               dispatchEvent(new BaseEvent(UI_RELIVEPANEL_RETURN_RELIVE_BTN_CLICK));
               this.onClose();
         }
      }
      
      public function setFlower(param1:int, param2:String = "", param3:Boolean = false) : void
      {
         this.timer.start();
         if(param2 != "")
         {
            if(this.item.parent)
            {
               this.item.parent.removeChild(this.item);
            }
            this.item = FLoader.startLoad(param2,65,65);
            addChild(this.item);
            this.item.x = 20;
            this.item.y = 12;
         }
         if(param1 == 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
            localeBtn.enabled = false;
         }
         else
         {
            this.item.filters = [];
            localeBtn.enabled = true;
         }
         if(param3)
         {
            localeBtn.enabled = true;
         }
      }
      
      public function setHtml(param1:String) : void
      {
         ft.htmlText = param1;
      }
      
      public function setReturnBtn(param1:String) : void
      {
         returnBtn.label = param1;
      }
   }
}

