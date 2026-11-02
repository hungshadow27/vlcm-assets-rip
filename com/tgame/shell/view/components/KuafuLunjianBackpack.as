package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.ReloginManager;
   import com.tgame.shell.view.components.kuafulunjianBackpack.KuafuLjianItemSplitPanel;
   import com.tgame.shell.view.components.kuafulunjianBackpack.KuafuLunjianItemDestroyPanel;
   import com.tgame.shell.view.components.kuafulunjianBackpack.KuafuLunjianRideSkillStudyPanel;
   import com.tgame.shell.view.components.kuafulunjianBackpack.KuafuLunjianXingShouLiBaoPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.CDFaceManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class KuafuLunjianBackpack extends FPanel
   {
      
      public static const UI_KUAFULUNJIANBACKPACK_DRAG_STRAT:String = "UI_KUAFULUNJIANBACKPACK_DRAG_STRAT";
      
      public static const UI_KUAFULUNJIANBACKPACK_JIANGLI_DRAG_STRAT:String = "UI_KUAFULUNJIANBACKPACK_JIANGLI_DRAG_STRAT";
      
      public static const GETSHOWITEMMENU_KUAFULUNJIAN:String = "ui.backpack.getmenu";
      
      public static const UI_KUAFULUNJIAN_SPLITITEM:String = "UI_KUAFULUNJIAN_SPLITITEM";
      
      public static const UI_KUAFULUNJIAN_DESTROYITEM:String = "UI_KUAFULUNJIAN_XINSHOULIBAO_OPEN";
      
      public static const UI_KUAFULUNJIAN_XINSHOULIBAO_OPEN:String = "UI_KUAFULUNJIAN_XINSHOULIBAO_OPEN";
      
      public static const UI_KUAFULUNJIAN_RIDE_SKILL_STUDY:String = "UI_KUAFULUNJIAN_RIDE_SKILL_STUDY";
      
      public static const UI_KUAFULUNJIAN_BATCHSAVE_GET:String = "UI_KUAFULUNJIAN_BATCHSAVE_GET";
      
      public static const UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK:String = "UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK";
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var Zcft:FTextArea;
      
      private var ft:FTextArea;
      
      private var fta2:FTextArea;
      
      private var ftaYB:FTextArea;
      
      public var plcqBtn:SecondButton;
      
      public var lqsyBtn:SecondButton;
      
      public var slots:Sprite;
      
      public var jiangliSprite:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var xinshoulibao:KuafuLunjianXingShouLiBaoPanel;
      
      private var splitPanel:KuafuLjianItemSplitPanel;
      
      private var destroyPanel:KuafuLunjianItemDestroyPanel;
      
      private var bgImg:F9GridBitmap;
      
      private var img:Bitmap;
      
      private var fta4:FTextArea;
      
      public function KuafuLunjianBackpack()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var i:int;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 313;
         height = 405;
         titleText = LanResManager.getLanCommonTextWords("跨服包裹");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.kuafu.backpack.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         this.fta4 = new FTextArea();
         addChild(this.fta4);
         with(this.fta4)
         {
            x = 14;
            y = 4;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanTextWords(this,"跨服战场") + "</textformat>";
         }
         this.Zcft = new FTextArea();
         addChild(this.Zcft);
         with(this.Zcft)
         {
            x = 150;
            y = 4;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         this.fta1 = new FTextArea();
         addChild(this.fta1);
         with(this.fta1)
         {
            x = 100 - 5;
            y = 22;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         this.fta2 = new FTextArea();
         addChild(this.fta2);
         with(this.fta2)
         {
            x = 150 - 12;
            y = 22;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'5\'>" + LanResManager.getLanCommonTextWords("所获真气：") + "</textformat>";
         }
         this.slots = new Sprite();
         with(this.slots)
         {
            x = 15;
            y = 100;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,225,187);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         addChild(this.slots);
         this.slots.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.slots.addEventListener(MouseEvent.MOUSE_UP,this.showMenu,false,30);
         this.plcqBtn = new SecondButton();
         addChild(this.plcqBtn);
         this.plcqBtn.label = LanResManager.getLanCommonTextWords("批量存取");
         this.plcqBtn.x = 76;
         this.plcqBtn.y = 340;
         this.plcqBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lqsyBtn = new SecondButton();
         addChild(this.lqsyBtn);
         this.lqsyBtn.label = LanResManager.getLanCommonTextWords("领取收益");
         this.lqsyBtn.x = 175;
         this.lqsyBtn.y = 340;
         this.lqsyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         addChild(this.fta);
         with(this.fta)
         {
            x = 14;
            y = 294;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"本包裹将与跨服战场连通1") + "</textformat>";
         }
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 252;
            y = 4;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("奖励物品") + "</textformat>";
         }
         addChild(this.ft);
         this.bgImg = Tools.get9GridBitmpByName("kuafubaoguo_bg");
         addChild(this.bgImg);
         this.bgImg.height = 329;
         this.bgImg.x = 243;
         this.bgImg.y = 0;
         i = 0;
         while(i < 8)
         {
            this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.img.x = 257;
            this.img.y = 38 * i + 22;
            addChild(this.img);
            i++;
         }
         this.jiangliSprite = new Sprite();
         with(this.jiangliSprite)
         {
            x = 259;
            y = 24;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,40,305);
            graphics.endFill();
            doubleClickEnabled = false;
         }
         addChild(this.jiangliSprite);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.plcqBtn:
               dispatchEvent(new BaseEvent(UI_KUAFULUNJIAN_BATCHSAVE_GET));
               break;
            case this.lqsyBtn:
               dispatchEvent(new BaseEvent(UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK));
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
            if(ReloginManager.isInKuafu)
            {
               _loc3_ = ItemPositionRange.GOODS_IN_BAG_RANGE.x;
            }
            else
            {
               _loc3_ = ItemPositionRange.GOODS_IN_BAG_KUAFU_RANGE.x;
            }
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
            dispatchEvent(new BaseEvent(GETSHOWITEMMENU_KUAFULUNJIAN,"",[param1,_loc2_]));
         }
         this.slots.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function setZhanchang(param1:Array) : void
      {
         var _loc2_:String = LanResManager.getLanCommonTextWords("跨服战场：") + param1[0] + "<br>";
         var _loc3_:String = "";
         var _loc4_:int = 0;
         var _loc5_:int = 1;
         while(_loc5_ < param1.length)
         {
            if(param1[_loc5_] > 0)
            {
               if(_loc4_ % 2 == 0)
               {
                  _loc2_ += this.getTitile(_loc5_) + param1[_loc5_] + "<br>";
               }
               else
               {
                  _loc3_ += this.getTitile(_loc5_) + param1[_loc5_] + "<br>";
               }
               _loc4_++;
            }
            _loc5_++;
         }
         this.fta4.htmlText = "<textformat leading=\'5\'>" + _loc2_ + "</textformat>";
         this.fta2.htmlText = "<textformat leading=\'5\'>" + _loc3_ + "</textformat>";
      }
      
      public function getTitile(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return LanResManager.getLanCommonTextWords("所获经验：");
            case 2:
               return LanResManager.getLanCommonTextWords("所获声望：");
            case 3:
               return LanResManager.getLanCommonTextWords("所获铜币：");
            case 4:
               return LanResManager.getLanCommonTextWords("所获真气：");
            case 5:
               return LanResManager.getLanCommonTextWords("战场积分：");
            case 6:
               return LanResManager.getLanCommonTextWords("所获元宝：");
            case 7:
               return LanResManager.getLanCommonTextWords("所获威望：");
            case 8:
               return LanResManager.getLanCommonTextWords("所获功勋：");
            case 9:
               return LanResManager.getLanCommonTextWords("所获武魂：");
            default:
               return "";
         }
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
         var _loc6_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1[_loc3_];
            if(ReloginManager.isInKuafu)
            {
               _loc8_ = ItemPositionRange.GOODS_IN_BAG_RANGE.x;
            }
            else
            {
               _loc8_ = ItemPositionRange.GOODS_IN_BAG_KUAFU_RANGE.x;
            }
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
      
      public function setJiangliItem(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         while(this.jiangliSprite.numChildren > 0)
         {
            _loc2_ = this.jiangliSprite.getChildAt(0) as ItemFace;
            this.jiangliSprite.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = new ItemFace(param1[_loc3_]);
            _loc2_.showRedMask();
            _loc2_.x = 0;
            _loc2_.y = 38 * _loc3_;
            this.jiangliSprite.addChild(_loc2_);
            _loc3_++;
         }
      }
      
      public function moveItem() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         while(this.jiangliSprite.numChildren > 0)
         {
            _loc1_ = this.jiangliSprite.getChildAt(0) as ItemFace;
            _loc2_ = localToGlobal(new Point((this.jiangliSprite.getChildAt(0) as ItemFace).x + 243,(this.jiangliSprite.getChildAt(0) as ItemFace).y));
            _loc3_ = GameInstance.uiInstance.mainUI.getFunctionContainerXY();
            ItemMoveMovieManager.move(_loc1_,_loc2_.x,_loc2_.y,_loc3_.x + 85,_loc3_.y,1,2);
         }
      }
      
      public function showItemSplitPanel(param1:int) : void
      {
         if(this.splitPanel == null)
         {
            this.splitPanel = new KuafuLjianItemSplitPanel();
            this.splitPanel.$parent = this;
         }
         this.splitPanel.setTotal(param1);
         this.splitPanel.visible = true;
         POPWindowManager.showWindow(this.splitPanel);
      }
      
      public function showItemDestroyPanel(param1:Goods) : void
      {
         if(this.destroyPanel == null)
         {
            this.destroyPanel = new KuafuLunjianItemDestroyPanel();
            this.destroyPanel.$parent = this;
         }
         this.destroyPanel.setItem(param1);
         this.destroyPanel.visible = true;
         POPWindowManager.showWindow(this.destroyPanel);
      }
      
      public function showXinShouLiBao(param1:int, param2:Array, param3:int, param4:int, param5:Boolean) : void
      {
         if(this.xinshoulibao == null)
         {
            this.xinshoulibao = new KuafuLunjianXingShouLiBaoPanel();
         }
         addChild(this.xinshoulibao);
         this.xinshoulibao.$parent = this;
         this.xinshoulibao.visible = true;
         this.xinshoulibao.x = (width - this.xinshoulibao.width) / 2;
         this.xinshoulibao.y = (height - this.xinshoulibao.height) / 2;
         this.xinshoulibao.setItem(param1,param2,param3,param4,param5);
      }
      
      public function showRideSkillStudyPanel(param1:Goods) : void
      {
         var _loc2_:KuafuLunjianRideSkillStudyPanel = new KuafuLunjianRideSkillStudyPanel();
         _loc2_.$parent = this;
         _loc2_.setSkill(param1);
         POPWindowManager.showWindow(_loc2_);
      }
   }
}

