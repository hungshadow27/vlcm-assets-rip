package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class AnqiActivationHuodong extends FPanel
   {
      
      public static const UI_DONGXIAOACTIVATIONHUODONG_YOUHUIKAIQI_CLICK:String = "UI_DONGXIAOACTIVATIONHUODONG_YOUHUIKAIQI_CLICK";
      
      public var $parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var img:Bitmap;
      
      private var img1:Bitmap;
      
      private var lb:FLabel;
      
      private var btn:SecondButton;
      
      private var item1:ItemFace;
      
      private var item2:ItemFace;
      
      private var lb1:FLabel;
      
      private var lb2:FLabel;
      
      private var lb3:FLabel;
      
      public function AnqiActivationHuodong()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 425;
         height = 200;
         titleText = LanResManager.getLanTextWords(AnqiActivation,"暗器激活");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 310;
            height = 175;
            wordWrap = true;
            x = 10;
            y = 3;
            filters = StaticValue.filter;
         }
         addChild(this.ft);
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            width = 50;
            height = 40;
            x = 270;
            y = 37;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
         }
         addChild(this.lb1);
         this.lb2 = new FLabel();
         with(this.lb2)
         {
            width = 50;
            height = 40;
            x = 347;
            y = 37;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
         }
         addChild(this.lb2);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("立即优惠开启");
         addChild(this.btn);
         this.btn.x = 279;
         this.btn.y = 103;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch((param1.target as SecondButton).label)
         {
            case LanResManager.getLanCommonTextWords("立即优惠开启"):
               this.$parent.dispatchEvent(new BaseEvent(AnqiActivation.UI_ANQIACTIVATIONHUODONG_YOUHUIKAIQI_CLICK));
               break;
            case LanResManager.getLanCommonTextWords("立即开启"):
               dispatchEvent(new BaseEvent(UI_DONGXIAOACTIVATIONHUODONG_YOUHUIKAIQI_CLICK));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function setAQInit() : void
      {
         titleText = LanResManager.getLanTextWords(AnqiActivation,"暗器激活");
         this.ft.htmlText = LanResManager.getLanTextWords(this,"活动期间暗器激活",[StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,StaticValue.SKY_BLUE_HTML,StaticValue.SKY_BLUE_HTML,StaticValue.GREEN_HTML]);
         this.lb1.text = LanResManager.getLanCommonTextWords("暗灵石");
         this.lb2.text = LanResManager.getLanCommonTextWords("木耙");
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 270;
         this.img.y = 55;
         this.img1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img1);
         this.img1.x = 340;
         this.img1.y = 55;
         this.btn.label = LanResManager.getLanCommonTextWords("立即优惠开启");
         this.btn.y = 100;
      }
      
      public function setDXInit() : void
      {
         titleText = LanResManager.getLanCommonTextWords("洞箫激活");
         this.ft.htmlText = LanResManager.getLanTextWords(this,"活动期间如果您的洞箫为顶级白金长箫并且如果您的背包中拥有一颗",[StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML,StaticValue.SKY_BLUE_HTML,StaticValue.GREEN_HTML]);
         this.lb1.x = 280;
         this.lb1.y = 37;
         this.lb1.text = LanResManager.getLanCommonTextWords("洞箫激活石");
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 300 + 15;
         this.img.y = 55;
         this.btn.label = LanResManager.getLanCommonTextWords("立即开启");
         this.btn.x = 279 + 20;
         this.btn.y = 103 + 5;
      }
      
      public function setInitialize(param1:Goods, param2:int, param3:Goods, param4:int) : void
      {
         this.setAQInit();
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         this.item1 = new ItemFace(param1);
         this.item1.x = 272;
         this.item1.y = 57;
         addChild(this.item1);
         if(param2 == 0)
         {
            this.item1.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.item1.filters = [];
         }
         if(this.item2 != null && this.item2.parent != null)
         {
            this.item2.parent.removeChild(this.item2);
         }
         this.item2 = new ItemFace(param3);
         this.item2.x = 342;
         this.item2.y = 57;
         addChild(this.item2);
         if(param4 == 0)
         {
            this.item2.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.item2.filters = [];
         }
      }
      
      public function setDXInitialize(param1:Goods, param2:int) : void
      {
         this.setDXInit();
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         this.item1 = new ItemFace(param1);
         this.item1.x = 302 + 15;
         this.item1.y = 57;
         addChild(this.item1);
         if(param2 == 0)
         {
            this.item1.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.item1.filters = [];
         }
      }
   }
}

