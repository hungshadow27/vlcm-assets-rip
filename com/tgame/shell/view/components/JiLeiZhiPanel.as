package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.jileizhi.JiLeiZhiRender;
   import flash.display.Sprite;
   
   public class JiLeiZhiPanel extends FPanel
   {
      
      public static const UI_JILEIZHI_DUIHUAN_CLICK:String = "UI_JILEIZHI_DUIHUAN_CLICK";
      
      private var jileizhi:FTextArea;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var miaoshu:FTextArea;
      
      private var beizhu:FTextArea;
      
      private var arr:Array;
      
      private var fc1:FCanvas;
      
      public function JiLeiZhiPanel()
      {
         this.arr = [];
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 640;
         height = 469 + 60;
         titleText = LanResManager.getLanCommonTextWords("积累值");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.fc1 = new FCanvas();
         this.fc1.x = 10;
         this.fc1.y = 58 + 80 - 1;
         this.fc1.width = 585 + 34;
         this.fc1.height = 340 - 80 - 8 + 12;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.jileizhi = new FTextArea();
         this.jileizhi.filters = StaticValue.filter;
         this.jileizhi.width = 260;
         this.jileizhi.height = 25;
         this.jileizhi.x = 120 + 250;
         this.jileizhi.y = 406 + 60;
         addChild(this.jileizhi);
         this.jileizhi.htmlText = "<font size = \'15\' color=\'" + StaticValue.GREEN_HTML + "\'></font>";
         this.miaoshu = new FTextArea();
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.filters = StaticValue.filter;
         this.miaoshu.width = 600;
         this.miaoshu.height = 112;
         this.miaoshu.x = 120 - 100;
         this.miaoshu.y = 18;
         addChild(this.miaoshu);
         this.miaoshu.htmlText = "<font size = \'15\' color=\'" + StaticValue.GREEN_HTML + "\'></font>";
         this.beizhu = new FTextArea();
         this.beizhu.multiline = true;
         this.beizhu.wordWrap = true;
         this.beizhu.filters = StaticValue.filter;
         this.beizhu.width = 600;
         this.beizhu.height = 50;
         this.beizhu.x = 120 - 80;
         this.beizhu.y = 406;
         addChild(this.beizhu);
         this.beizhu.htmlText = "<font size = \'15\' color=\'" + StaticValue.GREEN_HTML + "\'></font>";
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 10;
            y = 30 + 30 + 80;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,620 - 35,340 - 80);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new JiLeiZhiRender();
         JiLeiZhiRender.$parent = this;
         this.giftList.listWidth = 604;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.Scroll = new FVScorllBar(this.listContainer,340 - 80);
         addChild(this.Scroll);
         this.Scroll.x = 640 + 30 - 54 - 1 - 2;
         this.Scroll.y = -1 + 30 + 30 + 80;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:int, param2:XML, param3:String, param4:String) : void
      {
         this.giftList.dataProvider = param2;
         this.Scroll.update();
         this.jileizhi.htmlText = "<font size = \'15\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前积累值：") + " " + param1 + "</font>";
         this.miaoshu.htmlText = "<font size = \'15\' color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + "</font>";
         this.beizhu.htmlText = "<font size = \'15\' color=\'" + StaticValue.GREEN_HTML + "\'>" + param4 + "</font>";
      }
   }
}

