package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FLabel;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.attribute.AnqiActivation;
   import com.tgame.shell.view.components.depot.DepotExpandPanel;
   import com.tgame.shell.view.components.depot.GetPanel;
   import com.tgame.shell.view.components.depot.SavePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.CDFaceManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class DepotPanel extends FPanel
   {
      
      public static const UI_DEPOTPANEL_GET_ITEM:String = "UI_DEPOTPANEL_GET_ITEM";
      
      public static const UI_DEPOTPANEL_JIHUO_DEPOT:String = "UI_DEPOTPANEL_JIHUO_DEPOT";
      
      public static const UI_DEPOTPANEL_JIHUO_DEPOT_OK:String = "UI_DEPOTPANEL_JIHUO_DEPOT_OK";
      
      public static const UI_DEPOTPANEL_CLICK:String = "UI_DEPOTPANEL_CLICK";
      
      public static const UI_DEPOTPANEL_NEATEN:String = "UI_DEPOTPANEL_NEATEN";
      
      public static const UI_DEPOTPANEL_BATCHSAVE_GET:String = "UI_DEPOTPANEL_BATCHSAVE_GET";
      
      public static const UI_DEPOTPANEL_SAVEBTN_CLICK:String = "UI_DEPOTPANEL_SAVEBTN_CLICK";
      
      public static const UI_DEPOTPANEL_SAVE:String = "UI_DEPOTPANEL_SAVE";
      
      public static const UI_DEPOTPANEL_GETBTN_CLICK:String = "UI_DEPOTPANEL_GETBTN_CLICK";
      
      public static const UI_DEPOTPANEL_GET:String = "UI_DEPOTPANEL_GET";
      
      public static const UI_DEPOTPANEL_RIDEDEPOTPANELBTN_CLICK:String = "UI_DEPOTPANEL_RIDEDEPOTPANELBTN_CLICK";
      
      public static const UI_DEPOTPANEL_DRAG_STRAT:String = "UI_DEPOTPANEL_DRAG_STRAT";
      
      private var tabBar:FTabBar;
      
      private var count:FLabel;
      
      private var neatenBtn:SmallButton;
      
      private var batchBtn:SmallButton;
      
      private var rideDepotBtn:SecondButton;
      
      private var saveBtn:SecondButton;
      
      private var getBtn:SecondButton;
      
      private var slots:Sprite;
      
      private var money:FLabel;
      
      private var currnetLabel:String;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var btnLabelArr:Array;
      
      public function DepotPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var lb:FLabel;
         var img:Bitmap;
         this.btnLabelArr = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","..."];
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 256;
         height = 363;
         this.titleText = LanResManager.getLanCommonTextWords("仓库");
         this.tabBar = new FTabBar();
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         bg = new Bitmap();
         bg.name = "ui.char.depot.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 22;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         this.count = new FLabel();
         addChild(this.count);
         this.count.x = 220;
         this.count.y = 225;
         this.count.textColor = StaticValue.BlUE50;
         this.count.text = "0/30";
         this.slots = new Sprite();
         with(this.slots)
         {
            x = 16;
            y = 28;
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,225,187);
            graphics.endFill();
         }
         addChild(this.slots);
         this.slots.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.slots.addEventListener(MouseEvent.MOUSE_UP,this.showMenu,false,30);
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.neatenBtn = new SmallButton();
         addChild(this.neatenBtn);
         this.neatenBtn.label = LanResManager.getLanTextWords(this,"整理仓库");
         this.neatenBtn.x = 18;
         this.neatenBtn.y = 225;
         this.neatenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.batchBtn = new SmallButton();
         addChild(this.batchBtn);
         this.batchBtn.label = LanResManager.getLanTextWords(this,"批量存取");
         this.batchBtn.x = 140;
         this.batchBtn.y = 225;
         this.batchBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rideDepotBtn = new SecondButton();
         this.rideDepotBtn.label = LanResManager.getLanTextWords(this,"坐骑仓库");
         addChild(this.rideDepotBtn);
         this.rideDepotBtn.x = 18;
         this.rideDepotBtn.y = 274;
         this.rideDepotBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.saveBtn = new SecondButton();
         this.saveBtn.label = LanResManager.getLanTextWords(this,"存钱");
         addChild(this.saveBtn);
         this.saveBtn.x = 115;
         this.saveBtn.y = 274;
         this.saveBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.getBtn = new SecondButton();
         this.getBtn.label = LanResManager.getLanTextWords(this,"取钱");
         addChild(this.getBtn);
         this.getBtn.x = 180 + this.batchBtn.width - this.getBtn.width;
         this.getBtn.y = 274;
         this.getBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 18;
            y = 250;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"仓库中铜钱");
         }
         addChild(lb);
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 97;
         img.y = 251;
         lb = new FLabel();
         with(lb)
         {
            x = 32;
            y = 296;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"批量存取按钮可让存取更加简便");
         }
         addChild(lb);
         this.money = new FLabel();
         with(this.money)
         {
            x = 122;
            y = 252;
            textColor = StaticValue.YELLOW;
            text = "0";
         }
         addChild(this.money);
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         if((param1.target as FButton).label == LanResManager.getLanTextWords(AnqiActivation,"激活开启"))
         {
            this.tabBar.recoverBtnState();
            this.currnetLabel = this.tabBar.currentLabel;
            dispatchEvent(new BaseEvent(UI_DEPOTPANEL_JIHUO_DEPOT));
            return;
         }
         if((param1.target as FButton).label == this.btnLabelArr[this.btnLabelArr.length - 1])
         {
            this.tabBar.recoverBtnState();
            return;
         }
         var _loc2_:int = this.btnLabelArr.indexOf((param1.target as FButton).label);
         if(_loc2_ != -1)
         {
            dispatchEvent(new BaseEvent(UI_DEPOTPANEL_GET_ITEM,"",_loc2_ + 1));
            this.currnetLabel = this.tabBar.currentLabel;
            this.setDepotCount(GameInstance.mainCharData.attributeInfo.depotCount);
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
            dispatchEvent(new BaseEvent(UI_DEPOTPANEL_DRAG_STRAT,"",this.currItem));
            this.slots.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function showMenu(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.target as ItemFace)
         {
            dispatchEvent(new BaseEvent(UI_DEPOTPANEL_CLICK,"",[param1,null]));
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = ItemPositionRange.GOODS_IN_STORAGE_RANGE.x;
            if(this.slots.mouseY > 0 && this.slots.mouseY < 36)
            {
               if(this.slots.mouseX > 0 && this.slots.mouseX < 36)
               {
                  _loc2_ = _loc3_;
               }
               else if(this.slots.mouseX > 37 && this.slots.mouseX < 74)
               {
                  _loc2_ = _loc3_ + 1;
               }
               else if(this.slots.mouseX > 75 && this.slots.mouseX < 112)
               {
                  _loc2_ = _loc3_ + 2;
               }
               else if(this.slots.mouseX > 113 && this.slots.mouseX < 150)
               {
                  _loc2_ = _loc3_ + 3;
               }
               else if(this.slots.mouseX > 151 && this.slots.mouseX < 188)
               {
                  _loc2_ = _loc3_ + 4;
               }
               else if(this.slots.mouseX > 189 && this.slots.mouseX < 226)
               {
                  _loc2_ = _loc3_ + 5;
               }
            }
            if(this.slots.mouseY > 37 && this.slots.mouseY < 74)
            {
               if(this.slots.mouseX > 0 && this.slots.mouseX < 36)
               {
                  _loc2_ = _loc3_ + 6;
               }
               else if(this.slots.mouseX > 37 && this.slots.mouseX < 74)
               {
                  _loc2_ = _loc3_ + 7;
               }
               else if(this.slots.mouseX > 75 && this.slots.mouseX < 112)
               {
                  _loc2_ = _loc3_ + 8;
               }
               else if(this.slots.mouseX > 113 && this.slots.mouseX < 150)
               {
                  _loc2_ = _loc3_ + 9;
               }
               else if(this.slots.mouseX > 151 && this.slots.mouseX < 188)
               {
                  _loc2_ = _loc3_ + 10;
               }
               else if(this.slots.mouseX > 189 && this.slots.mouseX < 226)
               {
                  _loc2_ = _loc3_ + 11;
               }
            }
            if(this.slots.mouseY > 75 && this.slots.mouseY < 112)
            {
               if(this.slots.mouseX > 0 && this.slots.mouseX < 36)
               {
                  _loc2_ = _loc3_ + 12;
               }
               else if(this.slots.mouseX > 37 && this.slots.mouseX < 74)
               {
                  _loc2_ = _loc3_ + 13;
               }
               else if(this.slots.mouseX > 75 && this.slots.mouseX < 112)
               {
                  _loc2_ = _loc3_ + 14;
               }
               else if(this.slots.mouseX > 113 && this.slots.mouseX < 150)
               {
                  _loc2_ = _loc3_ + 15;
               }
               else if(this.slots.mouseX > 151 && this.slots.mouseX < 188)
               {
                  _loc2_ = _loc3_ + 16;
               }
               else if(this.slots.mouseX > 189 && this.slots.mouseX < 226)
               {
                  _loc2_ = _loc3_ + 17;
               }
            }
            if(this.slots.mouseY > 113 && this.slots.mouseY < 150)
            {
               if(this.slots.mouseX > 0 && this.slots.mouseX < 36)
               {
                  _loc2_ = _loc3_ + 18;
               }
               else if(this.slots.mouseX > 37 && this.slots.mouseX < 74)
               {
                  _loc2_ = _loc3_ + 19;
               }
               else if(this.slots.mouseX > 75 && this.slots.mouseX < 112)
               {
                  _loc2_ = _loc3_ + 20;
               }
               else if(this.slots.mouseX > 113 && this.slots.mouseX < 150)
               {
                  _loc2_ = _loc3_ + 21;
               }
               else if(this.slots.mouseX > 151 && this.slots.mouseX < 188)
               {
                  _loc2_ = _loc3_ + 22;
               }
               else if(this.slots.mouseX > 189 && this.slots.mouseX < 226)
               {
                  _loc2_ = _loc3_ + 23;
               }
            }
            if(this.slots.mouseY > 151 && this.slots.mouseY < 188)
            {
               if(this.slots.mouseX > 0 && this.slots.mouseX < 36)
               {
                  _loc2_ = _loc3_ + 24;
               }
               else if(this.slots.mouseX > 37 && this.slots.mouseX < 74)
               {
                  _loc2_ = _loc3_ + 25;
               }
               else if(this.slots.mouseX > 75 && this.slots.mouseX < 112)
               {
                  _loc2_ = _loc3_ + 26;
               }
               else if(this.slots.mouseX > 113 && this.slots.mouseX < 150)
               {
                  _loc2_ = _loc3_ + 27;
               }
               else if(this.slots.mouseX > 151 && this.slots.mouseX < 188)
               {
                  _loc2_ = _loc3_ + 28;
               }
               else if(this.slots.mouseX > 189 && this.slots.mouseX < 226)
               {
                  _loc2_ = _loc3_ + 29;
               }
            }
            if(_loc2_ == 0)
            {
               return;
            }
            _loc4_ = this.btnLabelArr.indexOf(this.tabBar.currentLabel);
            _loc2_ += 30 * _loc4_;
            dispatchEvent(new BaseEvent(UI_DEPOTPANEL_CLICK,"",[param1,_loc2_]));
         }
         this.slots.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.neatenBtn:
               dispatchEvent(new BaseEvent(UI_DEPOTPANEL_NEATEN));
               break;
            case this.batchBtn:
               dispatchEvent(new BaseEvent(UI_DEPOTPANEL_BATCHSAVE_GET));
               break;
            case this.rideDepotBtn:
               dispatchEvent(new BaseEvent(UI_DEPOTPANEL_RIDEDEPOTPANELBTN_CLICK));
               break;
            case this.saveBtn:
               dispatchEvent(new BaseEvent(UI_DEPOTPANEL_SAVEBTN_CLICK));
               break;
            case this.getBtn:
               dispatchEvent(new BaseEvent(UI_DEPOTPANEL_GETBTN_CLICK));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setDepotCount(param1:int) : void
      {
         var _loc4_:int = 0;
         this.tabBar.removeAllButton();
         var _loc2_:int = this.btnLabelArr.indexOf(this.currnetLabel);
         var _loc3_:Array = [];
         if(param1 <= 6)
         {
            _loc4_ = 0;
            while(_loc4_ < param1)
            {
               _loc3_.push(this.btnLabelArr[_loc4_]);
               _loc4_++;
            }
         }
         else if(_loc2_ < 5)
         {
            _loc4_ = 0;
            while(_loc4_ < 6)
            {
               _loc3_.push(this.btnLabelArr[_loc4_]);
               _loc4_++;
            }
         }
         else
         {
            _loc3_.push("1","2","...");
            if(_loc2_ != 19 && _loc2_ != param1 - 1)
            {
               _loc3_.push(this.btnLabelArr[_loc2_ - 1]);
               _loc3_.push(this.btnLabelArr[_loc2_]);
               _loc3_.push(this.btnLabelArr[_loc2_ + 1]);
            }
            else
            {
               _loc3_.push(this.btnLabelArr[_loc2_ - 2]);
               _loc3_.push(this.btnLabelArr[_loc2_ - 1]);
               _loc3_.push(this.btnLabelArr[_loc2_]);
            }
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            this.tabBar.addButton(_loc3_[_loc4_],this.onTabClick);
            _loc4_++;
         }
         if(param1 < 20)
         {
            this.tabBar.addButton(LanResManager.getLanTextWords(AnqiActivation,"激活开启"),this.onTabClick);
         }
         this.tabBar.setCurrentButtonByLabel(this.currnetLabel);
         var _loc5_:int = int(GameInstance.mainCharData.goodsInfo.goodsDepotArr.length);
         var _loc6_:int = GameInstance.mainCharData.attributeInfo.depotCount;
      }
      
      public function resumeCurrnetLabel() : void
      {
         this.tabBar.setCurrentButtonByLabel(this.currnetLabel);
      }
      
      public function setItem(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         var _loc5_:BaseItem = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         while(this.slots.numChildren > 0)
         {
            _loc2_ = this.slots.getChildAt(0) as ItemFace;
            this.slots.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc4_:int = int(param1.length);
         this.count.text = _loc4_ + "/30";
         var _loc6_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1[_loc3_];
            _loc8_ = ItemPositionRange.GOODS_IN_STORAGE_RANGE.x;
            if(_loc5_.position > _loc8_ + 29)
            {
               _loc7_ = (_loc5_.position - _loc8_) % 30 + _loc8_;
            }
            else
            {
               _loc7_ = _loc5_.position;
            }
            _loc2_ = new ItemFace(_loc5_);
            _loc2_.showRedMask();
            switch(_loc7_)
            {
               case _loc8_:
                  _loc2_.x = 0;
                  _loc2_.y = 0;
                  break;
               case _loc8_ + 1:
                  _loc2_.x = 38;
                  _loc2_.y = 0;
                  break;
               case _loc8_ + 2:
                  _loc2_.x = 38 * 2;
                  _loc2_.y = 0;
                  break;
               case _loc8_ + 3:
                  _loc2_.x = 38 * 3;
                  _loc2_.y = 0;
                  break;
               case _loc8_ + 4:
                  _loc2_.x = 38 * 4;
                  _loc2_.y = 0;
                  break;
               case _loc8_ + 5:
                  _loc2_.x = 38 * 5;
                  _loc2_.y = 0;
                  break;
               case _loc8_ + 6:
                  _loc2_.x = 0;
                  _loc2_.y = 38;
                  break;
               case _loc8_ + 7:
                  _loc2_.x = 38;
                  _loc2_.y = 38;
                  break;
               case _loc8_ + 8:
                  _loc2_.x = 38 * 2;
                  _loc2_.y = 38;
                  break;
               case _loc8_ + 9:
                  _loc2_.x = 38 * 3;
                  _loc2_.y = 38;
                  break;
               case _loc8_ + 10:
                  _loc2_.x = 38 * 4;
                  _loc2_.y = 38;
                  break;
               case _loc8_ + 11:
                  _loc2_.x = 38 * 5;
                  _loc2_.y = 38;
                  break;
               case _loc8_ + 12:
                  _loc2_.x = 0;
                  _loc2_.y = 38 * 2;
                  break;
               case _loc8_ + 13:
                  _loc2_.x = 38;
                  _loc2_.y = 38 * 2;
                  break;
               case _loc8_ + 14:
                  _loc2_.x = 38 * 2;
                  _loc2_.y = 38 * 2;
                  break;
               case _loc8_ + 15:
                  _loc2_.x = 38 * 3;
                  _loc2_.y = 38 * 2;
                  break;
               case _loc8_ + 16:
                  _loc2_.x = 38 * 4;
                  _loc2_.y = 38 * 2;
                  break;
               case _loc8_ + 17:
                  _loc2_.x = 38 * 5;
                  _loc2_.y = 38 * 2;
                  break;
               case _loc8_ + 18:
                  _loc2_.x = 0;
                  _loc2_.y = 38 * 3;
                  break;
               case _loc8_ + 19:
                  _loc2_.x = 38;
                  _loc2_.y = 38 * 3;
                  break;
               case _loc8_ + 20:
                  _loc2_.x = 38 * 2;
                  _loc2_.y = 38 * 3;
                  break;
               case _loc8_ + 21:
                  _loc2_.x = 38 * 3;
                  _loc2_.y = 38 * 3;
                  break;
               case _loc8_ + 22:
                  _loc2_.x = 38 * 4;
                  _loc2_.y = 38 * 3;
                  break;
               case _loc8_ + 23:
                  _loc2_.x = 38 * 5;
                  _loc2_.y = 38 * 3;
                  break;
               case _loc8_ + 24:
                  _loc2_.x = 0;
                  _loc2_.y = 38 * 4;
                  break;
               case _loc8_ + 25:
                  _loc2_.x = 38;
                  _loc2_.y = 38 * 4;
                  break;
               case _loc8_ + 26:
                  _loc2_.x = 38 * 2;
                  _loc2_.y = 38 * 4;
                  break;
               case _loc8_ + 27:
                  _loc2_.x = 38 * 3;
                  _loc2_.y = 38 * 4;
                  break;
               case _loc8_ + 28:
                  _loc2_.x = 38 * 4;
                  _loc2_.y = 38 * 4;
                  break;
               case _loc8_ + 29:
                  _loc2_.x = 38 * 5;
                  _loc2_.y = 38 * 4;
            }
            this.slots.addChild(_loc2_);
            _loc6_.push(_loc2_);
            _loc3_++;
         }
         CDFaceManager.registerItemFace_batch(_loc6_);
      }
      
      public function setMoney(param1:Number) : void
      {
         this.money.text = param1.toString();
      }
      
      public function showSavePanel(param1:Number) : void
      {
         var _loc2_:SavePanel = new SavePanel();
         _loc2_.$parent = this;
         _loc2_.visible = true;
         _loc2_.setTotal(param1);
         POPWindowManager.showWindow(_loc2_);
      }
      
      public function showGetPanel(param1:Number) : void
      {
         var _loc2_:GetPanel = new GetPanel();
         _loc2_.$parent = this;
         _loc2_.setTotal(param1);
         _loc2_.visible = true;
         POPWindowManager.showWindow(_loc2_);
      }
      
      public function showJiHuoPanel(param1:int, param2:Goods, param3:Boolean = true) : void
      {
         var _loc4_:DepotExpandPanel = new DepotExpandPanel();
         _loc4_.$parent = this;
         if(param2.id == SpecialGoodsID.KUOZHANFU)
         {
            _loc4_.show(param1,param2,param3);
            POPWindowManager.showWindow(_loc4_);
         }
         else if(param2.id == SpecialGoodsID.KUOZHANFU_SUPER)
         {
            _loc4_.showChaoji(param1,param2,param3);
            POPWindowManager.showWindow(_loc4_);
         }
      }
   }
}

