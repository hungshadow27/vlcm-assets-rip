package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NumberFormatter;
   import com.tgame.shell.view.components.backpack.BackpackExpandPanel;
   import com.tgame.shell.view.components.backpack.ItemDestroyPanel;
   import com.tgame.shell.view.components.backpack.ItemSplitPanel;
   import com.tgame.shell.view.components.backpack.RideSkillStudyPanel;
   import com.tgame.shell.view.components.backpack.SafeUnlock;
   import com.tgame.shell.view.components.backpack.UpdateSafeLock;
   import com.tgame.shell.view.components.backpack.XingShouLiBaoPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.CDFaceManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.setTimeout;
   
   public class Backpack extends FPanel
   {
      
      public static const GETBACKPACKITEM:String = "ui.backpack.getitem";
      
      public static const GETSAFESTATE:String = "GETSAFESTATE";
      
      public static const GETSHOWITEMMENU:String = "ui.backpack.getmenu";
      
      public static const UI_BACKPACK_DOUBLICCLICK:String = "ui.backpack.UI_BACKPACK_DOUBLICCLICK";
      
      public static const UI_BACKPACK_JIHUO_BACKPACK:String = "UI_BACKPACK_JIHUO_BACKPACK";
      
      public static const UI_BACKPACK_JIHUO_BACKPACK_OK:String = "UI_BACKPACK_JIHUO_BACKPACK_OK";
      
      public static const NEATENBACKPACK:String = "ui.backpack.neaten";
      
      public static const UI_BACKPACK_SHOPLISTBTN_CLICK:String = "UI_BACKPACK_SHOPLISTBTN_CLICK";
      
      public static const UI_BACKPACK_MYSHOPBTN_CLICK:String = "UI_BACKPACK_MYSHOPBTN_CLICK";
      
      public static const UI_BACKPACK_SPLITITEM:String = "UI_BACKPACK_SPLITITEM";
      
      public static const UI_BACKPACK_DESTROYITEM:String = "UI_BACKPACK_DESTROYITEM";
      
      public static const UI_BACKPACK_XINSHOULIBAO_OPEN:String = "UI_BACKPACK_XINSHOULIBAO_OPEN";
      
      public static const UI_BACKPACK_DRAG_STRAT:String = "UI_BACKPACK_DRAG_STRAT";
      
      public static const UI_BACKPACK_RIDE_SKILL_STUDY:String = "UI_BACKPACK_RIDE_SKILL_STUDY";
      
      public static const UI_BACKPACK_JIESUO_CLICK:String = "UI_BACKPACK_JIESUO_CLICK";
      
      public static const UI_BAKCPACK_ADDPWD:String = "UI_BAKCPACK_ADDPWD";
      
      public static const UI_SAFEUNLOCK_CLICK:String = "UI_SAFEUNLOCK_CLICK";
      
      public static const UI_SETSAFELOCK_CLICK:String = "UI_SETSAFELOCK_CLICK";
      
      public static const UI_YIWANGLOCK_CLICK:String = "UI_YIWANGLOCK_CLICK";
      
      public static const UI_POCHULOCK_CLICK:String = "UI_POCHULOCK_CLICK";
      
      public static const UI_QUXIAOLOCK_CLICK:String = "UI_QUXIAOLOCK_CLICK";
      
      private var tabBar:FTabBar;
      
      private var count:FLabel;
      
      private var neatenBtn:SmallButton;
      
      private var shopListBtn:SmallButton;
      
      private var myShopBtn:SmallButton;
      
      public var slots:Sprite;
      
      private var moneyTitle:FTextArea;
      
      private var money:FTextArea;
      
      private var currnetLabel:String;
      
      private var splitPanel:ItemSplitPanel;
      
      private var destroyPanel:ItemDestroyPanel;
      
      private var playerShopListPanel:PlayerShopListPanel;
      
      private var xinshoulibao:XingShouLiBaoPanel;
      
      private var safelockPanel:SafeUnlock;
      
      private var upsafelockPanel:UpdateSafeLock;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var stoneOptionPanel:StoneOptionSmallPanel;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var safeBtn:FSimpleButton;
      
      private var updateBtn:FSimpleButton;
      
      private var IsHaveLock:Boolean;
      
      private var IsSetLock:Boolean;
      
      private var qingLiBtn:SmallButton;
      
      public function Backpack()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var img:Bitmap;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 256;
         height = 363 + 25;
         this.titleText = LanResManager.getLanCommonTextWords("行囊");
         addEventListener(Event.ADDED_TO_STAGE,this.onAdd);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.tabBar = new FTabBar();
         addChild(this.tabBar);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         bg = new Bitmap();
         bg.name = "ui.char.backpack.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 22;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         this.count = new FLabel();
         addChild(this.count);
         this.count.x = 195 + 25;
         this.count.y = 4;
         this.count.textColor = StaticValue.BlUE50;
         this.count.text = "0/30";
         this.count.mouseEnabled = false;
         this.slots = new Sprite();
         with(this.slots)
         {
            x = 16;
            y = 28;
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,225,187);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         addChild(this.slots);
         this.slots.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.slots.addEventListener(MouseEvent.MOUSE_UP,this.showMenu,false,30);
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.neatenBtn = new SmallButton();
         addChild(this.neatenBtn);
         this.neatenBtn.label = LanResManager.getLanCommonTextWords("整理包裹");
         this.neatenBtn.x = 12;
         this.neatenBtn.y = 225;
         this.neatenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.qingLiBtn = new SmallButton();
         this.qingLiBtn.label = LanResManager.getLanCommonTextWords("一键清理");
         this.qingLiBtn.x = 70;
         this.qingLiBtn.y = 225;
         this.qingLiBtn.toolTip = "< font color = \'" + StaticValue.RED_HTML + "\' > " + LanResManager.getLanCommonTextWords("一键清除过期道具") + "</font>";
         this.qingLiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shopListBtn = new SmallButton();
         addChild(this.shopListBtn);
         this.shopListBtn.label = LanResManager.getLanCommonTextWords("摊位列表");
         this.shopListBtn.x = 130;
         this.shopListBtn.y = 225;
         this.shopListBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.myShopBtn = new SmallButton();
         addChild(this.myShopBtn);
         this.myShopBtn.label = LanResManager.getLanCommonTextWords("随身摊位");
         this.myShopBtn.x = 189;
         this.myShopBtn.y = 225;
         this.myShopBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.moneyTitle = new FTextArea();
         addChild(this.moneyTitle);
         with(this.moneyTitle)
         {
            x = 40 - 10;
            y = 252;
            width = 58 + 10;
            height = 105;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            multiline = true;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"游戏铜钱1") + "</textformat>";
         }
         this.moneyTitle.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
         this.moneyTitle.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 97;
         img.y = 253;
         img = StaticValue.getBitmapByClassName("ui.ico.money.silver");
         addChild(img);
         img.x = 97;
         img.y = 275;
         img = StaticValue.getBitmapByClassName("ui.ico.money.lijin");
         addChild(img);
         img.x = 97;
         img.y = 297;
         img = StaticValue.getBitmapByClassName("ui.ico.money.jinpiao");
         addChild(img);
         img.x = 101;
         img.y = 319;
         this.money = new FTextArea();
         with(this.money)
         {
            x = 122;
            y = 252;
            width = 150;
            height = 105;
            textColor = StaticValue.YELLOW;
            multiline = true;
         }
         addChild(this.money);
         this.safeBtn = new FSimpleButton();
         this.safeBtn.skin = "unlockButton";
         addChild(this.safeBtn);
         this.safeBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("输入密码进行解锁") + "</font>";
         addChild(this.safeBtn);
         this.safeBtn.x = 215;
         this.safeBtn.y = 253;
         this.safeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.updateBtn = new FSimpleButton();
         this.updateBtn.skin = "setlockButton";
         addChild(this.updateBtn);
         this.updateBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("设置和更改密码") + "</font>";
         addChild(this.updateBtn);
         this.updateBtn.x = 215;
         this.updateBtn.y = 275;
         this.updateBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onAdd(param1:Event) : void
      {
         dispatchEvent(new BaseEvent(GETSAFESTATE));
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("一"):
               dispatchEvent(new BaseEvent(GETBACKPACKITEM,"",1));
               break;
            case LanResManager.getLanCommonTextWords("二"):
               dispatchEvent(new BaseEvent(GETBACKPACKITEM,"",2));
               break;
            case LanResManager.getLanCommonTextWords("三"):
               dispatchEvent(new BaseEvent(GETBACKPACKITEM,"",3));
               break;
            case LanResManager.getLanCommonTextWords("四"):
               dispatchEvent(new BaseEvent(GETBACKPACKITEM,"",4));
               break;
            case LanResManager.getLanCommonTextWords("五"):
               dispatchEvent(new BaseEvent(GETBACKPACKITEM,"",5));
               break;
            case LanResManager.getLanCommonTextWords("六"):
               dispatchEvent(new BaseEvent(GETBACKPACKITEM,"",6));
               break;
            case LanResManager.getLanCommonTextWords("七"):
               dispatchEvent(new BaseEvent(GETBACKPACKITEM,"",7));
               break;
            case LanResManager.getLanCommonTextWords("八"):
               dispatchEvent(new BaseEvent(GETBACKPACKITEM,"",8));
               break;
            case LanResManager.getLanCommonTextWords("九"):
               dispatchEvent(new BaseEvent(GETBACKPACKITEM,"",9));
               break;
            case LanResManager.getLanCommonTextWords("十"):
               dispatchEvent(new BaseEvent(GETBACKPACKITEM,"",10));
               break;
            case LanResManager.getLanCommonTextWords("激活"):
               this.currnetLabel = this.tabBar.currentLabel;
               dispatchEvent(new BaseEvent(UI_BACKPACK_JIHUO_BACKPACK));
               setTimeout(this.resumeCurrnetLabel,500);
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
            dispatchEvent(new BaseEvent(UI_BACKPACK_DRAG_STRAT,"",this.currItem));
            this.slots.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.moneyTitle.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.moneyTitle.getCharIndexAtPoint(this.moneyTitle.mouseX,this.moneyTitle.mouseY);
               if(_loc2_ >= this.moneyTitle.text.indexOf(LanResManager.getLanCommonTextWords("游戏铜钱")) && _loc2_ <= this.moneyTitle.text.indexOf(LanResManager.getLanCommonTextWords("游戏铜钱")) + 3)
               {
                  this.showTip("<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"铜钱可通过完成任务") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"铜钱可用于购买各种NPC商店中的武器") + "</font></textformat>");
               }
               else if(!(_loc2_ >= this.moneyTitle.text.indexOf(LanResManager.getLanCommonTextWords("商城元宝")) && _loc2_ <= this.moneyTitle.text.indexOf(LanResManager.getLanCommonTextWords("商城元宝")) + 3))
               {
                  if(_loc2_ >= this.moneyTitle.text.indexOf(LanResManager.getLanCommonTextWords("商城礼金")) && _loc2_ <= this.moneyTitle.text.indexOf(LanResManager.getLanCommonTextWords("商城礼金")) + 3)
                  {
                     this.showTip("<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"礼金在您达成新的成就之后") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"礼金可在主界面的商城面板中购买礼金分类中的珍稀付费道具") + "</font></textformat>");
                  }
                  else if(_loc2_ >= this.moneyTitle.text.indexOf(LanResManager.getLanCommonTextWords("商城金票")) && _loc2_ <= this.moneyTitle.text.indexOf(LanResManager.getLanCommonTextWords("商城金票")) + 3)
                  {
                     this.showTip("<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【金票】通过宝石鉴赏活动，可获得金票奖励") + "</font><br><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"金票可用于购买商城道具，但不能用于玩家之间的交易。金票元宝，当玩家同时拥有金票和元宝时，自动优先使用金票来购买道具。") + "</font></textformat>");
                  }
                  else if(this.tipCanvas.parent != null)
                  {
                     this.tipCanvas.parent.removeChild(this.tipCanvas);
                  }
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.moneyTitle.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function showMenu(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1.target as ItemFace)
         {
            dispatchEvent(new BaseEvent(Backpack.GETSHOWITEMMENU,"",[param1,null]));
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = ItemPositionRange.GOODS_IN_BAG_RANGE.x;
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
            switch(this.tabBar.currentLabel)
            {
               case LanResManager.getLanCommonTextWords("一"):
                  break;
               case LanResManager.getLanCommonTextWords("二"):
                  _loc2_ += 30;
                  break;
               case LanResManager.getLanCommonTextWords("三"):
                  _loc2_ += 60;
                  break;
               case LanResManager.getLanCommonTextWords("四"):
                  _loc2_ += 90;
                  break;
               case LanResManager.getLanCommonTextWords("五"):
                  _loc2_ += 120;
                  break;
               case LanResManager.getLanCommonTextWords("六"):
                  _loc2_ += 150;
                  break;
               case LanResManager.getLanCommonTextWords("七"):
                  _loc2_ += 180;
                  break;
               case LanResManager.getLanCommonTextWords("八"):
                  _loc2_ += 210;
                  break;
               case LanResManager.getLanCommonTextWords("九"):
                  _loc2_ += 240;
                  break;
               case LanResManager.getLanCommonTextWords("十"):
                  _loc2_ += 270;
            }
            dispatchEvent(new BaseEvent(Backpack.GETSHOWITEMMENU,"",[param1,_loc2_]));
         }
         this.slots.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var type:int = 0;
         var e:MouseEvent = param1;
         switch(e.target)
         {
            case this.neatenBtn:
               this.neatenBtn.enabled = false;
               setTimeout(function():void
               {
                  neatenBtn.enabled = true;
               },5000);
               dispatchEvent(new BaseEvent(NEATENBACKPACK,"",0));
               break;
            case this.qingLiBtn:
               dispatchEvent(new BaseEvent(NEATENBACKPACK,"",1));
               break;
            case this.shopListBtn:
               dispatchEvent(new BaseEvent(UI_BACKPACK_SHOPLISTBTN_CLICK));
               break;
            case this.myShopBtn:
               dispatchEvent(new BaseEvent(UI_BACKPACK_MYSHOPBTN_CLICK));
               break;
            case this.safeBtn:
               type = 0;
               if(this.safeBtn.skin == "lockButton")
               {
                  type = 1;
               }
               else
               {
                  type = 2;
               }
               if(this.IsHaveLock)
               {
                  dispatchEvent(new BaseEvent(UI_BACKPACK_JIESUO_CLICK,"",type));
                  break;
               }
               FAlert.show(LanResManager.getLanCommonTextWords("请您先设置安全锁！"));
               return;
               break;
            case this.updateBtn:
               type = -1;
               if(this.IsHaveLock)
               {
                  type = 2;
               }
               else
               {
                  type = 1;
               }
               dispatchEvent(new BaseEvent(UI_BAKCPACK_ADDPWD,"",type));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(Boolean(this.xinshoulibao) && Boolean(this.xinshoulibao.parent))
         {
            this.xinshoulibao.parent.removeChild(this.xinshoulibao);
         }
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setBackpackCount(param1:int) : void
      {
         if(param1 == 1)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("一"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("激活"),this.onTabClick);
         }
         else if(param1 == 2)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("一"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("二"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("激活"),this.onTabClick);
         }
         else if(param1 == 3)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("一"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("二"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("三"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("激活"),this.onTabClick);
         }
         else if(param1 == 4)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("一"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("二"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("三"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("四"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("激活"),this.onTabClick);
         }
         else if(param1 == 5)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("一"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("二"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("三"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("四"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("激活"),this.onTabClick);
         }
         else if(param1 == 6)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("一"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("二"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("三"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("四"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("六"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("激活"),this.onTabClick);
         }
         else if(param1 == 7)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("一"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("二"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("三"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("四"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("六"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("七"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("激活"),this.onTabClick);
         }
         else if(param1 == 8)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("一"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("二"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("三"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("四"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("六"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("七"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("八"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("激活"),this.onTabClick);
         }
         else if(param1 == 9)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("一"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("二"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("三"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("四"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("六"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("七"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("八"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("九"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("激活"),this.onTabClick);
         }
         else if(param1 == 10)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("一"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("二"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("三"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("四"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("五"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("六"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("七"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("八"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("九"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("十"),this.onTabClick);
         }
         this.tabBar.resize();
         this.tabBar.setCurrentButtonByLabel(this.currnetLabel);
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
            _loc8_ = ItemPositionRange.GOODS_IN_BAG_RANGE.x;
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
      
      public function setMoney(param1:Array) : void
      {
         this.money.htmlText = "<textformat leading=\'7\'>" + NumberFormatter.formatThousands(param1[0]) + "<br>" + NumberFormatter.formatThousands(param1[1]) + "<br>" + NumberFormatter.formatThousands(param1[2]) + "<br>" + NumberFormatter.formatThousands(param1[3]) + "</textformat>";
      }
      
      public function showItemSplitPanel(param1:int) : void
      {
         if(this.splitPanel == null)
         {
            this.splitPanel = new ItemSplitPanel();
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
            this.destroyPanel = new ItemDestroyPanel();
            this.destroyPanel.$parent = this;
         }
         this.destroyPanel.setItem(param1);
         this.destroyPanel.visible = true;
         POPWindowManager.showWindow(this.destroyPanel);
      }
      
      public function showJiHuoBackpackPanel(param1:int, param2:Goods, param3:Boolean = true) : void
      {
         var _loc4_:BackpackExpandPanel = new BackpackExpandPanel();
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
         else if(param2.id == SpecialGoodsID.KUOZHANFU_QIANKUN)
         {
            _loc4_.showChaoji(param1,param2,param3);
            _loc4_.showBuyBtn(false);
            POPWindowManager.showWindow(_loc4_);
         }
      }
      
      public function setPlayerShopList(param1:XML, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.playerShopListPanel.setShopList(param1,param2,param3,param4,param5);
      }
      
      public function set functionBtnEnalbe(param1:Boolean) : void
      {
         this.qingLiBtn.enabled = this.neatenBtn.enabled = this.shopListBtn.enabled = this.myShopBtn.enabled = param1;
      }
      
      public function showXinShouLiBao(param1:int, param2:Array, param3:int, param4:int, param5:Boolean) : void
      {
         if(this.xinshoulibao == null)
         {
            this.xinshoulibao = new XingShouLiBaoPanel();
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
         var _loc2_:RideSkillStudyPanel = new RideSkillStudyPanel();
         _loc2_.$parent = this;
         _loc2_.setSkill(param1);
         POPWindowManager.showWindow(_loc2_);
      }
      
      public function setType(param1:Boolean) : void
      {
         this.shopListBtn.enabled = !param1;
         this.myShopBtn.enabled = !param1;
      }
      
      public function setSafeState(param1:Boolean) : void
      {
         this.IsSetLock = param1;
         if(param1)
         {
            this.safeBtn.skin = "unlockButton";
         }
         else
         {
            this.safeBtn.skin = "lockButton";
         }
      }
      
      public function isHave(param1:Boolean) : void
      {
         this.IsHaveLock = param1;
         if(param1)
         {
            if(this.IsSetLock)
            {
               this.safeBtn.skin = "unlockButton";
            }
            else
            {
               this.safeBtn.skin = "lockButton";
            }
         }
         else
         {
            this.safeBtn.skin = "nosetlockButton";
         }
      }
      
      public function showSafeLockPanel(param1:int) : void
      {
         if(this.safelockPanel == null)
         {
            this.safelockPanel = new SafeUnlock();
            this.safelockPanel.$parent = this;
         }
         this.safelockPanel.txtDesc(param1);
         this.safelockPanel.visible = true;
         POPWindowManager.showWindow(this.safelockPanel);
      }
      
      public function showUpdateSafeLockPanel() : void
      {
         if(this.upsafelockPanel == null)
         {
            this.upsafelockPanel = new UpdateSafeLock();
            this.upsafelockPanel.$parent = this;
         }
         this.upsafelockPanel.visible = true;
         POPWindowManager.showWindow(this.upsafelockPanel);
      }
      
      public function safeUnlockClose() : void
      {
         this.safelockPanel.onClose();
      }
      
      public function updateSafePanelClose() : void
      {
         this.upsafelockPanel.onClose();
      }
      
      public function posuo(param1:int) : void
      {
         this.upsafelockPanel.posuo(param1);
      }
   }
}

