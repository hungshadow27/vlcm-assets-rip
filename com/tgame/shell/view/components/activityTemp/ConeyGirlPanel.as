package com.tgame.shell.view.components.activityTemp
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class ConeyGirlPanel extends FPanel
   {
      
      public static const UI_CONEYGIRLPANEL_SHOW_EQUIP:String = "UI_CONEYGIRLPANEL_SHOW_EQUIP";
      
      public static const UI_CONEYGIRLPANEL_SHOW_POINT:String = "UI_CONEYGIRLPANEL_SHOW_POINT";
      
      public static const UI_CONEYGIRLPANEL_EQUIP_PUT:String = "UI_CONEYGIRLPANEL_EQUIP_PUT";
      
      public static const UI_CONEYGIRLPANEL_EQUIP_ITEM_CLICK:String = "UI_CONEYGIRLPANEL_EQUIP_ITEM_CLICK";
      
      public static const UI_CONEYGIRLPANEL_EQUIP_START:String = "UI_CONEYGIRLPANEL_EQUIP_START";
      
      public static const UI_CONEYGIRLPANEL_POINT_PUT:String = "UI_CONEYGIRLPANEL_POINT_PUT";
      
      public static const UI_CONEYGIRLPANEL_POINT_ITEM_CLICK:String = "UI_CONEYGIRLPANEL_POINT_ITEM_CLICK";
      
      public static const UI_CONEYGIRLPANEL_POINT_START:String = "UI_CONEYGIRLPANEL_POINT_START";
      
      private var equipCanvas:EquipConvertCanvas;
      
      private var pointCanvas:PointConvertCanvas;
      
      public function ConeyGirlPanel()
      {
         super();
         skin = "sceondPanel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 307;
         height = 244;
         Title = StaticValue.getBitmapByClassName("ui.active.temp.convert.title");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.pointCanvas = new PointConvertCanvas();
         this.pointCanvas.$parent = this;
         addChild(this.pointCanvas);
         this.pointCanvas.x = 6;
         this.pointCanvas.y = 0;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.pointCanvas.bg);
         this.DynamicManageImages = _loc1_;
      }
      
      private function onTabBarClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("兑换装备"):
               this.showEquip();
               dispatchEvent(new BaseEvent(UI_CONEYGIRLPANEL_SHOW_EQUIP));
               break;
            case LanResManager.getLanCommonTextWords("兑换礼金"):
               this.showPoint();
               dispatchEvent(new BaseEvent(UI_CONEYGIRLPANEL_SHOW_POINT));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showEquip() : void
      {
         this.equipCanvas.visible = true;
         this.pointCanvas.visible = false;
      }
      
      public function setEquipConvert_item(param1:Array) : void
      {
         this.equipCanvas.setItem(param1);
      }
      
      public function showPoint() : void
      {
         this.equipCanvas.visible = false;
         this.pointCanvas.visible = true;
      }
      
      public function setPointConvert_item(param1:Array, param2:int) : void
      {
         this.pointCanvas.setItem(param1);
         this.pointCanvas.setPoint(param2);
      }
   }
}

import com.fireice.text.FLabel;
import com.fireice.text.FTextArea;
import com.tgame.common.res.lan.*;
import com.tgame.common.ui.componets.*;
import com.tgame.common.vo.item.Goods;
import com.zcp.common.events.BaseEvent;
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.*;

class EquipConvertCanvas extends Sprite
{
   
   public var $parent:DisplayObject;
   
   public var bg:Bitmap;
   
   private var putBtn:SecondButton;
   
   private var okBtn:SecondButton;
   
   private var itemContainer:Sprite;
   
   public function EquipConvertCanvas()
   {
      var ft:FTextArea;
      super();
      this.bg = new Bitmap();
      this.bg.name = "ui.active.temp.convert.ui";
      addChild(this.bg);
      this.itemContainer = new Sprite();
      addChild(this.itemContainer);
      this.itemContainer.x = 7;
      this.itemContainer.y = 69;
      this.itemContainer.addEventListener(MouseEvent.CLICK,this.onItem);
      ft = new FTextArea();
      with(ft)
      {
         autoSize = TextFieldAutoSize.LEFT;
         textColor = StaticValue.WHITE;
         filters = StaticValue.filter;
         x = 5;
         y = 5;
         htmlText = LanResManager.getLanTextWords(this,"兔女郎兑换拜年",[StaticValue.ORANGE_HTML]);
      }
      addChild(ft);
      ft = new FTextArea();
      with(ft)
      {
         autoSize = TextFieldAutoSize.LEFT;
         textColor = StaticValue.GREEN;
         filters = StaticValue.filter;
         x = 5;
         y = 120;
         htmlText = LanResManager.getLanTextWords(this,"兔女郎兑换获得");
      }
      addChild(ft);
      this.putBtn = new SecondButton();
      this.putBtn.label = LanResManager.getLanCommonTextWords("放入物品");
      addChild(this.putBtn);
      this.putBtn.x = 50;
      this.putBtn.y = 170;
      this.putBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      this.okBtn = new SecondButton();
      this.okBtn.label = LanResManager.getLanCommonTextWords("开始兑换");
      addChild(this.okBtn);
      this.okBtn.x = 295 - this.okBtn.width - 50;
      this.okBtn.y = 170;
      this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
   }
   
