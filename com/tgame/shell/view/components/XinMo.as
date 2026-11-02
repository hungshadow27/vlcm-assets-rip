package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class XinMo extends FPanel
   {
      
      private var guanbiBtn:SecondButton;
      
      private var shengyu:FTextArea;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var fc1:FCanvas;
      
      private var arr:Array;
      
      public function XinMo()
      {
         var ft2:FTextArea;
         var ft6:FTextArea;
         var ft7:FTextArea;
         var ft8:FTextArea;
         var ft9:FTextArea;
         var ft10:FTextArea;
         var ft1:FTextArea = null;
         var ft3:FTextArea = null;
         var ft4:FTextArea = null;
         var ft5:FTextArea = null;
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 15 - 5;
         this.fc1.y = 256;
         this.fc1.width = 468 + 8 + 20 - 1;
         this.fc1.height = 131 + 9;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 430 + 20 + 70 - 5;
         height = 430 + 45 - 2;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("心魔");
         this.guanbiBtn = new SecondButton();
         this.guanbiBtn.label = LanResManager.getLanCommonTextWords("关闭");
         addChild(this.guanbiBtn);
         this.guanbiBtn.x = 104 + 80 + 35;
         this.guanbiBtn.y = 334 + 70 + 10 - 3;
         this.guanbiBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         ft1 = new FTextArea();
         ft1.multiline = true;
         ft1.wordWrap = true;
         ft1.filters = StaticValue.filter;
         ft1.width = 430 - 50 + 20 + 65;
         ft1.height = 70;
         ft1.x = 25;
         ft1.y = 15;
         addChild(ft1);
         ft1.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖杀戮，怨气冲天。由此产生了一批心魔降临于各地危害苍生，愿各位侠士前去找出心魔将其击杀以捍卫武林的和平。心魔由怨气幻化而成，与常人样貌相同，需要各位侠士洞察明晰后再行动，以免错杀无辜，酿下孽缘。") + "</font>";
         ft2 = new FTextArea();
         ft2.multiline = true;
         ft2.wordWrap = true;
         ft2.filters = StaticValue.filter;
         ft2.width = 150;
         ft2.x = 25;
         ft2.y = 15 + 90 - 20;
         addChild(ft2);
         ft2.htmlText = "<font size = \'15\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("心魔玩法：") + "</font>";
         ft3 = new FTextArea();
         ft3.multiline = true;
         ft3.wordWrap = true;
         ft3.filters = StaticValue.filter;
         ft3.width = 430 - 50 + 20 + 60;
         ft3.height = 70;
         ft3.x = 25;
         ft3.y = 15 + 90 + 20 - 20;
         addChild(ft3);
         ft3.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每天10：00-22：00每隔一个小时将会在随机线路的随机地图中的随机地点刷出5只心魔，心魔与玩家外形一致，但将其击杀后将获得大量的珍贵道具羽灵。而与心魔名称相同的玩家击杀了自己的心魔后将会获得五倍的羽灵！") + "</font>";
         ft4 = new FTextArea();
         ft4.multiline = true;
         ft4.wordWrap = true;
         ft4.filters = StaticValue.filter;
         ft4.width = 430 - 50 + 20 + 65;
         ft4.height = 40;
         ft4.x = 25;
         ft4.y = 15 + 90 + 20 + 90 - 20 - 16;
         addChild(ft4);
         ft4.htmlText = "<font  color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("小提示：使用金蝉脱壳后，如果当前地图内有心魔存在时，分身将会进行提示。") + "</font>";
         ft5 = new FTextArea();
         ft5.multiline = true;
         ft5.wordWrap = true;
         ft5.filters = StaticValue.filter;
         ft5.width = 200;
         ft5.height = 20;
         ft5.x = 25;
         ft5.y = 15 + 90 + 20 + 90;
         addChild(ft5);
         ft5.htmlText = "<font size =\'15\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("心魔击杀记录：") + "</font>";
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.wordWrap = true;
         ft6.filters = StaticValue.filter;
         ft6.width = 100;
         ft6.height = 17;
         ft6.x = 300 + 65;
         ft6.y = 15 + 90 + 20 + 90;
         addChild(ft6);
         ft6.htmlText = "<font color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("数据每天清空一次") + "</font>";
         ft7 = new FTextArea();
         ft7.multiline = true;
         ft7.wordWrap = true;
         ft7.filters = StaticValue.filter;
         ft7.width = 100;
         ft7.height = 17;
         ft7.x = 25 + 16 + 26 - 40;
         ft7.y = 15 + 90 + 20 + 90 + 30 - 7;
         addChild(ft7);
         ft7.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("击杀时间") + "</font>";
         ft8 = new FTextArea();
         ft8.multiline = true;
         ft8.wordWrap = true;
         ft8.filters = StaticValue.filter;
         ft8.width = 100;
         ft8.height = 17;
         ft8.x = 25 + 85 + 16 + 16 - 10 + 24 - 2 + 40 - 47 - 40 + 5 + 20;
         ft8.y = 15 + 90 + 20 + 90 + 30 - 7;
         addChild(ft8);
         ft8.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("刷出地点") + "</font>";
         ft9 = new FTextArea();
         ft9.multiline = true;
         ft9.wordWrap = true;
         ft9.filters = StaticValue.filter;
         ft9.width = 100;
         ft9.height = 17;
         ft9.x = 25 + 85 + 85 + 16 + 16 + 16 - 10 - 10 + 24 + 25 - 38 + 20 - 30 + 20;
         ft9.y = 15 + 90 + 20 + 90 + 30 - 7;
         addChild(ft9);
         ft9.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' >" + LanResManager.getLanCommonTextWords("心魔名称") + "</font>";
         ft10 = new FTextArea();
         ft10.multiline = true;
         ft10.wordWrap = true;
         ft10.filters = StaticValue.filter;
         ft10.width = 100;
         ft10.height = 17;
         ft10.x = 25 + 85 + 85 + 85 + 16 + 16 + 16 + 16 - 10 - 10 - 10 - 5 + 18 + 66;
         ft10.y = 15 + 90 + 20 + 90 + 30 - 7;
         addChild(ft10);
         ft10.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("击杀者") + "</font>";
         this.shengyu = new FTextArea();
         this.shengyu.multiline = true;
         this.shengyu.wordWrap = true;
         this.shengyu.filters = StaticValue.filter;
         this.shengyu.width = 160;
         this.shengyu.height = 25;
         this.shengyu.x = 140 + 80 + 40 + 25 + 60;
         this.shengyu.y = 344 + 80 - 11;
         addChild(this.shengyu);
         this.shengyu.htmlText = "<font size = \'15\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前心魔剩余数：") + "</font>";
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 35 - 15 - 5;
            y = 265;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,345 + 20 + 15 + 60 + 10 + 19,125);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new XinMoList();
         this.giftList.listWidth = 345 + 20 + 15 + 60 + 10 + 19;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.Scroll = new FVScorllBar(this.listContainer,125);
         addChild(this.Scroll);
         this.Scroll.x = 380 + 20 + 60 + 10 + 17;
         this.Scroll.y = 265;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
      }
      
      private function onClose(param1:*) : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:Array, param2:int) : void
      {
         this.giftList.dataProvider = param1;
         this.Scroll.update();
         this.shengyu.htmlText = "<font size = \'15\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前心魔剩余数：") + param2 + "</font>";
      }
   }
}

