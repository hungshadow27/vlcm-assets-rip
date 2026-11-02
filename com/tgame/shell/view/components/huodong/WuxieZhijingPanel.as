package com.tgame.shell.view.components.huodong
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   
   public class WuxieZhijingPanel extends FPanel
   {
      
      public static const UI_WUXIEZHIJING_CLICK:String = "UI_WUXIEZHIJING_CLICK";
      
      public static const UI_WUPIN_OPTION_PANEL_DRAG_START:String = "UI_WUPIN_OPTION_PANEL_DRAG_START";
      
      public static const UI_WUPINE_OPTION_PANEL_STONE_CLICK:String = "UI_WUPINE_OPTION_PANEL_STONE_CLICK";
      
      public static const UI_WUPIN_OPTION_PANEL_DRAG_ENTER:String = "UI_WUPIN_OPTION_PANEL_DRAG_ENTER";
      
      private var _listArr1:Array = new Array();
      
      private var bit1:Bitmap;
      
      private var bit2:Bitmap;
      
      private var bg:Bitmap;
      
      private var ft1:FTextArea;
      
      private var bg9:F9GridBitmap;
      
      private var AcquiredDesignationTxt:FTextArea;
      
      private var selectBtn1:FSimpleButton;
      
      private var Scroll1:FVScorllBar;
      
      private var listContainer1:FCanvas;
      
      private var selectList1:FList;
      
      private var ft3:FTextArea;
      
      private var btnOK:SecondButton;
      
      private var gg:Goods;
      
      private var ifItem1:ItemFace;
      
      private var ifItem2:ItemFace;
      
      private var item:ItemFace;
      
      private var stoneContainer:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var arr:Array;
      
      private var tip:FTextArea;
      
      private var tf:TextFormat;
      
      private var ScrollPd1:Boolean = true;
      
      public function WuxieZhijingPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 261;
         height = 316;
         titleText = LanResManager.getLanCommonTextWords("无邪之境");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         var _loc1_:Bitmap = new Bitmap();
         _loc1_.name = "ui.huodong.wuxiezhijing.ui";
         addChild(_loc1_);
         _loc1_.x = 10;
         _loc1_.y = 2;
         var _loc2_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc2_.push(_loc1_);
         this.DynamicManageImages = _loc2_;
         this.setUI();
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_WUPIN_OPTION_PANEL_DRAG_ENTER));
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.stoneContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.stoneContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            dispatchEvent(new BaseEvent(UI_WUPIN_OPTION_PANEL_DRAG_START,"",this.currItem));
            this.stoneContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function setUI() : void
      {
         this.bit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bit1.x = 50;
         this.bit1.y = 35;
         addChild(this.bit1);
         this.bit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bit2.x = 173;
         this.bit2.y = 35;
         addChild(this.bit2);
         this.stoneContainer = new Sprite();
         addChild(this.stoneContainer);
         this.stoneContainer.x = 0;
         this.stoneContainer.y = 0;
         with(this.stoneContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,241,86);
            endFill();
         }
         this.stoneContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.stoneContainer.addEventListener(MouseEvent.CLICK,this.onClicks);
         this.ft1 = new FTextArea();
         this.ft1.x = 24;
         this.ft1.y = 105;
         this.ft1.width = 100;
         this.ft1.height = 25;
         this.ft1.textColor = StaticValue.WHITE;
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("商城价值评估");
         addChild(this.ft1);
         this.ft3 = new FTextArea();
         this.ft3.x = 24;
         this.ft3.y = 165;
         this.ft3.width = 150;
         this.ft3.height = 25;
         this.ft3.textColor = StaticValue.WHITE;
         this.ft3.htmlText = LanResManager.getLanCommonTextWords("可获得：");
         addChild(this.ft3);
         this.AcquiredDesignationTxt = new FTextArea();
         with(this.AcquiredDesignationTxt)
         {
            x = 155;
            y = 103;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.AcquiredDesignationTxt);
         this.selectBtn1 = new FSimpleButton();
         this.selectBtn1.skin = "bottomButton";
         addChild(this.selectBtn1);
         this.selectBtn1.x = 218;
         this.selectBtn1.y = 103;
         this.selectBtn1.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer1 = new FCanvas();
         this.listContainer1.skin = "backGroud";
         this.listContainer1.width = 90;
         this.listContainer1.height = 100;
         this.listContainer1.x = 150;
         this.listContainer1.y = 121;
         addChild(this.listContainer1);
         this.listContainer1.visible = false;
         this.Scroll1 = new FVScorllBar(this.listContainer1,100);
         addChild(this.Scroll1);
         this.Scroll1.x = 220;
         this.Scroll1.y = 119;
         this.Scroll1.visible = false;
         this.selectList1 = new FList();
         this.selectList1.skin = "list";
         this.selectList1.listWidth = 72;
         this.selectList1.x = 0;
         this.selectList1.y = 0;
         this.selectList1.itemRenderer = new StrengthenListRender();
         this.Scroll1.update();
         this.listContainer1.addChild(this.selectList1);
         this.selectList1.addEventListener(MouseEvent.CLICK,this.onSelect1);
         this.btnOK = new SecondButton();
         this.btnOK.x = 100;
         this.btnOK.y = 250;
         this.btnOK.label = LanResManager.getLanCommonTextWords("兑换");
         this.btnOK.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnOK);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.selectList1.selectItem == null)
         {
            return;
         }
         dispatchEvent(new BaseEvent(UI_WUXIEZHIJING_CLICK,"",this.selectList1.selectItem.id));
         this.setNull();
      }
      
      private function onClicks(param1:MouseEvent) : void
      {
         this.setNull();
         if(param1.target is ItemFace)
         {
            dispatchEvent(new BaseEvent(UI_WUPINE_OPTION_PANEL_STONE_CLICK));
            return;
         }
      }
      
      public function showSelectList(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.selectBtn1:
               this.listContainer1.visible = !this.listContainer1.visible;
               if(this.selectList1.numChildren > 6)
               {
                  this.Scroll1.visible = this.listContainer1.visible;
               }
               else
               {
                  this.Scroll1.visible = false;
               }
               if(this.ScrollPd1)
               {
                  this.Scroll1.update();
                  this.ScrollPd1 = false;
               }
         }
      }
      
      public function onSelect1(param1:MouseEvent) : void
      {
         var _loc2_:Goods = null;
         switch(param1.currentTarget)
         {
            case this.selectList1:
               this.AcquiredDesignationTxt.text = this.selectList1.selectItem.label;
               this.listContainer1.visible = false;
               this.Scroll1.visible = false;
               this.ft3.htmlText = LanResManager.getLanCommonTextWords("可获得：") + this.selectList1.selectItem.count + "  " + LanResManager.getLanCommonTextWords("个");
               this.AcquiredDesignationTxt.htmlText = this.selectList1.selectItem.name;
               this.ft1.htmlText = LanResManager.getLanCommonTextWords("价值：") + this.selectList1.selectItem.yb;
               _loc2_ = new Goods(this.selectList1.selectItem.id);
               this.gg = _loc2_;
               this.setGoods2(_loc2_);
         }
      }
      
      public function setGoods2(param1:Goods = null) : void
      {
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            this.ifItem1.parent.removeChild(this.ifItem1);
         }
         if(param1 == null)
         {
            return;
         }
         this.ifItem1 = new ItemFace(param1);
         this.ifItem1.x = 173 + 2;
         this.ifItem1.y = 35 + 2;
         addChild(this.ifItem1);
      }
      
      public function SetInitializeUi(param1:Array) : void
      {
         var _loc5_:Object = null;
         if(param1.length <= 0)
         {
            return;
         }
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc5_ = new Object();
            _loc5_.label = param1[_loc3_].name;
            _loc5_.name = param1[_loc3_].name;
            _loc5_.id = param1[_loc3_].id;
            _loc5_.count = param1[_loc3_].count;
            _loc5_.yb = param1[_loc3_].yb;
            _loc2_.push(_loc5_);
            _loc3_++;
         }
         this.AcquiredDesignationTxt.text = _loc2_[0].name;
         this.selectList1.dataProvider = _loc2_;
         this.selectList1.setSelectItemByIndex(0);
         var _loc4_:Goods = new Goods(_loc2_[0].id);
         this.setGoods2(_loc4_);
         this.ft3.htmlText = LanResManager.getLanCommonTextWords("可获得：") + _loc2_[0].count + "  " + LanResManager.getLanCommonTextWords("个");
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("价值：") + _loc2_[0].yb;
         if(this.ScrollPd1 == false)
         {
            if(_loc2_.length > 6)
            {
               this.Scroll1.update();
               this.Scroll1.visible = this.listContainer1.visible;
            }
            else
            {
               this.Scroll1.update();
            }
         }
         this._listArr1 = _loc2_;
         this.listContainer1.height = _loc2_.length * 20 + 5;
      }
      
      public function setGoods1(param1:Goods = null) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         if(param1 == null)
         {
            return;
         }
         this.item = new ItemFace(param1);
         this.stoneContainer.addChild(this.item);
         this.item.x = 50 + 2;
         this.item.y = 35 + 2;
      }
      
      public function setNull() : void
      {
         this.AcquiredDesignationTxt.htmlText = "";
         this.ft1.textColor = StaticValue.WHITE;
         this.ft1.htmlText = LanResManager.getLanCommonTextWords("商城价值评估");
         this.ft3.textColor = StaticValue.WHITE;
         this.ft3.htmlText = LanResManager.getLanCommonTextWords("可获得：");
         this.listContainer1.visible = false;
         this.selectList1.dataProvider = [];
         this.listContainer1.addChild(this.selectList1);
         if(this.selectList1.dataProvider == null)
         {
            this.Scroll1.visible = false;
         }
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            this.ifItem1.parent.removeChild(this.ifItem1);
         }
         this.setGoods1();
      }
   }
}

