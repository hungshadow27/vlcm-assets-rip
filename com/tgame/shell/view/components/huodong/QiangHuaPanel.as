package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class QiangHuaPanel extends FPanel
   {
      
      public static const UI_QIANGHUA_CLICK:String = "UI_QIANGHUA_CLICK";
      
      private var ft:FTextArea;
      
      private var succFta:FTextArea;
      
      private var jiaChengFta:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var miaoshuFta:FTextArea;
      
      private var itemSpr1:Sprite;
      
      private var itemSpr2:Sprite;
      
      private var dataArr:Array;
      
      private var itemsContainer:Sprite;
      
      private var select:MovieClip;
      
      private var selectId:int;
      
      private var jiantouBmp:Bitmap;
      
      private var bmp:Bitmap;
      
      private var box:FCanvas;
      
      public function QiangHuaPanel()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 280;
         height = 330;
         titleText = LanResManager.getLanCommonTextWords("强化");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function init() : void
      {
         this.box = new FCanvas();
         this.box.skin = "box_transparence";
         addChild(this.box);
         this.box.width = 260;
         this.box.height = 170;
         this.box.x = 10;
         this.box.y = 0;
         this.box = new FCanvas();
         this.box.skin = "backGroud";
         addChild(this.box);
         this.box.width = 260;
         this.box.height = 85;
         this.box.x = 10;
         this.box.y = 170;
         this.miaoshuFta = new FTextArea();
         this.miaoshuFta.x = 30;
         this.miaoshuFta.y = 180;
         this.miaoshuFta.width = 250;
         this.miaoshuFta.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("选择不同的方式可以对装备进行养成") + "</font>";
         this.miaoshuFta.wordWrap = true;
         addChild(this.miaoshuFta);
         this.ft = new FTextArea();
         this.ft.x = 70 - 15;
         this.ft.y = 10;
         this.ft.width = 85;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前装备") + "</font>";
         addChild(this.ft);
         this.bmp = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.bmp);
         this.bmp.x = 80 - 15;
         this.bmp.y = 30;
         this.itemSpr1 = new Sprite();
         this.itemSpr1.x = this.bmp.x + 2;
         this.itemSpr1.y = this.bmp.y + 2;
         addChild(this.itemSpr1);
         this.ft = new FTextArea();
         this.ft.x = 170;
         this.ft.y = 10;
         this.ft.width = 85;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("强化后装备") + "</font>";
         addChild(this.ft);
         this.bmp = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.bmp);
         this.bmp.x = 180;
         this.bmp.y = 30;
         this.itemSpr2 = new Sprite();
         this.itemSpr2.x = this.bmp.x + 2;
         this.itemSpr2.y = this.bmp.y + 2;
         addChild(this.itemSpr2);
         this.jiantouBmp = StaticValue.getBitmapByClassName("ui.duanzhao.jiantou");
         this.jiantouBmp.x = 130 - 10;
         this.jiantouBmp.y = 40;
         addChild(this.jiantouBmp);
         this.succFta = new FTextArea();
         this.succFta.x = 30;
         this.succFta.y = 100;
         this.succFta.width = 325;
         this.succFta.wordWrap = true;
         addChild(this.succFta);
         this.jiaChengFta = new FTextArea();
         this.jiaChengFta.x = 30;
         this.jiaChengFta.y = 125;
         this.jiaChengFta.width = 325;
         this.jiaChengFta.wordWrap = true;
         addChild(this.jiaChengFta);
         this.itemsContainer = new Sprite();
         this.itemsContainer.x = 65;
         this.itemsContainer.y = 205;
         addChild(this.itemsContainer);
         this.okBtn = new SecondButton();
         this.okBtn.x = 120;
         this.okBtn.y = 285 - 20;
         this.okBtn.label = LanResManager.getLanCommonTextWords("打造");
         addChild(this.okBtn);
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.dispatchEvent(new BaseEvent(UI_QIANGHUA_CLICK,"",this.selectId));
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         this.selectId = int(_loc2_.name);
         this.setItem(this.selectId);
      }
      
      public function setItem(param1:int = 0) : void
      {
         if(this.select != null && this.select.parent != null)
         {
            this.select.parent.removeChild(this.select);
         }
         this.select = StaticValue.getMCByClassName("ui.skill.default") as MovieClip;
         addChild(this.select);
         this.select.x = this.itemsContainer.x + 60 * this.selectId;
         this.select.y = this.itemsContainer.y;
         this.select.mouseEnabled = false;
         this.select.mouseChildren = false;
         this.succFta.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率：") + this.dataArr[this.selectId].jilv + "%</font>";
         this.jiaChengFta.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次强化可增加：") + this.dataArr[this.selectId].jiacheng + "</font>";
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setData(param1:int, param2:int, param3:Array) : void
      {
         this.setGoods(new Goods(param1),new Goods(param2));
         this.setGoodsArr(param3);
      }
      
      public function setGoods(param1:Goods = null, param2:Goods = null) : void
      {
         var _loc3_:ItemFace = null;
         if(this.itemSpr1 != null && this.itemSpr1.numChildren > 0)
         {
            while(this.itemSpr1.numChildren > 0)
            {
               this.itemSpr1.removeChildAt(0);
            }
         }
         if(this.itemSpr2 != null && this.itemSpr2.numChildren > 0)
         {
            while(this.itemSpr2.numChildren > 0)
            {
               this.itemSpr2.removeChildAt(0);
            }
         }
         if(param1 != null)
         {
            _loc3_ = new ItemFace(param1);
            this.itemSpr1.addChild(_loc3_);
         }
         if(param2 != null)
         {
            _loc3_ = new ItemFace(param2);
            _loc3_.removeListener();
            this.itemSpr2.addChild(_loc3_);
         }
      }
      
      public function setGoodsArr(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.itemsContainer.numChildren > 0)
         {
            this.itemsContainer.removeChildAt(0);
         }
         this.dataArr = param1;
         var _loc2_:* = 0;
         while(_loc2_ < this.dataArr.length)
         {
            _loc3_ = new Goods(this.dataArr[_loc2_].id);
            _loc3_.count = this.dataArr[_loc2_].count;
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.x = 60 * _loc2_;
            _loc4_.name = String(_loc2_);
            this.itemsContainer.addChild(_loc4_);
            _loc4_.addEventListener(MouseEvent.CLICK,this.onItemClick);
            _loc2_++;
         }
         this.itemsContainer.x = (260 - this.itemsContainer.width) / 2;
         this.selectId = this.dataArr.length - 1;
         this.setItem(this.selectId);
      }
   }
}

