package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class FengLuJiangLiBiaoPanel extends FPanel
   {
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var bg1:DisplayObject;
      
      public function FengLuJiangLiBiaoPanel()
      {
         var ft:FTextArea = null;
         var ft1:FTextArea = null;
         var ft2:FTextArea = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 576 + 130 - 185 - 10 - 1;
         height = 432 + 140 - 122 - 2;
         titleText = LanResManager.getLanCommonTextWords("俸禄奖励表");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/fljl_y.swf");
         this.bg1.x = 10;
         this.bg1.y = 2;
         addChild(this.bg1);
         ft = new FTextArea();
         ft.multiline = true;
         ft.wordWrap = true;
         ft.filters = StaticValue.filter;
         ft.width = 100;
         ft.height = 70;
         ft.x = 25 + 10;
         ft.y = 20 - 10;
         addChild(ft);
         ft.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("封号") + "</font>";
         ft1 = new FTextArea();
         ft1.multiline = true;
         ft1.wordWrap = true;
         ft1.filters = StaticValue.filter;
         ft1.width = 100;
         ft1.height = 70;
         ft1.x = 250 - 45 - 30;
         ft1.y = 20 - 10;
         addChild(ft1);
         ft1.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("固定奖励") + "</font>";
         ft2 = new FTextArea();
         ft2.multiline = true;
         ft2.wordWrap = true;
         ft2.filters = StaticValue.filter;
         ft2.width = 100;
         ft2.height = 70;
         ft2.x = 400 + 24 - 55;
         ft2.y = 20 - 10;
         addChild(ft2);
         ft2.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("每天俸禄") + "</font>";
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 35 - 15 - 5 - 5;
            y = 40 - 7;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,500,360);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new FengLuList();
         this.giftList.listWidth = 500 - 10;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
      }
   }
}

