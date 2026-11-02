package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class WuXingZhiRenQieHuanPanel extends FPanel
   {
      
      public static const UI_WUXINGZHIREN_QIEHUAN:String = "UI_WUXINGZHIREN_QIEHUAN";
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var quedingBtn:SecondButton;
      
      private var quxiaoBtn:SecondButton;
      
      private var curID:int;
      
      public function WuXingZhiRenQieHuanPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 440;
         height = 140;
         addEventListener(FCloseEvent.CLOSE,this.onClose1);
         titleText = LanResManager.getLanCommonTextWords("五行切换");
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 30;
            y = 10;
            htmlText = "";
         }
         addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 30;
            y = 30;
            htmlText = "";
         }
         addChild(this.fta1);
         this.quedingBtn = new SecondButton();
         this.quedingBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.quedingBtn);
         this.quedingBtn.x = 140;
         this.quedingBtn.y = 75;
         this.quedingBtn.addEventListener(MouseEvent.CLICK,this.onClose2);
         this.quxiaoBtn = new SecondButton();
         this.quxiaoBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.quxiaoBtn);
         this.quxiaoBtn.x = 240 + 5;
         this.quxiaoBtn.y = 75;
         this.quxiaoBtn.addEventListener(MouseEvent.CLICK,this.onClose2);
      }
      
      private function onClose1(param1:FCloseEvent) : void
      {
         this.deleteShuoming();
      }
      
      private function onClose2(param1:MouseEvent) : void
      {
         switch((param1.target as SecondButton).label)
         {
            case LanResManager.getLanCommonTextWords("确定"):
               this.dispatchEvent(new BaseEvent(UI_WUXINGZHIREN_QIEHUAN,"",this.curID));
               this.deleteShuoming();
               break;
            case LanResManager.getLanCommonTextWords("取消"):
               this.deleteShuoming();
         }
      }
      
      private function deleteShuoming() : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setText(param1:String, param2:String, param3:int) : void
      {
         this.fta.htmlText = param1;
         this.fta1.htmlText = param2;
         this.curID = param3;
      }
   }
}

