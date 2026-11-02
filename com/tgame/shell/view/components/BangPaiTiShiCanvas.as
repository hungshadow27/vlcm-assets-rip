package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class BangPaiTiShiCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var closeBtn:FSimpleButton;
      
      private var ft1:FTextArea;
      
      private var ft:FTextArea;
      
      public function BangPaiTiShiCanvas()
      {
         super();
         skin = "menuBg";
         width = 240;
         height = 220;
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 5;
         this.closeBtn.y = 5;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 15;
            y = 15;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
         }
         addChild(this.ft1);
      }
      
      public function setNum(param1:int) : void
      {
         this.ft1.htmlText = "<font size=\'16\' color=\'" + StaticValue.ORANGE_HTML + "\'>【" + LanResManager.getLanCommonTextWords("温馨提示") + "】<br></font>" + "<font  color=\'" + StaticValue.GREEN_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("本帮还有") + "</font><font  color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "</font><font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("名帮派BOSS可供挑战，请从帮派任务界面打开血色城堡") + "</font><font  color=\'" + StaticValue.BLUE_HTML + "\'><br><br>" + LanResManager.getLanCommonTextWords("帮派经由帮主进行祭炼后再挑战可获得更高的奖励。") + "</font><font  color=\'" + StaticValue.YELLOW_HTML + "\'><br><br>" + LanResManager.getLanCommonTextWords("选中血色城堡中的后，点击进行挑战即可开启血色城堡，帮派中所有成员均可进入。") + "</font>";
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         POPWindowManager.closeWindow();
      }
   }
}

