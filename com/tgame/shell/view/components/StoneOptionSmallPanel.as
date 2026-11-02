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
   
   public class StoneOptionSmallPanel extends FPanel
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
      
      private var tempType:int = 0;
      
      public function StoneOptionSmallPanel()
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
            x = 25 - 15;
            y = 6;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'3\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"宝石镶嵌",["</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>"]) + "<br>" + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"宝石取出",["</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>"]) + "</font>";
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
            htmlText = "<textformat leading=\'3\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("宝石镶嵌与取出不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
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
                  dispatchEvent(new BaseEvent(UI_STONE_OPTION_PANEL_STONE_CLICK,"",[_loc4_,this.tempType]));
                  return;
               }
               _loc3_++;
            }
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_STONE_OPTION_PANEL_DRAG_ENTER,"",this.tempType));
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
            _loc4_ = new ItemFace(param1[_loc2_][0] as Goods);
            this.stoneContainer.addChild(_loc4_);
            _loc4_.x = _loc2_ * 40;
            _loc4_.y = 12;
            _loc2_++;
         }
      }
      
      public function setYangshi(param1:int) : void
      {
         this.tempType = 0;
         if(param1 == 1)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"宝石镶嵌",["</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>"]) + "<br>" + "</font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"宝石取出",["</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>"]) + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("宝石镶嵌与取出不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("宝石镶嵌与取出");
         }
         else if(param1 == 2)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【千年琥珀】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每件战甲可以镶嵌一个【千年琥珀】") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【千年琥珀】镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 3)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【宝珠】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("武林神话勋章最多可镶嵌六颗【宝珠】") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【宝珠】镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 4)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【混沌宝石】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("混沌勋章最多可镶嵌六颗【混沌宝石】") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【混沌宝石】镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 5)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【困兽宝石】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("困兽之斗勋章最多可镶嵌五颗【困兽宝石】") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【困兽宝石】镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 6)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【速度之星】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("速度之星勋章最多可镶嵌五颗【速度之星】") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【速度之星】镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 7)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【符文】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("御魔战士勋章最多可镶嵌五种符文") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("符文镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 8)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【无相神石】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("无相神功勋章最多可镶嵌一种神石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("神石镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 9)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【剑谱】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("万剑归宗勋章最多可嵌镶五本剑谱") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 10)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【光电无双宝珠】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("傲剑无双勋章最多可嵌镶五颗宝珠") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 11)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【天辰石】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第23届霸主勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 12)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【霸主攻速石】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("第16届跨平台霸主勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 13)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【梦幻霸主打孔石】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("梦幻霸主勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 14)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【北斗星石】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("北斗星辰勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 15)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【魔牙】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("虎魔神甲勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 16)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("打狗棒最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 17)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("轩辕天剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 18)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("轩辕地剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 19)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("轩辕人剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 20)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("傲剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 21)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("神刀血饮最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 22)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("青龙偃月最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 121)
         {
            this.tempType = 23;
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "Khảm Siêu Cấp: Chỉ có thể khảm Bảo Thạch Cấp 11 trở lên" + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "Lấy đá: nhấp chọn đá trong cửa sổ này" + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = "Khảm Siêu Cấp";
         }
         else if(param1 == 23)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("犬神最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 24)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【死亡武神石】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("死亡沙漏勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 25)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("武魂天殇最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 26)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("真?武魂天殇最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 27)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("元神御剑勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 28)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("黄金血饮最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 29)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("玄铁重剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 30)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("黄金偃月最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 31)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("愚人节勋章最多可嵌镶六颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 32)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("五雷化极勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 33)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("紫晶重剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 34)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("血天魔功勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 35)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("蓝玉蟠龙棍最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 36)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("真?破军苍龙最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 37)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("黄金开天斧最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 38)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("黄金刑天最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 39)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("疾火煌阵勋章最多可嵌镶六颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 40)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天罚傲剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 41)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("血煞孤星最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 42)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("五行神龙勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 43)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("极道乾坤勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 44)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("子午七星最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 45)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("屠龙魔影最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 46)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("戮屠万刃最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 47)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("罗汉附体勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 48)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("圆月弯刀最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 49)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("裂天霸王枪最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 50)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("破晓蓝月最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 51)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("英雄护符最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 52)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("混沌游龙枪最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 53)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("劫天最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 54)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("诛仙最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 55)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("皇权霸主勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 56)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("噬神最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 57)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("道骨仙风勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 58)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("无影剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 59)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("鸣鸿刀最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 60)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("七月跨平台霸主勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 61)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("传承?七月跨平台霸主勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 62)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("金箍最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 63)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("虎韬阵魂勋章最多可嵌镶一颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 64)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("黄金剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 65)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙珠最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 66)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("红莲最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 67)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("赤炎最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 68)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("断魂最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 69)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("风雷护身符最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 70)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("破天最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 71)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("洛神锏最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 72)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天诛最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 73)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("紫郢剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 74)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天龙最多可嵌镶四颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 75)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("明教教主护身符最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 76)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("暴雨梨花枪最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 77)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("神兵符最多可嵌镶两颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 78)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天晶最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 79)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("屠龙刀最多可嵌镶两颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 80)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("雄霸勋章最多可嵌镶一颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 81)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("聂风勋章最多可嵌镶三颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 82)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("步惊云勋章最多可嵌镶三颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 83)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("秦霜勋章最多可嵌镶一颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 84)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("红魔最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 85)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("灵魂摆渡勋章最多可嵌镶两颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 86)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("皇途霸业皇室勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 87)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("衍天最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 88)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("军旗最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 89)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("盘古开天斧最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 90)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("逆炎最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 91)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("襄阳帅印最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 92)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("创世最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 93)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("轩辕神剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 94)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("炼妖壶最多可嵌镶六颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 95)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("赤宵最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 96)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("魔剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 97)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙王三叉戟最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 98)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("九月新时代王者勋章最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 99)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("寒冰神器锤最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 100)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("火陨最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 101)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("神魔最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 102)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("邪皇魔刀最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 103)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("辕剑灵魄最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 104)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("芭蕉铁扇最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 105)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("侠侣屠魔最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 106)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("风雷最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 107)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("流星落最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 108)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("邪龙魔剑最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 109)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("血舞旋月最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 110)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("巨龙之击最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 111)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("碎魂饮血最多可嵌镶五颗宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 112)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "寒光最多可嵌镶五颗宝石" + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 113)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的宝石拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "梼杌内丹最多可嵌镶五颗恶灵丹" + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 114)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【星星平安】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每个升级版圣诞勋章可以镶嵌一个【星星平安】") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【星星平安】镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 115)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【新年烟花】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每个迎新2015勋章可以镶嵌一个【新年烟花】") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【新年烟花】镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 116)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【刻纹】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("铜鼓勋章最多可嵌镶五个刻纹") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 117)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【白龙珠】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("白龙降世勋章最多可嵌镶五颗白龙珠") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 118)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【狩猎宝石】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("终结者勋章最多可嵌镶五颗狩猎宝石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 119)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【倚天激活石】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("终结者勋章最多可嵌镶一颗倚天激活石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
         }
         else if(param1 == 120)
         {
            this.tip1.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将背包中的【倚天激活石】拖入本窗口") + "<br>" + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("终结者勋章最多可嵌镶一颗倚天激活石") + "</font>";
            this.tip.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌不消耗任何费用") + "<br>" + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功率为100%") + "" + "</font>";
            titleText = LanResManager.getLanCommonTextWords("镶嵌");
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