   private function onClick(param1:MouseEvent) : void
   {
      switch(param1.target)
      {
         case this.putBtn:
            this.$parent.dispatchEvent(new BaseEvent(ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_PUT));
            break;
         case this.okBtn:
            this.$parent.dispatchEvent(new BaseEvent(ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_START));
      }
   }
   
   private function onItem(param1:MouseEvent) : void
   {
      this.$parent.dispatchEvent(new BaseEvent(ConeyGirlPanel.UI_CONEYGIRLPANEL_EQUIP_ITEM_CLICK,"",(param1.target as ItemFace).getBaseItem()));
   }
   
   public function setItem(param1:Array) : void
   {
      var _loc2_:int = 0;
      var _loc4_:ItemFace = null;
      while(this.itemContainer.numChildren)
      {
         this.itemContainer.removeChildAt(0);
      }
      var _loc3_:int = int(param1.length);
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         _loc4_ = new ItemFace(param1[_loc2_] as Goods);
         this.itemContainer.addChild(_loc4_);
         _loc4_.x = _loc2_ * 41;
         _loc2_++;
      }
   }
}

class PointConvertCanvas extends Sprite
{
   
   public var $parent:DisplayObject;
   
   public var bg:Bitmap;
   
   private var putBtn:SecondButton;
   
   private var okBtn:SecondButton;
   
   private var itemContainer:Sprite;
   
   private var pointText:FLabel;
   
   public function PointConvertCanvas()
   {
      var ft:FTextArea;
      super();
      this.bg = new Bitmap();
      this.bg.name = "ui.active.temp.convert.ui";
      addChild(this.bg);
      this.itemContainer = new Sprite();
      addChild(this.itemContainer);
      this.itemContainer.x = 7;
      this.itemContainer.y = 89;
      this.itemContainer.addEventListener(MouseEvent.CLICK,this.onItem);
      this.pointText = new FLabel();
      with(this.pointText)
      {
         textColor = StaticValue.GREEN;
         filters = StaticValue.filter;
         x = 115;
         y = 140;
         text = "0";
      }
      addChild(this.pointText);
      ft = new FTextArea();
      with(ft)
      {
         autoSize = TextFieldAutoSize.LEFT;
         textColor = StaticValue.ORANGE;
         filters = StaticValue.filter;
         x = 5;
         y = 5;
         htmlText = LanResManager.getLanTextWords(this,"请放入您收集到的各种颜色的【兔女郎】");
      }
      addChild(ft);
      ft = new FTextArea();
      with(ft)
      {
         autoSize = TextFieldAutoSize.LEFT;
         textColor = StaticValue.GREEN;
         filters = StaticValue.filter;
         x = 5;
         y = 140;
         htmlText = LanResManager.getLanTextWords(this,"您总计将获得礼金【兔女郎】");
      }
      addChild(ft);
      this.putBtn = new SecondButton();
      this.putBtn.label = LanResManager.getLanCommonTextWords("放入物品");
      addChild(this.putBtn);
      this.putBtn.x = 50;
      this.putBtn.y = 190;
      this.putBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      this.okBtn = new SecondButton();
      this.okBtn.label = LanResManager.getLanCommonTextWords("开始兑换");
      addChild(this.okBtn);
      this.okBtn.x = 295 - this.okBtn.width - 50;
      this.okBtn.y = 190;
      this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
   }
   
   private function onClick(param1:MouseEvent) : void
   {
      switch(param1.target)
      {
         case this.putBtn:
            this.$parent.dispatchEvent(new BaseEvent(ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_PUT));
            break;
         case this.okBtn:
            this.$parent.dispatchEvent(new BaseEvent(ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_START));
      }
   }
   
   private function onItem(param1:MouseEvent) : void
   {
      this.$parent.dispatchEvent(new BaseEvent(ConeyGirlPanel.UI_CONEYGIRLPANEL_POINT_ITEM_CLICK,"",(param1.target as ItemFace).getBaseItem()));
   }
   
   public function setItem(param1:Array) : void
   {
      var _loc2_:int = 0;
      var _loc4_:ItemFace = null;
      while(this.itemContainer.numChildren)
      {
         this.itemContainer.removeChildAt(0);
      }
      var _loc3_:int = int(param1.length);
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         _loc4_ = new ItemFace(param1[_loc2_] as Goods);
         this.itemContainer.addChild(_loc4_);
         _loc4_.x = _loc2_ * 41;
         _loc2_++;
      }
   }
   
   public function setPoint(param1:int) : void
   {
      this.pointText.text = param1.toString();
   }
}
