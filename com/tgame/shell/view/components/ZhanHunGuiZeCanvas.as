package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   import flash.text.*;
   
   public class ZhanHunGuiZeCanvas extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var ft1:FTextArea;
      
      public function ZhanHunGuiZeCanvas()
      {
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 350;
         height = 320;
         titleText = LanResManager.getLanCommonTextWords("战魂规则");
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 15;
            y = 15;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("获取战魂") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击战魂NPC后，会随机出现一个战魂在界面上方") + "<br><br>" + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("战魂分类") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("战魂分为灰、白、蓝、绿、紫、橙6种，灰色为厄运最差，只能卖出，橙色为最好。") + "<br><br></font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("战魂吞噬") + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("战魂也可以通过升级来获得更高的属性加成，升级方式是通过战魂的吞噬累积经验来完成") + "<br><br></font>";
         }
         addChild(this.ft1);
         addEventListener(FCloseEvent.CLOSE,this.onClose);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

