package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.shell.view.components.kuafulunjianBackpack.KuafuLjianItemSplitPanel;
   import com.tgame.shell.view.components.kuafulunjianBackpack.KuafuLunjianItemDestroyPanel;
   import com.tgame.shell.view.components.kuafulunjianBackpack.KuafuLunjianXingShouLiBaoPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.CDFaceManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ZhanhundaiPanel extends FPanel
   {
      
      public static const UI_KUAFULUNJIANBACKPACK_DRAG_STRAT:String = "UI_KUAFULUNJIANBACKPACK_DRAG_STRAT";
      
      public static const GETSHOWITEMMENU_KUAFULUNJIAN:String = "ui.zhanhundai.getmenu";
      
      public static const UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK:String = "UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK";
      
      private var fta:FTextArea;
      
      public var lqsyBtn:SmallButton;
      
      public var slots:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var xinshoulibao:KuafuLunjianXingShouLiBaoPanel;
      
      private var splitPanel:KuafuLjianItemSplitPanel;
      
      private var destroyPanel:KuafuLunjianItemDestroyPanel;
      
      private var item:ItemFace;
      
      private var bg:Bitmap;
      
      private var bgNew:Bitmap;
      
      private var itemSprBg:Sprite;
      
      public function ZhanhundaiPanel()
      {
         var i:int;
         var fc:FCanvas = null;
         var headBg:F9GridBitmap = null;
         var j:int = 0;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 339;
         height = 405 + 60 - 34;
         titleText = LanResManager.getLanCommonTextWords("战魂袋");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         fc = new FCanvas();
         fc.x = 10;
         fc.y = 2;
         fc.width = 403 - 80 - 4;
         fc.height = 366 - 37 - 54 - 16 - 2;
         fc.skin = "box";
         addChild(fc);
         headBg = Tools.get9GridBitmpByName("zhanhunBg");
         addChild(headBg);
         headBg.width = 319;
         headBg.height = 98;
         headBg.x = 10;
         headBg.y = 257;
         this.bg = StaticValue.getBitmapByClassName("ui.zhanhun.item.bg");
         addChild(this.bg);
         this.bg.x = 20;
         this.bg.y = 265;
         this.itemSprBg = new Sprite();
         this.itemSprBg.x = 20;
         this.itemSprBg.y = 10;
         addChild(this.itemSprBg);
         i = 0;
         while(i < 5)
         {
            j = 0;
            while(j < 4)
            {
               this.bgNew = new Bitmap(this.bg.bitmapData.clone());
               this.bgNew.x = i * 60;
               this.bgNew.y = j * 60;
               this.itemSprBg.addChild(this.bgNew);
               j++;
            }
            i++;
         }
         this.slots = new Sprite();
         with(this.slots)
         {
            x = 20;
            y = 10;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,300,315);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         addChild(this.slots);
         this.slots.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.slots.addEventListener(MouseEvent.MOUSE_UP,this.showMenu,false,30);
         this.lqsyBtn = new SmallButton();
         addChild(this.lqsyBtn);
         this.lqsyBtn.label = LanResManager.getLanCommonTextWords("一键吞噬");
         this.lqsyBtn.x = 15;
         this.lqsyBtn.y = 331;
         this.lqsyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         addChild(this.fta);
         this.fta.x = 100;
         this.fta.y = 279;
         this.fta.textColor = StaticValue.ORANGE;
         this.fta.filters = StaticValue.filter;
         this.fta.width = 228;
         this.fta.height = 60;
         this.fta.wordWrap = true;
         this.fta.htmlText = LanResManager.getLanCommonTextWords("放入要升级的【战魂】，点击【一键吞噬】将吞噬掉比该战魂等级低或同等级，且未【锁定】的战魂。");
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.lqsyBtn:
               dispatchEvent(new BaseEvent(UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK,"",ItemPositionRange.GOODS_IN_BAG_ZHANHUNDAI_RANGE.y));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.slots.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.slots.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            dispatchEvent(new BaseEvent(UI_KUAFULUNJIANBACKPACK_DRAG_STRAT,"",this.currItem));
            this.slots.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function showMenu(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1.target as ItemFace)
         {
            dispatchEvent(new BaseEvent(GETSHOWITEMMENU_KUAFULUNJIAN,"",[param1,null]));
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = ItemPositionRange.GOODS_IN_BAG_ZHANHUNDAI_RANGE.x;
            if(this.slots.mouseY > 0 && this.slots.mouseY < 60)
            {
               if(this.slots.mouseX > 0 && this.slots.mouseX < 60)
               {
                  _loc2_ = _loc3_;
               }
               else if(this.slots.mouseX > 61 && this.slots.mouseX < 120)
               {
                  _loc2_ = _loc3_ + 1;
               }
               else if(this.slots.mouseX > 121 && this.slots.mouseX < 180)
               {
                  _loc2_ = _loc3_ + 2;
               }
               else if(this.slots.mouseX > 181 && this.slots.mouseX < 240)
               {
                  _loc2_ = _loc3_ + 3;
               }
               else if(this.slots.mouseX > 241 && this.slots.mouseX < 300)
               {
                  _loc2_ = _loc3_ + 4;
               }
            }
            if(this.slots.mouseY > 61 && this.slots.mouseY < 120)
            {
               if(this.slots.mouseX > 0 && this.slots.mouseX < 60)
               {
                  _loc2_ = _loc3_ + 5;
               }
               else if(this.slots.mouseX > 61 && this.slots.mouseX < 120)
               {
                  _loc2_ = _loc3_ + 6;
               }
               else if(this.slots.mouseX > 121 && this.slots.mouseX < 180)
               {
                  _loc2_ = _loc3_ + 7;
               }
               else if(this.slots.mouseX > 181 && this.slots.mouseX < 240)
               {
                  _loc2_ = _loc3_ + 8;
               }
               else if(this.slots.mouseX > 241 && this.slots.mouseX < 300)
               {
                  _loc2_ = _loc3_ + 9;
               }
            }
            if(this.slots.mouseY > 121 && this.slots.mouseY < 180)
            {
               if(this.slots.mouseX > 0 && this.slots.mouseX < 60)
               {
                  _loc2_ = _loc3_ + 10;
               }
               else if(this.slots.mouseX > 61 && this.slots.mouseX < 120)
               {
                  _loc2_ = _loc3_ + 11;
               }
               else if(this.slots.mouseX > 121 && this.slots.mouseX < 180)
               {
                  _loc2_ = _loc3_ + 12;
               }
               else if(this.slots.mouseX > 181 && this.slots.mouseX < 240)
               {
                  _loc2_ = _loc3_ + 13;
               }
               else if(this.slots.mouseX > 241 && this.slots.mouseX < 300)
               {
                  _loc2_ = _loc3_ + 14;
               }
            }
            if(this.slots.mouseY > 181 && this.slots.mouseY < 240)
            {
               if(this.slots.mouseX > 0 && this.slots.mouseX < 60)
               {
                  _loc2_ = _loc3_ + 15;
               }
               else if(this.slots.mouseX > 61 && this.slots.mouseX < 120)
               {
                  _loc2_ = _loc3_ + 16;
               }
               else if(this.slots.mouseX > 121 && this.slots.mouseX < 180)
               {
                  _loc2_ = _loc3_ + 17;
               }
               else if(this.slots.mouseX > 181 && this.slots.mouseX < 240)
               {
                  _loc2_ = _loc3_ + 18;
               }
               else if(this.slots.mouseX > 241 && this.slots.mouseX < 300)
               {
                  _loc2_ = _loc3_ + 19;
               }
            }
            if(this.slots.mouseY > 256 && this.slots.mouseY < 315)
            {
               if(this.slots.mouseX > 0 && this.slots.mouseX < 60)
               {
                  _loc2_ = _loc3_ + 20;
               }
            }
            if(_loc2_ == 0)
            {
               return;
            }
            dispatchEvent(new BaseEvent(GETSHOWITEMMENU_KUAFULUNJIAN,"",[param1,_loc2_]));
         }
         this.slots.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function setItem(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         var _loc5_:McBaseItem = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         while(this.slots.numChildren > 0)
         {
            _loc2_ = this.slots.getChildAt(0) as ItemFace;
            this.slots.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc4_:int = int(param1.length);
         var _loc6_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1[_loc3_];
            _loc8_ = ItemPositionRange.GOODS_IN_BAG_ZHANHUNDAI_RANGE.x;
            if(_loc5_.position > _loc8_ + 23)
            {
               _loc7_ = (_loc5_.position - _loc8_) % 30 + _loc8_;
            }
            else
            {
               _loc7_ = _loc5_.position;
            }
            _loc2_ = new ItemFace(_loc5_);
            _loc2_.setMcName(true);
            if(_loc5_.isSuoding)
            {
               _loc2_.setMcSuo(true);
            }
            switch(_loc7_)
            {
               case _loc8_:
                  _loc2_.x = 0;
                  _loc2_.y = 0;
                  break;
               case _loc8_ + 1:
                  _loc2_.x = 60;
                  _loc2_.y = 0;
                  break;
               case _loc8_ + 2:
                  _loc2_.x = 60 * 2;
                  _loc2_.y = 0;
                  break;
               case _loc8_ + 3:
                  _loc2_.x = 60 * 3;
                  _loc2_.y = 0;
                  break;
               case _loc8_ + 4:
                  _loc2_.x = 60 * 4;
                  _loc2_.y = 0;
                  break;
               case _loc8_ + 5:
                  _loc2_.x = 0;
                  _loc2_.y = 60;
                  break;
               case _loc8_ + 6:
                  _loc2_.x = 60;
                  _loc2_.y = 60;
                  break;
               case _loc8_ + 7:
                  _loc2_.x = 60 * 2;
                  _loc2_.y = 60;
                  break;
               case _loc8_ + 8:
                  _loc2_.x = 60 * 3;
                  _loc2_.y = 60;
                  break;
               case _loc8_ + 9:
                  _loc2_.x = 60 * 4;
                  _loc2_.y = 60;
                  break;
               case _loc8_ + 10:
                  _loc2_.x = 0;
                  _loc2_.y = 60 * 2;
                  break;
               case _loc8_ + 11:
                  _loc2_.x = 60;
                  _loc2_.y = 60 * 2;
                  break;
               case _loc8_ + 12:
                  _loc2_.x = 60 * 2;
                  _loc2_.y = 60 * 2;
                  break;
               case _loc8_ + 13:
                  _loc2_.x = 60 * 3;
                  _loc2_.y = 60 * 2;
                  break;
               case _loc8_ + 14:
                  _loc2_.x = 60 * 4;
                  _loc2_.y = 60 * 2;
                  break;
               case _loc8_ + 15:
                  _loc2_.x = 0;
                  _loc2_.y = 60 * 3;
                  break;
               case _loc8_ + 16:
                  _loc2_.x = 60;
                  _loc2_.y = 60 * 3;
                  break;
               case _loc8_ + 17:
                  _loc2_.x = 60 * 2;
                  _loc2_.y = 60 * 3;
                  break;
               case _loc8_ + 18:
                  _loc2_.x = 60 * 3;
                  _loc2_.y = 60 * 3;
                  break;
               case _loc8_ + 19:
                  _loc2_.x = 60 * 4;
                  _loc2_.y = 60 * 3;
                  break;
               case _loc8_ + 20:
                  _loc2_.x = 0;
                  _loc2_.y = 60 * 4 + 15;
            }
            this.slots.addChild(_loc2_);
            _loc6_.push(_loc2_);
            _loc3_++;
         }
         this.setZhanxing(null);
         CDFaceManager.registerItemFace_batch(_loc6_);
      }
      
      public function setZhanxing(param1:ItemFace) : void
      {
         if(param1 == null)
         {
            if(this.item != null && this.item.parent != null)
            {
               this.item.destroy();
               this.item.parent.removeChild(this.item);
               this.item = null;
            }
            return;
         }
         if(this.item != null && this.item.parent != null)
         {
            this.item.destroy();
            this.item.parent.removeChild(this.item);
         }
         this.item = param1;
         addChildAt(this.item,3);
         this.item.setMcName(true);
         this.item.y = 265;
         this.item.x = 20;
      }
   }
}

