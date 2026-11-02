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
   import flash.text.*;
   
   public class SheliziEnchasePanel extends FPanel
   {
      
      public static const UI_STONE_OPTION_PANEL_DRAG_START:String = "UI_BACKPACK_STONE_OPTION_PANEL_DRAG_START";
      
      public static const UI_STONE_OPTION_PANEL_STONE_CLICK:String = "UI_STONE_OPTION_PANEL_STONE_CLICK";
      
      public static const UI_STONE_OPTION_PANEL_DRAG_ENTER:String = "UI_BACKPACK_STONE_OPTION_PANEL_DRAG_ENTER";
      
      private var stoneContainer:Sprite;
      
      private var stoneContainerBg:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var arr:Array;
      
      private var tip:FTextArea;
      
      private var tip1:FTextArea;
      
      private var tf:TextFormat;
      
      private var item:ItemFace;
      
      private var img:Bitmap;
      
      public function SheliziEnchasePanel()
      {
         var v:Vector.<Bitmap>;
         super();
         skin = "sceondPanel";
         dragAble = true;
         showCloseButton = true;
         width = 286;
         height = 206;
         titleText = LanResManager.getLanCommonTextWords("舍利子镶嵌与取出");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.img = new Bitmap();
         this.img.name = "ui.amulet.sarira.option.ui";
         addChild(this.img);
         this.img.x = 6;
         v = new Vector.<Bitmap>();
         v.push(this.img);
         DynamicManageImages = v;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tip1 = new FTextArea();
         with(this.tip1)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 55;
            y = 8;
            filters = StaticValue.filter;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanTextWords(this,"本护身符可镶嵌舍利子：X个");
         }
         addChild(this.tip1);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 250;
            height = 40;
            x = 12;
            y = 53;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'3\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌") + "：</font>" + LanResManager.getLanCommonTextWords("将背包中的舍利子拖入本窗口") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("取出") + "：</font>" + LanResManager.getLanCommonTextWords("鼠标点击本窗口中的舍利子即可") + "</font></textformat>";
         }
         addChild(this.tip);
         this.stoneContainerBg = new Sprite();
         addChild(this.stoneContainerBg);
         this.stoneContainerBg.x = 40;
         this.stoneContainerBg.y = 90;
         this.stoneContainer = new Sprite();
         addChild(this.stoneContainer);
         this.stoneContainer.x = 35;
         this.stoneContainer.y = 90;
         with(this.stoneContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,241,40);
            endFill();
         }
         this.stoneContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.stoneContainer.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 280;
            height = 40;
            x = 20;
            y = 138;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            htmlText = "<textformat leading=\'3\'>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("舍利子镶嵌与取出不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功几率为100%，镶嵌后舍利子绑定") + "</font>";
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
               if(this.arr[_loc3_][0] == _loc2_)
               {
                  _loc4_ = int(this.arr[_loc3_][1]);
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
      
      public function setInitialize(param1:int) : void
      {
         this.tip1.htmlText = LanResManager.getLanTextWords(this,"镶嵌舍利子",[param1]);
         while(this.stoneContainerBg.numChildren > 0)
         {
            this.stoneContainerBg.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1)
         {
            this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.stoneContainerBg.addChild(this.img);
            this.img.x = 40 * _loc2_;
            _loc2_++;
         }
      }
      
      public function setGoodsInitialize(param1:Goods) : void
      {
         if(this.item != null)
         {
            removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 15;
         this.item.y = 6;
         addChild(this.item);
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
            _loc4_ = new ItemFace(param1[_loc2_][0] as Goods);
            this.stoneContainer.addChild(_loc4_);
            _loc4_.x = 7 + _loc2_ * 40;
            _loc4_.y = 2;
            _loc2_++;
         }
      }
   }
}

