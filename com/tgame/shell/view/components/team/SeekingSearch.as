package com.tgame.shell.view.components.team
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class SeekingSearch extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var lb:FLabel;
      
      private var listContainer:FCanvas;
      
      private var countList:FList;
      
      private var scroll:FVScorllBar;
      
      private var count:FLabel;
      
      private var selectBtn:FSimpleButton;
      
      private var listContainer2:FCanvas;
      
      private var countList2:FList;
      
      private var scroll2:FVScorllBar;
      
      private var count2:FLabel;
      
      private var selectBtn2:FSimpleButton;
      
      private var listContainer3:FCanvas;
      
      private var countList3:FList;
      
      private var scroll3:FVScorllBar;
      
      private var count3:FLabel;
      
      private var selectBtn3:FSimpleButton;
      
      private var listContainer4:FCanvas;
      
      private var countList4:FList;
      
      private var scroll4:FVScorllBar;
      
      private var count4:FLabel;
      
      private var selectBtn4:FSimpleButton;
      
      private var listContainer5:Sprite;
      
      private var giftList5:FList;
      
      private var Scroll5:FVScorllBar;
      
      private var searchBtn:SecondButton;
      
      private var checkBox1:FCheckBox;
      
      private var checkBox2:FCheckBox;
      
      public function SeekingSearch()
      {
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.marriage.seeking.search.ui";
         this.init();
      }
      
      private function init() : void
      {
         var ar:Array;
         var i:int;
         var o:Object = null;
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 63;
            y = 9;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.lb.text = LanResManager.getLanTextWords(this,"性别");
         addChild(this.lb);
         this.count = new FLabel();
         with(this.count)
         {
            x = 100;
            y = 9;
            textColor = StaticValue.WHITE;
         }
         this.count.text = LanResManager.getLanTextWords(this,"不限");
         addChild(this.count);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         addChild(this.listContainer);
         this.listContainer.x = 96;
         this.listContainer.y = 27;
         this.listContainer.visible = false;
         this.countList = new FList();
         this.countList.listWidth = 30;
         this.countList.x = 3;
         this.countList.y = 2;
         this.countList.dataProvider = XML(LanResManager.getLanTextWords(this,"xml数据"));
         this.listContainer.addChild(this.countList);
         this.countList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.listContainer.width = this.countList.width + 6;
         this.listContainer.height = 78;
         this.scroll = new FVScorllBar(this.countList,74);
         this.listContainer.addChild(this.scroll);
         this.scroll.x = this.countList.x + this.countList.width + 4;
         this.scroll.y = 2;
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 130;
         this.selectBtn.y = 7;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 153;
            y = 9;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.lb.text = LanResManager.getLanTextWords(this,"年龄");
         addChild(this.lb);
         this.count2 = new FLabel();
         with(this.count2)
         {
            x = 190;
            y = 9;
            textColor = StaticValue.WHITE;
         }
         this.count2.text = LanResManager.getLanTextWords(this,"不限");
         addChild(this.count2);
         this.listContainer2 = new FCanvas();
         this.listContainer2.skin = "backGroud";
         addChild(this.listContainer2);
         this.listContainer2.x = 186;
         this.listContainer2.y = 27;
         this.listContainer2.visible = false;
         this.countList2 = new FList();
         this.countList2.listWidth = 30;
         this.countList2.x = 3;
         this.countList2.y = 2;
         this.listContainer2.addChild(this.countList2);
         this.countList2.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.listContainer2.width = this.countList2.width + 6;
         this.listContainer2.height = 78;
         this.scroll2 = new FVScorllBar(this.countList2,74);
         this.listContainer2.addChild(this.scroll2);
         this.scroll2.x = this.countList2.x + this.countList2.width + 4;
         this.scroll2.y = 2;
         this.selectBtn2 = new FSimpleButton();
         this.selectBtn2.skin = "bottomButton";
         addChild(this.selectBtn2);
         this.selectBtn2.x = 220;
         this.selectBtn2.y = 7;
         this.selectBtn2.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 243;
            y = 9;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.lb.text = LanResManager.getLanTextWords(this,"所在省");
         addChild(this.lb);
         this.count3 = new FLabel();
         with(this.count3)
         {
            x = 290;
            y = 9;
            textColor = StaticValue.WHITE;
         }
         this.count3.text = LanResManager.getLanTextWords(this,"不限");
         addChild(this.count3);
         this.listContainer3 = new FCanvas();
         this.listContainer3.skin = "backGroud";
         addChild(this.listContainer3);
         this.listContainer3.x = 286;
         this.listContainer3.y = 27;
         this.listContainer3.visible = false;
         this.countList3 = new FList();
         this.countList3.listWidth = 40;
         this.countList3.x = 3;
         this.countList3.y = 2;
         this.listContainer3.addChild(this.countList3);
         this.countList3.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.listContainer3.width = this.countList3.width + 6;
         this.listContainer3.height = 78;
         this.scroll3 = new FVScorllBar(this.countList3,74);
         this.listContainer3.addChild(this.scroll3);
         this.scroll3.x = this.countList3.x + this.countList3.width + 4;
         this.scroll3.y = 2;
         this.selectBtn3 = new FSimpleButton();
         this.selectBtn3.skin = "bottomButton";
         addChild(this.selectBtn3);
         this.selectBtn3.x = 330;
         this.selectBtn3.y = 7;
         this.selectBtn3.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 353;
            y = 9;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.lb.text = LanResManager.getLanTextWords(this,"等级");
         addChild(this.lb);
         this.count4 = new FLabel();
         with(this.count4)
         {
            x = 390;
            y = 9;
            textColor = StaticValue.WHITE;
         }
         this.count4.text = LanResManager.getLanTextWords(this,"不限");
         addChild(this.count4);
         this.listContainer4 = new FCanvas();
         this.listContainer4.skin = "backGroud";
         addChild(this.listContainer4);
         this.listContainer4.x = 386;
         this.listContainer4.y = 27;
         this.listContainer4.visible = false;
         this.countList4 = new FList();
         this.countList4.listWidth = 30;
         this.countList4.x = 3;
         this.countList4.y = 2;
         this.listContainer4.addChild(this.countList4);
         this.countList4.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.listContainer4.width = this.countList4.width + 6;
         this.listContainer4.height = 78;
         this.scroll4 = new FVScorllBar(this.countList4,74);
         this.listContainer4.addChild(this.scroll4);
         this.scroll4.x = this.countList4.x + this.countList4.width + 4;
         this.scroll4.y = 2;
         this.selectBtn4 = new FSimpleButton();
         this.selectBtn4.skin = "bottomButton";
         addChild(this.selectBtn4);
         this.selectBtn4.x = 420;
         this.selectBtn4.y = 7;
         this.selectBtn4.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.searchBtn = new SecondButton();
         this.searchBtn.label = LanResManager.getLanTextWords(this,"搜索");
         addChild(this.searchBtn);
         this.searchBtn.x = 470;
         this.searchBtn.y = 5;
         this.searchBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.checkBox1 = new FCheckBox();
         addChild(this.checkBox1);
         this.checkBox1.x = 10;
         this.checkBox1.y = 319;
         this.checkBox1.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 35;
            y = 321;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.lb.text = LanResManager.getLanTextWords(this,"屏蔽已婚人士");
         addChild(this.lb);
         this.checkBox2 = new FCheckBox();
         addChild(this.checkBox2);
         this.checkBox2.x = 10;
         this.checkBox2.y = 340;
         this.checkBox2.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 35;
            y = 342;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.lb.text = LanResManager.getLanTextWords(this,"不要将我显示在本列表");
         addChild(this.lb);
         this.listContainer5 = new Sprite();
         addChild(this.listContainer5);
         with(this.listContainer5)
         {
            x = 187;
            y = 34;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,365,275);
            graphics.endFill();
         }
         this.giftList5 = new FList();
         this.giftList5.skin = "list";
         this.giftList5.itemRenderer = new SeekingSearchListRender();
         this.giftList5.listWidth = 360;
         this.listContainer5.addChild(this.giftList5);
         this.giftList5.x = 0;
         this.giftList5.y = 0;
         ar = new Array();
         i = 10;
         while(i < 5)
         {
            o = new Object();
            o.name = i;
            ar.push(o);
            i++;
         }
         this.giftList5.dataProvider = ar;
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.countList:
               this.count.text = this.countList.selectItem.label;
               this.listContainer.visible = false;
               this.count.text = this.countList.selectItem.label;
               break;
            case this.countList2:
               this.count2.text = this.countList2.selectItem.label;
               this.listContainer2.visible = false;
               this.count2.text = this.countList2.selectItem.label;
               break;
            case this.countList3:
               this.count3.text = this.countList3.selectItem.label;
               this.listContainer3.visible = false;
               this.count3.text = this.countList3.selectItem.label;
               break;
            case this.countList4:
               this.count4.text = this.countList4.selectItem.label;
               this.listContainer4.visible = false;
               this.count4.text = this.countList4.selectItem.label;
         }
      }
      
      private function onShowList(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.selectBtn:
               this.listContainer.visible = !this.listContainer.visible;
               break;
            case this.selectBtn2:
               this.listContainer2.visible = !this.listContainer2.visible;
               break;
            case this.selectBtn3:
               this.listContainer3.visible = !this.listContainer3.visible;
               break;
            case this.selectBtn4:
               this.listContainer4.visible = !this.listContainer4.visible;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.searchBtn:
         }
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.checkBox1:
            case this.checkBox2:
         }
      }
   }
}

