package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   
   public class TianFuSuiPianHeChengPanel extends FPanel
   {
      
      public static const UI_TIANFU_HECHENG_PANEL_DRAG_START:String = "UI_TIANFU_HECHENG_PANEL_DRAG_START";
      
      public static const UI_TIANFU_HECHENG_PANEL_SUIPIAN_CLICK:String = "UI_TIANFU_HECHENG_PANEL_SUIPIAN_CLICK";
      
      public static const UI_TIANFU_HECHENG_PANEL_DRAG_ENTER:String = "UI_TIANFU_HECHENG_PANEL_DRAG_ENTER";
      
      public static const UI_TIANFU_HECHENG_PANEL_HECHENG_OR_LINGQU_CLICK:String = "UI_TIANFU_HECHENG_PANEL_HECHENG_OR_LINGQU_CLICK";
      
      private var suiPianContainer:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var arr:Array;
      
      private var tip:FTextArea;
      
      private var tip1:FTextArea;
      
      private var tf:TextFormat;
      
      private var heChengBtn:SecondButton;
      
      private var item_border:int = 1;
      
      private var item_gap:int = 1;
      
      public function TianFuSuiPianHeChengPanel()
      {
         var bg:DisplayObject;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 216;
         height = 296 + 5;
         titleText = LanResManager.getLanCommonTextWords("合成");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tianfu/suipian.hecheng.bg.swf");
         bg.x = 12;
         bg.y = 40;
         addChild(bg);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tip1 = new FTextArea();
         with(this.tip1)
         {
            width = 210;
            height = 40;
            x = 10;
            y = 3;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("将要合成的道具碎片放在下方道具栏内！") + "</font>" + "</textformat>";
         }
         addChild(this.tip1);
         this.suiPianContainer = new Sprite();
         addChild(this.suiPianContainer);
         this.suiPianContainer.x = 13;
         this.suiPianContainer.y = 42;
         with(this.suiPianContainer.graphics)
         {
            beginFill(0,0.5);
            drawRect(0,0,189,114);
            endFill();
         }
         this.suiPianContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.suiPianContainer.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            height = 40;
            x = 60;
            y = 160;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("合成后：") + "</font>";
         }
         addChild(this.tip);
         this.heChengBtn = new SecondButton();
         addChild(this.heChengBtn);
         this.heChengBtn.label = LanResManager.getLanCommonTextWords("确定合成");
         this.heChengBtn.x = 73;
         this.heChengBtn.y = 238;
         this.heChengBtn.addEventListener(MouseEvent.CLICK,this.onHeCheng);
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onHeCheng(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = getChildByName("hecheng") as ItemFace;
         if(_loc2_ != null)
         {
            dispatchEvent(new BaseEvent(UI_TIANFU_HECHENG_PANEL_HECHENG_OR_LINGQU_CLICK,"",1));
         }
         else
         {
            dispatchEvent(new BaseEvent(UI_TIANFU_HECHENG_PANEL_HECHENG_OR_LINGQU_CLICK,"",0));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1.target is ItemFace)
         {
            _loc2_ = Goods((param1.target as ItemFace).getBaseItem());
            _loc3_ = 0;
            while(_loc3_ < this.arr.length)
            {
               if(this.arr[_loc3_][0] == _loc2_)
               {
                  _loc4_ = int(this.arr[_loc3_][1]);
                  _loc5_ = int(this.arr[_loc3_][3]);
                  dispatchEvent(new BaseEvent(UI_TIANFU_HECHENG_PANEL_SUIPIAN_CLICK,"",{
                     "pos":_loc4_,
                     "idx":_loc5_
                  }));
                  return;
               }
               _loc3_++;
            }
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = mouseX - this.suiPianContainer.x;
         var _loc4_:int = mouseY - this.suiPianContainer.y - 35;
         if(_loc3_ > this.item_border && _loc3_ < this.item_border * 9 + this.item_gap * 4 + 35 * 5 && _loc4_ > this.item_border && _loc4_ < this.item_border * 5 + this.item_gap * 2 + 35 * 3)
         {
            _loc5_ = int((_loc3_ - this.item_border) / (35 + this.item_border * 2 + this.item_gap));
            _loc6_ = int((_loc4_ - this.item_border) / (35 + this.item_border * 2 + this.item_gap));
            _loc2_ = _loc6_ * 5 + _loc5_;
         }
         dispatchEvent(new BaseEvent(UI_TIANFU_HECHENG_PANEL_DRAG_ENTER,"",_loc2_));
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.suiPianContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.suiPianContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            dispatchEvent(new BaseEvent(UI_TIANFU_HECHENG_PANEL_DRAG_START,"",this.currItem));
            this.suiPianContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      public function setItems(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         var _loc5_:int = 0;
         this.arr = param1;
         while(this.suiPianContainer.numChildren > 0)
         {
            this.suiPianContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new ItemFace(param1[_loc2_][0] as Goods);
            if(_loc4_ != null)
            {
               _loc4_.setShowCount(param1[_loc2_][2]);
               _loc5_ = int(param1[_loc2_][3]);
               _loc4_.x = this.item_border + (35 + this.item_border * 2 + this.item_gap) * int(_loc5_ % 5);
               _loc4_.y = this.item_border + (35 + this.item_border * 2 + this.item_gap) * int(_loc5_ / 5);
               this.suiPianContainer.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      public function setOKGood(param1:int, param2:int) : void
      {
         var _loc3_:ItemFace = getChildByName("hecheng") as ItemFace;
         if(_loc3_ != null && _loc3_.parent != null)
         {
            _loc3_.parent.removeChild(_loc3_);
         }
         var _loc4_:Goods = new Goods(param1);
         _loc4_.count = param2;
         _loc3_ = new ItemFace(_loc4_);
         _loc3_.setShowCount(true);
         _loc3_.x = 90;
         _loc3_.y = 184;
         _loc3_.name = "hecheng";
         addChild(_loc3_);
         this.heChengBtn.label = LanResManager.getLanCommonTextWords("领    取");
      }
      
      public function updateButton() : void
      {
         var _loc1_:ItemFace = getChildByName("hecheng") as ItemFace;
         if(_loc1_ != null && _loc1_.parent != null)
         {
            _loc1_.parent.removeChild(_loc1_);
         }
         this.heChengBtn.label = LanResManager.getLanCommonTextWords("确定合成");
      }
   }
}

