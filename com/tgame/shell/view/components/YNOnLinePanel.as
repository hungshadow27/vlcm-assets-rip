package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.ynOnline.YNonlineRender;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class YNOnLinePanel extends FPanel
   {
      
      public static const UI_YNONLINE_CLICK:String = "UI_YNONLINE_CLICK";
      
      private var ft:FTextArea;
      
      private var list:FList;
      
      private var spContainer:Sprite;
      
      private var scroll:FVScorllBar;
      
      private var ftTime:FTextArea;
      
      private var ftDesc:FTextArea;
      
      private var ftRemark:FTextArea;
      
      private var bg:DisplayObject;
      
      public function YNOnLinePanel()
      {
         super();
         width = 418;
         height = 390 + 120;
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("在线领奖");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynonline/online5.swf");
         this.bg.x = 9;
         this.bg.y = 1;
         addChild(this.bg);
         this.ftDesc = new FTextArea();
         this.ftDesc.x = 20;
         this.ftDesc.y = 10;
         this.ftDesc.width = 375;
         this.ftDesc.wordWrap = true;
         this.ftDesc.height = 80;
         addChild(this.ftDesc);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 82;
         this.ft.width = 280;
         this.ft.height = 20;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前在线时间：") + "</font>";
         addChild(this.ft);
         this.ftTime = new FTextArea();
         this.ftTime.x = 120;
         this.ftTime.y = 82;
         this.ftTime.width = 280;
         this.ftTime.height = 20;
         this.ftTime.textColor = StaticValue.ORANGE;
         this.ftTime.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>X小时X分</font>";
         addChild(this.ftTime);
         this.ftRemark = new FTextArea();
         this.ftRemark.x = 20;
         this.ftRemark.y = 290 + 120;
         this.ftRemark.width = 280;
         this.ftRemark.height = 60;
         this.ftRemark.wordWrap = true;
         this.ftRemark.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'></font>";
         addChild(this.ftRemark);
         this.spContainer = new Sprite();
         this.spContainer.x = 12;
         this.spContainer.y = 100;
         with(this.spContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,395,305);
            endFill();
         }
         addChild(this.spContainer);
         this.list = new FList();
         this.list.itemRenderer = new YNonlineRender();
         this.list.x = 0;
         this.list.y = 0;
         this.list.listWidth = 395;
         this.list.listHeight = 184;
         this.list.skin = "list";
         this.spContainer.addChild(this.list);
         this.scroll = new FVScorllBar(this.spContainer,305);
         this.scroll.x = 390;
         this.scroll.y = 100;
      }
      
      public function setData(param1:String, param2:int, param3:Array, param4:String) : void
      {
         YNonlineRender.$parent = this;
         this.ftDesc.htmlText = param1;
         this.ftTime.htmlText = int(param2 / 60 / 60 % 24) + LanResManager.getLanCommonTextWords("小时") + int(param2 / 60 % 60) + LanResManager.getLanCommonTextWords("分钟");
         this.list.dataProvider = param3;
         this.ftRemark.htmlText = param4;
         if(param3.length <= 3)
         {
            this.list.listWidth = 395;
         }
         else
         {
            this.list.listWidth = 395;
         }
      }
   }
}

