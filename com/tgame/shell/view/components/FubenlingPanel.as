package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class FubenlingPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var tip:FTextArea;
      
      private var fta:FTextArea;
      
      private var SubBtn:SecondButton;
      
      private var QuxiaoBtn:SecondButton;
      
      private var nyd:int;
      
      public function FubenlingPanel()
      {
         var img:Bitmap = null;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 345;
         height = 200;
         this.titleText = LanResManager.getLanCommonTextWords("副本令");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 325;
            height = 50;
            x = 15;
            y = 10;
            filters = StaticValue.filter;
         }
         addChild(this.tip);
         this.fta = new FTextArea();
         with(this.fta)
         {
            width = 255;
            height = 50;
            x = 15;
            y = 55;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗数量将会在今日晚上24:00重新开始计数。") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("我们并不推荐您在同一天内连续进入。") + "</font>" + "</textformat>";
         }
         addChild(this.fta);
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 325;
         img.x = 10;
         img.y = 95;
         this.fta = new FTextArea();
         with(this.fta)
         {
            width = 255;
            height = 50;
            x = 15;
            y = 102;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请问您是需要传入该副本吗？") + "</font>" + "</textformat>";
         }
         addChild(this.fta);
         this.SubBtn = new SecondButton();
         this.SubBtn.label = LanResManager.getLanCommonTextWords("进入");
         addChild(this.SubBtn);
         this.SubBtn.x = 83;
         this.SubBtn.y = 135;
         this.SubBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.QuxiaoBtn = new SecondButton();
         this.QuxiaoBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.QuxiaoBtn);
         this.QuxiaoBtn.x = 228;
         this.QuxiaoBtn.y = 135;
         this.QuxiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.SubBtn:
               this.$parent.dispatchEvent(new BaseEvent(InstanceConvectionPanel.UI_FUBENLINPANEL_SUBBTN,"",[1,this.nyd]));
               break;
            case this.QuxiaoBtn:
               this.$parent.dispatchEvent(new BaseEvent(InstanceConvectionPanel.UI_FUBENLINPANEL_QUXIAOBTN));
         }
         this.onClose();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function SetInitialize(param1:int, param2:String, param3:int, param4:int) : void
      {
         this.nyd = param4;
         this.tip.htmlText = LanResManager.getLanTextWords(this,"您今天是第次使用副本令进入",[StaticValue.RED_HTML,param1,param2,StaticValue.RED_HTML,param3]);
      }
   }
}

