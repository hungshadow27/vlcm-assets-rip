package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   
   public class XunzhangOptionSmallPanel extends FPanel
   {
      
      public static const UI_STONE_OPTION_PANEL_DRAG_START:String = "UI_BACKPACK_STONE_OPTION_PANEL_DRAG_START";
      
      public static const UI_STONE_OPTION_PANEL_STONE_CLICK:String = "UI_STONE_OPTION_PANEL_STONE_CLICK";
      
      public static const UI_STONE_OPTION_PANEL_DRAG_ENTER:String = "UI_BACKPACK_STONE_OPTION_PANEL_DRAG_ENTER";
      
      private var stoneContainer:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var arr:Array;
      
      private var tip:FTextArea;
      
      private var tip1:FTextArea;
      
      private var tf:TextFormat;
      
      private var fengkuang:Sprite;
      
      private var id:int;
      
      public function XunzhangOptionSmallPanel()
      {
         var v:Vector.<Bitmap>;
         var img:Bitmap = null;
         super();
         skin = "sceondPanel";
         dragAble = true;
         showCloseButton = true;
         width = 257;
         height = 176;
         titleText = LanResManager.getLanCommonTextWords("宝石镶嵌与取出");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.char.backpack.stone.ui";
         addChild(img);
         img.x = 6;
         v = new Vector.<Bitmap>();
         v.push(img);
         DynamicManageImages = v;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tip1 = new FTextArea();
         with(this.tip1)
         {
            width = 250;
            height = 40;
            x = 25;
            y = 6;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StoneOptionSmallPanel,"宝石镶嵌",["</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>"]) + "<br>" + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StoneOptionSmallPanel,"宝石取出",["</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>"]) + "</font>";
         }
         addChild(this.tip1);
         this.fengkuang = new Sprite();
         addChild(this.fengkuang);
         this.fengkuang.x = 9;
         this.fengkuang.y = 45;
         this.stoneContainer = new Sprite();
         addChild(this.stoneContainer);
         this.stoneContainer.x = 9;
         this.stoneContainer.y = 45;
         with(this.stoneContainer.graphics)
         {
            beginFill(0,0.5);
            drawRect(0,0,241,59);
            endFill();
         }
         this.stoneContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.stoneContainer.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 206;
            height = 40;
            x = 25;
            y = 108;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("宝石镶嵌与取出不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
         }
         addChild(this.tip);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.target is ItemFace)
         {
            _loc2_ = Goods((param1.target as ItemFace).getBaseItem());
            _loc3_ = 0;
            while(_loc3_ < this.arr.length)
            {
               if(this.arr[_loc3_] == _loc2_)
               {
                  _loc4_ = _loc2_.id;
                  dispatchEvent(new BaseEvent(UI_STONE_OPTION_PANEL_STONE_CLICK,"",_loc4_));
                  return;
               }
               _loc3_++;
            }
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_STONE_OPTION_PANEL_DRAG_ENTER));
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
            dispatchEvent(new BaseEvent(UI_STONE_OPTION_PANEL_DRAG_START,"",this.currItem));
            this.stoneContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      public function setItem(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         this.arr = param1;
         while(this.stoneContainer.numChildren > 0)
         {
            this.stoneContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new ItemFace(param1[_loc2_] as Goods);
            this.stoneContainer.addChild(_loc4_);
            _loc4_.x = _loc2_ * 40;
            _loc4_.y = 12;
            _loc2_++;
         }
      }
      
      public function setFengKuang(param1:int = 0) : void
      {
         var _loc2_:Bitmap = null;
         while(this.fengkuang.numChildren > 0)
         {
            this.fengkuang.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_ = StaticValue.getBitmapByClassName("ui.tongyong.fugai.kuang");
            _loc2_.x = _loc3_ * -40 + 198;
            _loc2_.y = 10;
            this.fengkuang.addChild(_loc2_);
            _loc3_++;
         }
      }
   }
}

