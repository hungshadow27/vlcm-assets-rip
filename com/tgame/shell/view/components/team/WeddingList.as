package com.tgame.shell.view.components.team
{
   import com.fireice.list.FList;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class WeddingList extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var prePageBtn:SmallButton;
      
      private var nextPageBtn:SmallButton;
      
      private var pageCount:FTextArea;
      
      private var hunyanBtn:SecondButton;
      
      private var songshangBtn:SecondButton;
      
      private var lingquBtn:SecondButton;
      
      public function WeddingList()
      {
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.marriage.wedding.list.ui";
         this.init();
      }
      
      private function init() : void
      {
         var lb:FLabel = new FLabel();
         with(lb)
         {
            x = 5;
            y = 8;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"婚宴规模");
         addChild(lb);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 3;
            y = 32;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,550,260);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new WeddingListRender();
         this.giftList.listWidth = 552;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.prePageBtn = new SmallButton();
         this.prePageBtn.label = LanResManager.getLanCommonTextWords("上一页");
         addChild(this.prePageBtn);
         this.prePageBtn.x = 205;
         this.prePageBtn.y = 300;
         this.prePageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pageCount = new FTextArea();
         with(this.pageCount)
         {
            x = 250;
            y = 300;
            width = 50;
            height = 20;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            textColor = StaticValue.WHITE;
            text = "100/100";
         }
         addChild(this.pageCount);
         this.nextPageBtn = new SmallButton();
         this.nextPageBtn.label = LanResManager.getLanCommonTextWords("下一页");
         addChild(this.nextPageBtn);
         this.nextPageBtn.x = 300;
         this.nextPageBtn.y = 300;
         this.nextPageBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.hunyanBtn = new SecondButton();
         this.hunyanBtn.label = LanResManager.getLanTextWords(this,"婚宴帮助");
         addChild(this.hunyanBtn);
         this.hunyanBtn.x = 150;
         this.hunyanBtn.y = 333;
         this.hunyanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.songshangBtn = new SecondButton();
         this.songshangBtn.label = LanResManager.getLanTextWords(this,"送上红包");
         addChild(this.songshangBtn);
         this.songshangBtn.x = 250;
         this.songshangBtn.y = 333;
         this.songshangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBtn = new SecondButton();
         this.lingquBtn.label = LanResManager.getLanTextWords(this,"领取红包");
         addChild(this.lingquBtn);
         this.lingquBtn.x = 350;
         this.lingquBtn.y = 333;
         this.lingquBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.prePageBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_HUNYAN_GET_PAGE,"",1));
               break;
            case this.nextPageBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_HUNYAN_GET_PAGE,"",2));
               break;
            case this.hunyanBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_HUNYANBANGZHU_CLICK));
               break;
            case this.songshangBtn:
               if(this.giftList.selectItem)
               {
                  this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_SONGSHANGHONGBAO_CLICK,"",int(this.giftList.selectItem.number)));
               }
               break;
            case this.lingquBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_LINGQUHONGBAO_CLICK));
         }
      }
      
      public function setInitialize(param1:Array) : void
      {
         this.giftList.dataProvider = param1;
         if(param1.length == 0)
         {
            this.songshangBtn.enabled = false;
         }
         else
         {
            this.songshangBtn.enabled = true;
            this.giftList.setSelectItemByIndex(0);
         }
      }
      
      public function setPage(param1:int, param2:int) : void
      {
         this.pageCount.text = param1 + "/" + param2;
         if(param1 == 1)
         {
            this.prePageBtn.enabled = false;
         }
         else
         {
            this.prePageBtn.enabled = true;
         }
         if(param1 == param2)
         {
            this.nextPageBtn.enabled = false;
         }
         else
         {
            this.nextPageBtn.enabled = true;
         }
      }
   }
}

