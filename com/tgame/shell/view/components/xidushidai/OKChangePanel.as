package com.tgame.shell.view.components.xidushidai
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class OKChangePanel extends Sprite
   {
      
      public static const UI_QUEDING_CLICK:String = "UI_QUEDING_CLICK";
      
      private var bgCanvas:FCanvas;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var trueBtn:SecondButton;
      
      private var thinkBtn:SecondButton;
      
      public function OKChangePanel()
      {
         var fc:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 406;
         this.bgCanvas.height = 210;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         fc = new FCanvas();
         fc.skin = "canvas1";
         fc.x = 0;
         fc.y = 0;
         fc.width = 406;
         fc.height = 210;
         addChild(fc);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 20;
            textColor = StaticValue.RED;
            autoSize = TextFieldAutoSize.LEFT;
         }
         addChild(this.fta1);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 20;
            y = 70;
            width = 380;
            height = 200;
            multiline = true;
            wordWrap = true;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("注：转换后您当前的技能将全部免费转换，武学层数不会发生改变。");
         }
         addChild(this.fta2);
         this.trueBtn = new SecondButton();
         this.trueBtn.x = 80;
         this.trueBtn.y = 150;
         this.trueBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.trueBtn);
         this.trueBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.thinkBtn = new SecondButton();
         this.thinkBtn.x = 240;
         this.thinkBtn.y = 150;
         this.thinkBtn.label = LanResManager.getLanCommonTextWords("再想想");
         addChild(this.thinkBtn);
         this.thinkBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_QUEDING_CLICK));
         this.onClose(param1);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setParty(param1:int) : void
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("少林派");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("全真派");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("古墓派");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("桃花岛");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("白驼山");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("明教");
         }
         this.fta1.htmlText = LanResManager.getLanCommonTextWords("您确定要转换为") + _loc2_ + LanResManager.getLanCommonTextWords("吗？");
      }
   }
}

