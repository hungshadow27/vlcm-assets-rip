package com.tgame.shell.view.components.mainui
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.mainui.functionbar.CircleShow;
   import com.tgame.shell.view.components.mainui.functionbar.RectShow;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.CDFaceManager;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.getDefinitionByName;
   import gs.TweenMax;
   
   public class FunctionBar extends Sprite
   {
      
      public static const XUNZHANG_SHOW_COUNT:int = 5;
      
      public var _parent:DisplayObject;
      
      public var expBar:ColorBar;
      
      private var charBtn:SimpleButton;
      
      public var backpackBtn:SimpleButton;
      
      public var skillBtn:SimpleButton;
      
      public var rideBtn:SimpleButton;
      
      public var taskBtn:SimpleButton;
      
      private var teamBtn:SimpleButton;
      
      private var friendBtn:SimpleButton;
      
      private var partyBtn:SimpleButton;
      
      private var mallBtn:SimpleButton;
      
      private var studyBtn:SimpleButton;
      
      private var meirenBtn:SimpleButton;
      
      private var tulongdaoBtn:NewSkinButton;
      
      private var btnName1:FLabel;
      
      private var btnName2:FLabel;
      
      private var changeBtn:FSimpleButton;
      
      private var container:Sprite;
      
      public var rectBar:RectShow;
      
      public var circleBar:CircleShow;
      
      public var guideBar:GuideBar;
      
      private var rideSkillContainer:Sprite;
      
      private var biaoStr:String = "";
      
      private var biaoSpr:Sprite;
      
      private var biao:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var itemSpr:Sprite;
      
      private var itemSelectSpr:Sprite;
      
      private var img:Bitmap;
      
      private var goodsArr:Array;
      
      private var nowIndex:int = 0;
      
      private var upButton:FSimpleButton;
      
      private var downButton:FSimpleButton;
      
      private var curGoodsId:int;
      
      private var vipMc:MovieClip;
      
      private var vipMcsp:Sprite;
      
      public function FunctionBar()
      {
         var $class:Class;
         super();
         this.rectBar = new RectShow();
         addChild(this.rectBar);
         this.rectBar.x = 440;
         this.rectBar.y = 3;
         this.rectBar.visible = false;
         this.circleBar = new CircleShow();
         addChild(this.circleBar);
         this.circleBar.x = 410;
         this.circleBar.y = -39;
         this.guideBar = new GuideBar();
         addChild(this.guideBar);
         this.guideBar.x = 760;
         this.guideBar.y = -45;
         this.expBar = new ColorBar(5,938,7,false,false,true,LanResManager.getLanCommonTextWords("当前经验"),LanResManager.getLanCommonTextWords("本级经验"),"<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("通过日常任务，挂机打怪，闭关领取，打坐修炼等途径均可获得经验") + "</font>");
         addChild(this.expBar);
         this.expBar.x = 30;
         this.expBar.y = 50;
         this.expBar.setValue(1000,1000);
         addChild(StaticValue.getMCByClassName("ui.main.function"));
         this.container = new Sprite();
         addChild(this.container);
         with(this.container)
         {
            x = 253;
            y = 3;
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,191,35);
            graphics.drawRect(304,0,191,35);
            graphics.endFill();
         }
         this.container.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.container.addEventListener(MouseEvent.MOUSE_UP,this.onShortCutClick,false,30);
         $class = getDefinitionByName("ui.main.function.char") as Class;
         this.charBtn = new $class() as SimpleButton;
         $class = getDefinitionByName("ui.main.function.backpack") as Class;
         this.backpackBtn = new $class() as SimpleButton;
         $class = getDefinitionByName("ui.main.function.skill") as Class;
         this.skillBtn = new $class() as SimpleButton;
         $class = getDefinitionByName("ui.main.function.ride") as Class;
         this.rideBtn = new $class() as SimpleButton;
         $class = getDefinitionByName("ui.main.function.task") as Class;
         this.taskBtn = new $class() as SimpleButton;
         $class = getDefinitionByName("ui.main.function.meiren") as Class;
         this.meirenBtn = new $class() as SimpleButton;
         $class = getDefinitionByName("ui.main.function.team") as Class;
         this.teamBtn = new $class() as SimpleButton;
         $class = getDefinitionByName("ui.main.function.friend") as Class;
         this.friendBtn = new $class() as SimpleButton;
         $class = getDefinitionByName("ui.main.function.party") as Class;
         this.partyBtn = new $class() as SimpleButton;
         $class = getDefinitionByName("ui.main.function.mall") as Class;
         this.mallBtn = new $class() as SimpleButton;
         this.tulongdaoBtn = new NewSkinButton();
         this.tulongdaoBtn.skin = "yn2016tulongdaoBtn";
         addChild(this.charBtn);
         this.charBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.charBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.charBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.charBtn.x = 40;
         addChild(this.backpackBtn);
         this.backpackBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.backpackBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.backpackBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.backpackBtn.x = 80;
         addChild(this.skillBtn);
         this.skillBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.skillBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.skillBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.skillBtn.x = 120;
         addChild(this.rideBtn);
         this.rideBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rideBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.rideBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.rideBtn.x = 160;
         addChild(this.meirenBtn);
         this.meirenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.meirenBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.meirenBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.meirenBtn.x = 203;
         this.meirenBtn.y = -4;
         addChild(this.taskBtn);
         this.taskBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.taskBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.taskBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.taskBtn.x = 755;
         addChild(this.teamBtn);
         this.teamBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.teamBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.teamBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.teamBtn.x = 795;
         addChild(this.friendBtn);
         this.friendBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.friendBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.friendBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.friendBtn.x = 835;
         addChild(this.partyBtn);
         this.partyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.partyBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.partyBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.partyBtn.x = 875;
         addChild(this.mallBtn);
         this.mallBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.mallBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.mallBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.mallBtn.x = 915;
         if(Boolean(this.vipMc) && this.vipMc.parent != null)
         {
            this.vipMc.parent.removeChild(this.vipMc);
         }
         this.vipMcsp = new Sprite();
         if(this.vipMc == null)
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               vipMc = _loc2_.content as MovieClip;
               if(vipMc)
               {
                  vipMcsp.addChild(vipMc);
               }
            },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/tulongdao.swf");
         }
         else
         {
            this.vipMcsp.addChild(this.vipMc);
         }
         this.vipMcsp.x = 993;
         this.vipMcsp.y = -44;
         addChild(this.vipMcsp);
         this.tulongdaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tulongdaoBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.tulongdaoBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.tulongdaoBtn.x = 993;
         this.tulongdaoBtn.y = -44;
         addChild(this.tulongdaoBtn);
         this.changeBtn = new FSimpleButton();
         this.changeBtn.skin = "changeButton";
         this.changeBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("折叠/展开特殊操作按钮显示栏") + "</font>";
         this.changeBtn.x = 494;
         this.changeBtn.y = 40;
         this.changeBtn.addEventListener(MouseEvent.CLICK,this.onChange);
         this.rideSkillContainer = new Sprite();
         addChild(this.rideSkillContainer);
         this.rideSkillContainer.x = 253;
         this.rideSkillContainer.y = -37;
         this.rideSkillContainer.addEventListener(MouseEvent.CLICK,this.onSkill);
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
         this.biaoSpr = new Sprite();
         this.biaoSpr.x = 455;
         this.biaoSpr.y = -110;
         this.biaoSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onBiaoTip);
         this.biaoSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onBiaoTip);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.img.x = -2;
         this.img.y = -2;
         this.itemSpr = new Sprite();
         this.itemSpr.x = 555;
         this.itemSpr.y = -80;
         addChild(this.itemSpr);
         this.itemSpr.visible = false;
         this.itemSpr.addChild(this.img);
         this.itemSpr.addEventListener(MouseEvent.CLICK,this.onItemClick);
         this.itemSelectSpr = new Sprite();
         this.itemSelectSpr.x = 555;
         this.itemSelectSpr.y = -360;
         this.itemSelectSpr.visible = false;
         addChild(this.itemSelectSpr);
         this.itemSelectSpr.addEventListener(MouseEvent.MOUSE_DOWN,this.selectItemEvent);
         this.upButton = new FSimpleButton();
         this.upButton.skin = "equipListRightBtn";
         this.upButton.rotation = -90;
         this.upButton.addEventListener(MouseEvent.CLICK,this.onUpDownClick);
         this.downButton = new FSimpleButton();
         this.downButton.skin = "equipListRightBtn";
         this.downButton.rotation = 90;
         this.downButton.addEventListener(MouseEvent.CLICK,this.onUpDownClick);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.charBtn:
               this.showTip(LanResManager.getLanCommonTextWords("人物"));
               break;
            case this.backpackBtn:
               this.showTip(LanResManager.getLanCommonTextWords("包裹"));
               break;
            case this.skillBtn:
               this.showTip(LanResManager.getLanCommonTextWords("武功"));
               break;
            case this.rideBtn:
               this.showTip(LanResManager.getLanCommonTextWords("坐骑"));
               break;
            case this.taskBtn:
               this.showTip(LanResManager.getLanCommonTextWords("任务"));
               break;
            case this.teamBtn:
               this.showTip(LanResManager.getLanCommonTextWords("组队"));
               break;
            case this.friendBtn:
               this.showTip(LanResManager.getLanCommonTextWords("好友"));
               break;
            case this.partyBtn:
               this.showTip(LanResManager.getLanCommonTextWords("帮会"));
               break;
            case this.mallBtn:
               this.showTip(LanResManager.getLanCommonTextWords("商城"));
               break;
            case this.meirenBtn:
               this.showTip(LanResManager.getLanCommonTextWords("美人"));
               break;
            case this.tulongdaoBtn:
               this.showTip(LanResManager.getLanCommonTextWords("屠龙刀"));
         }
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         if(this.tipCanvas.parent != null)
         {
            this.tipCanvas.parent.removeChild(this.tipCanvas);
         }
      }
      
      public function showItemContainer(param1:Boolean) : void
      {
         this.itemSpr.visible = param1;
         if(this.itemSelectSpr)
         {
            this.itemSelectSpr.visible = false;
         }
      }
      
      public function setItem(param1:int) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:ItemFace = null;
         this.curGoodsId = param1;
         while(this.itemSpr.numChildren != 0)
         {
            this.itemSpr.removeChildAt(0);
         }
         this.itemSpr.addChild(this.img);
         if(param1 > 0)
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.goodsBodyDict[new Goods(param1).res.position];
            if(_loc2_ != undefined && _loc2_ != null)
            {
               _loc3_ = new ItemFace(_loc2_);
               this.itemSpr.addChild(_loc3_);
            }
         }
         this.nowIndex = 0;
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:Goods = null;
         this.nowIndex = 0;
         this.goodsArr = [];
         for each(_loc2_ in GameInstance.mainCharData.goodsInfo.goodsBodyArr)
         {
            if(_loc2_.res.position >= ItemPositionRange.POSITON_XINWEIZHI_XUNZHANG_ARR.x && _loc2_.res.position <= ItemPositionRange.POSITON_XINWEIZHI_XUNZHANG_ARR.y)
            {
               if(this.curGoodsId != _loc2_.id)
               {
                  this.goodsArr.push(_loc2_);
               }
            }
         }
         this.showItemList();
      }
      
      private function showItemList() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.itemSelectSpr.numChildren > 0)
         {
            this.itemSelectSpr.removeChildAt(0);
         }
         if(this.goodsArr.length == 0)
         {
            return;
         }
         this.itemSelectSpr.visible = true;
         if(this.goodsArr.length > XUNZHANG_SHOW_COUNT)
         {
            if(this.nowIndex < 0)
            {
               this.nowIndex += this.goodsArr.length;
            }
            else if(this.nowIndex >= this.goodsArr.length)
            {
               this.nowIndex -= this.goodsArr.length;
            }
            this.upButton.x = 10;
            this.upButton.y = 68;
            this.downButton.x = 28;
            this.downButton.y = 256;
            this.itemSelectSpr.addChild(this.upButton);
            this.itemSelectSpr.addChild(this.downButton);
            _loc1_ = 0;
            _loc2_ = this.nowIndex;
            while(_loc2_ % this.goodsArr.length < this.goodsArr.length)
            {
               _loc2_ %= this.goodsArr.length;
               _loc3_ = this.goodsArr[_loc2_];
               if(_loc3_ != null)
               {
                  _loc4_ = new ItemFace(_loc3_);
                  this.itemSelectSpr.addChild(_loc4_);
                  _loc4_.y = 72 + 36 * _loc1_;
                  _loc1_++;
               }
               if(_loc1_ == XUNZHANG_SHOW_COUNT)
               {
                  break;
               }
               _loc2_++;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < this.goodsArr.length)
            {
               _loc3_ = this.goodsArr[_loc2_];
               if(_loc3_ != null)
               {
                  _loc4_ = new ItemFace(_loc3_);
                  this.itemSelectSpr.addChild(_loc4_);
                  _loc4_.y = 234 - 36 * _loc2_;
               }
               _loc2_++;
            }
         }
      }
      
      private function selectItemEvent(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = null;
         if(param1.target is ItemFace)
         {
            this.itemSelectSpr.visible = false;
            _loc2_ = param1.target as ItemFace;
            parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_XUNZHANG_ITEM_CLICK,"",_loc2_.getBaseItem().id));
         }
      }
      
      private function onUpDownClick(param1:Event) : void
      {
         switch(param1.target)
         {
            case this.upButton:
               ++this.nowIndex;
               this.showItemList();
               break;
            case this.downButton:
               --this.nowIndex;
               this.showItemList();
         }
      }
      
      private function onSkill(param1:MouseEvent) : void
      {
         var _loc2_:int = ItemPositionRange.MOUNT_QUICK_BAR_RANGE.x + this.rideSkillContainer.mouseX % 39;
         parent.dispatchEvent(new BaseEvent(MainUI.FUNCITON_RIDE_SKILL_SHORTCUT_CLICK,"",[param1,_loc2_]));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.charBtn:
               parent.dispatchEvent(new Event(MainUI.FUNCTION_CHARBTN_CLICK));
               break;
            case this.backpackBtn:
               parent.dispatchEvent(new Event(MainUI.FUNCTION_BACKPACKBTN_CLICK));
               break;
            case this.skillBtn:
               parent.dispatchEvent(new Event(MainUI.FUNCTION_SKLLBTN_CLICK));
               break;
            case this.rideBtn:
               parent.dispatchEvent(new Event(MainUI.FUNCTION_RIDEBTN_CLICK));
               break;
            case this.taskBtn:
               parent.dispatchEvent(new Event(MainUI.FUNCTION_TASKBTN_CLICK));
               break;
            case this.teamBtn:
               parent.dispatchEvent(new Event(MainUI.FUNCTION_TEAMBTN_CLICK));
               break;
            case this.friendBtn:
               parent.dispatchEvent(new Event(MainUI.FUNCTION_FRIENDBTN_CLICK));
               break;
            case this.partyBtn:
               parent.dispatchEvent(new Event(MainUI.FUNCTION_STEUPBTN_CLICK));
               break;
            case this.mallBtn:
               parent.dispatchEvent(new Event(MainUI.FUNCTION_MALLBTN_CLICK));
               break;
            case this.meirenBtn:
               parent.dispatchEvent(new Event(MainUI.FUNCTION_MEIREN_CLICK));
               break;
            case this.tulongdaoBtn:
               PipeManager.sendMsg(PipeConstants.SHOW_YNTULONGDAOPANEL,-1);
         }
      }
      
      private function onChange(param1:MouseEvent) : void
      {
         this.circleBar.visible = !this.circleBar.visible;
         this.rectBar.visible = !this.rectBar.visible;
         PipeManager.sendMsg(PipeConstants.GET_BAGUAZHENMAINUI_SHOW_HIDE,this.circleBar.visible);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.container.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.container.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this._parent.dispatchEvent(new BaseEvent(MainUI.FUNCTION_SHORTCU_DRAG_STRAT,"",this.currItem));
            this.container.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onShortCutClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.target as ItemFace)
         {
            this._parent.dispatchEvent(new BaseEvent(MainUI.FUNCTION_SHORTCUT_CLICK,"",[param1,null]));
         }
         else
         {
            _loc2_ = -1;
            if(this.container.mouseX > 0 && this.container.mouseX < 39)
            {
               _loc2_ = 1;
            }
            if(this.container.mouseX > 39 && this.container.mouseX < 39 * 2)
            {
               _loc2_ = 2;
            }
            if(this.container.mouseX > 39 * 2 && this.container.mouseX < 39 * 3)
            {
               _loc2_ = 3;
            }
            if(this.container.mouseX > 39 * 3 && this.container.mouseX < 39 * 4)
            {
               _loc2_ = 4;
            }
            if(this.container.mouseX > 39 * 4 && this.container.mouseX < 39 * 5)
            {
               _loc2_ = 5;
            }
            if(this.container.mouseX > 39 * 5 + 109 && this.container.mouseX < 39 * 6 + 109)
            {
               _loc2_ = 6;
            }
            if(this.container.mouseX > 39 * 6 + 109 && this.container.mouseX < 39 * 7 + 109)
            {
               _loc2_ = 7;
            }
            if(this.container.mouseX > 39 * 7 + 109 && this.container.mouseX < 39 * 8 + 109)
            {
               _loc2_ = 8;
            }
            if(this.container.mouseX > 39 * 8 + 109 && this.container.mouseX < 39 * 9 + 109)
            {
               _loc2_ = 9;
            }
            if(this.container.mouseX > 39 * 9 + 109 && this.container.mouseX < 39 * 10 + 109)
            {
               _loc2_ = 10;
            }
            if(_loc2_ != -1)
            {
               this._parent.dispatchEvent(new BaseEvent(MainUI.FUNCTION_SHORTCUT_CLICK,"",[param1,_loc2_]));
            }
         }
         this.container.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.rectBar.$parent = param1;
         this.circleBar.$parent = param1;
         this.guideBar.$parent = param1;
      }
      
      private function onBiaoTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               addEventListener(MouseEvent.MOUSE_MOVE,this.onBiaoTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.biaoStr);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               removeEventListener(MouseEvent.MOUSE_MOVE,this.onBiaoTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + param1 + "</font>";
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 6;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
         Tools.currentStage.addChild(this.tipCanvas);
         if(Tools.currentStage.mouseX + this.tipCanvas.width > Tools.currentStage.stageWidth)
         {
            this.tipCanvas.x = Tools.currentStage.mouseX - this.tipCanvas.width;
         }
         else
         {
            this.tipCanvas.x = Tools.currentStage.mouseX + 10;
         }
         if(Tools.currentStage.mouseY + this.tipCanvas.height > Tools.currentStage.stageHeight)
         {
            this.tipCanvas.y = Tools.currentStage.mouseY - this.tipCanvas.height;
         }
         else
         {
            this.tipCanvas.y = Tools.currentStage.mouseY + 10;
         }
      }
      
      public function showItem(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc4_:int = 0;
         var _loc6_:BaseItem = null;
         param1.sortOn("quickbarindex",Array.NUMERIC);
         while(this.container.numChildren > 0)
         {
            _loc2_ = this.container.getChildAt(0) as ItemFace;
            this.container.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc3_:Array = [];
         var _loc5_:int = int(param1.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = param1[_loc4_] as BaseItem;
            _loc2_ = new ItemFace(_loc6_);
            if(_loc6_.id == OtherConst.XIANGLONG_SKILL_ID_1 || _loc6_.id == OtherConst.XIANGLONG_SKILL_ID_2 || _loc6_.id == OtherConst.XIANGLONG_SKILL_ID_3 || _loc6_.id == OtherConst.YIJINJING_SKILL_ID || _loc6_.id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_1 || _loc6_.id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_2 || _loc6_.id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_3 || _loc6_.id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_4 || _loc6_.id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_5 || _loc6_.id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_6 || _loc6_.id == OtherConst.LIUMAISHNEJIAN_SKILL_ID_7 || _loc6_.id == OtherConst.SHENZHAOJING_SKILL_ID || _loc6_.id == OtherConst.YUCHANDU_SKILL_ID || _loc6_.id == OtherConst.XUEMOFUTI_SKILL_ID || _loc6_.id == OtherConst.XIANGLONGPAOXIAO_SKILL_ID || _loc6_.id == OtherConst.JINGMAINILIU_SKILL_ID || _loc6_.id == OtherConst.JINCHANTUOQIAO_SKILL_ID || _loc6_.id == OtherConst.ZHENWUQIJIEZHEN_SKILL_ID || _loc6_.id == OtherConst.JINGANGFUMOQUAN_SKILL_ID || _loc6_.id == OtherConst.JINGANGFUMOQUAN_DINGJI_SKILL_ID || _loc6_
            .id == OtherConst.JINGANGFUMOQUAN_YINCANG_SKILL_ID || _loc6_.id == OtherConst.LONGZHUA_SKILL_ID || _loc6_.id == OtherConst.TAIYUANJING_SKILL_ID || _loc6_.id == OtherConst.XIAOYAOYUFENG_SKILL_ID || _loc6_.id == OtherConst.LONGZHUA_QIANGHUA_SKILL_ID || _loc6_.id == OtherConst.SHENXINGBAIBIAN_SKILL_ID || _loc6_.id == OtherConst.SHENXINGBAIBIAN_SKILL_DINGJI_ID || _loc6_.id == OtherConst.WUXINGQUAN_HUHESHUANGXING_SKILL_ID || _loc6_.id == OtherConst.SKILL_ID_RULAISHENZHANG || _loc6_.id == OtherConst.DINGCHANJUE_SKILL_ID || _loc6_.id == OtherConst.YIHUAJIEMU_SKILL_ID || _loc6_.id == OtherConst.MOLINGZHIYUAN_SKILL_ID || _loc6_.id == OtherConst.SIWANGJINWU_SKILL_ID || _loc6_.id == OtherConst.HUANGJINYINZHE_SKILL_ID || _loc6_.id == OtherConst.XUANYUANGUPAO_SKILL_ID || _loc6_.id == OtherConst.QUANSHENCHUDONG_SKILL_ID || _loc6_.id == OtherConst.CIYUANYICHU_SKILL_ID || _loc6_.id == OtherConst.KUNSHOUYUCHANG_SKILL_ID || _loc6_.id == OtherConst.SHENJIANZHONG_SKILL_ID || _loc6_.id == OtherConst.HANBINGZHANG_SKILL_ID || _loc6_
            .id == OtherConst.JIANJI_SKILL_ID || _loc6_.id == OtherConst.QIANLIZHIWAI_SKILL_ID || _loc6_.id == OtherConst.XIDUNIZHUANJIUYIN_SKILL_ID || _loc6_.id == OtherConst.JIANTIFENGYIN_SKILL_ID || _loc6_.id == OtherConst.FOGUANGPUZHAO_SKILL_ID || _loc6_.id == OtherConst.BUSIJINSHEN_SKILL_ID || _loc6_.id == OtherConst.ZIFUDONGTIAN_SKILL_ID || _loc6_.id == OtherConst.TIANYUYANMENG_SKILL_ID || _loc6_.id == OtherConst.HUANGJINGONGCHENGNU_SKILL_ID || _loc6_.id == OtherConst.ZHAOFENGYINDIE_SKILL_ID || _loc6_.id == OtherConst.DIANLAO_SKILL_ID || _loc6_.id == OtherConst.KAITIAN_SKILL_ID || _loc6_.id == OtherConst.TAOHUAHUTI_SKILL_ID || _loc6_.id == OtherConst.KUNXIANSHU_SKILL_ID || _loc6_.id == OtherConst.HUANYINGFENSHEN_SKILL_ID || _loc6_.id == OtherConst.SIWANGXUANYAN_SKILL_ID || _loc6_.id == OtherConst.GUIYINGXIANZHONG_SKILL_ID || _loc6_.id == OtherConst.JUEQINGMIJI_SKILL_ID || _loc6_.id == OtherConst.ZIJINQIANKUN_SKILL_ID || _loc6_.id == OtherConst.MEIRENJI_SKILL_ID || _loc6_.id == OtherConst.LINGHUHUANHUA_SKILL_ID || _loc6_
            .id == OtherConst.JINJIAZHANCHE_SKILL_ID || _loc6_.id == OtherConst.ZHANLONGJUE_SKILL_ID1 || _loc6_.id == OtherConst.ZHANLONGJUE_SKILL_ID2 || _loc6_.id == OtherConst.ZHANLONGJUE_SKILL_ID3 || _loc6_.id == OtherConst.ZHANLONGJUE_SKILL_ID4 || _loc6_.id == OtherConst.GUIZHUA_SKILL_ID4 || _loc6_.id == OtherConst.GUIZHUA_SKILL_ID5 || _loc6_.id == OtherConst.GUIZHUA_SKILL_ID6 || _loc6_.id == OtherConst.GUIZHUA_SKILL_ID7 || _loc6_.id == OtherConst.GUIZHUA_SKILL_ID8 || OtherConst.YN_LIULONGZHUANGBEI_SKILL_ARR.indexOf(_loc6_.id) != -1)
            {
               _loc2_.setShowCount(false);
            }
            this.container.addChild(_loc2_);
            if(_loc2_.getBaseItem().quickbarindex < 6)
            {
               _loc2_.x = (_loc2_.getBaseItem().quickbarindex - 1) * 39;
            }
            else
            {
               _loc2_.x = 109 + (_loc2_.getBaseItem().quickbarindex - 1) * 39;
            }
            _loc2_.y = 0;
            _loc2_.showShortCutTip(_loc2_.getBaseItem().quickbarindex == 10 ? 0 : _loc2_.getBaseItem().quickbarindex);
            _loc3_.push(_loc2_);
            _loc4_++;
         }
         CDFaceManager.registerItemFace_batch(_loc3_);
      }
      
      public function setItemFaceAndShowMovie(param1:ItemFace) : void
      {
         var _x:int;
         var item:ItemFace = null;
         var value:ItemFace = param1;
         var p:Point = value.parent.localToGlobal(new Point(value.x,value.y));
         var index:int = value.getBaseItem().quickbarindex;
         item = new ItemFace(value.getBaseItem());
         Tools.currentStage.addChild(item);
         item.x = p.x;
         item.y = p.y;
         _x = index < 6 ? int((index - 1) * 39) : int((index - 1) * 39 + 109);
         p = new Point(_x + 253,3);
         p = this.localToGlobal(p);
         TweenMax.to(item,4,{
            "x":p.x,
            "y":p.y,
            "onComplete":function():void
            {
               if(item.parent != null)
               {
                  item.parent.removeChild(item);
               }
            }
         });
         item.showShortCutTip(index == 10 ? 0 : index);
         CDFaceManager.registerItemFace(item);
      }
      
      public function getItemFaceByBaseItem(param1:BaseItem) : ItemFace
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         var _loc3_:int = this.container.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.container.getChildAt(_loc2_) as ItemFace;
            if(_loc4_.getBaseItem() == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         _loc3_ = this.rideSkillContainer.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.rideSkillContainer.getChildAt(_loc2_) as ItemFace;
            if(_loc4_.getBaseItem() == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function setExp(param1:Number, param2:Number) : void
      {
         if(param1 > 100000000000)
         {
            this.expBar.type = 3;
         }
         else if(param1 > 200000000000)
         {
            this.expBar.type = 4;
         }
         if(GameInstance.mainCharData.attributeInfo.lv >= 151 && param1 >= 6612993319798)
         {
            this.expBar.type = 5;
         }
         this.expBar.setValue(param1,param2);
      }
      
      public function setRideSkill(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc4_:int = 0;
         var _loc6_:Skill = null;
         while(this.rideSkillContainer.numChildren > 0)
         {
            _loc2_ = this.rideSkillContainer.getChildAt(0) as ItemFace;
            this.rideSkillContainer.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc3_:Array = [];
         var _loc5_:int = int(param1.length);
         var _loc7_:int = ItemPositionRange.MOUNT_QUICK_BAR_RANGE.x;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = param1[_loc4_] as Skill;
            _loc2_ = new ItemFace(_loc6_);
            _loc2_.setShowCount(false);
            this.rideSkillContainer.addChild(_loc2_);
            _loc2_.x = (_loc6_.quickbarindex - _loc7_) * 39;
            _loc2_.showShortCutTip(_loc6_.quickbarindex - _loc7_ + 1,true);
            _loc3_.push(_loc2_);
            _loc4_++;
         }
         CDFaceManager.registerItemFace_batch(_loc3_);
      }
      
      public function shouBiao(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.biaoSpr.parent != this)
            {
               this.addChild(this.biaoSpr);
            }
         }
         else if(this.biaoSpr.parent != null)
         {
            this.biaoSpr.parent.removeChild(this.biaoSpr);
         }
      }
      
      public function setBiaoZhuangtai(param1:int) : void
      {
         if(this.biao != null && this.biao.parent != null)
         {
            this.biao.parent.removeChild(this.biao);
         }
         this.biao = StaticValue.getBitmapByClassName("ui.party.task.yabiao." + param1);
         this.biaoSpr.addChild(this.biao);
         this.biaoSpr.removeEventListener(MouseEvent.CLICK,this.onCancel);
         if(param1 == 1)
         {
            this.biaoStr = LanResManager.getLanCommonTextWords("您已经接取了帮会运镖任务请在分钟内将您的镖车送往目的地");
         }
         else if(param1 == 2)
         {
            this.biaoStr = LanResManager.getLanCommonTextWords("您此次运镖任务失败，请放弃任务后重新接取。");
            this.biaoSpr.addEventListener(MouseEvent.CLICK,this.onCancel);
         }
      }
      
      private function onCancel(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_PARTY_TASK_HUBIAO_CANCEL));
      }
      
      public function setBiaoWeizhi(param1:int, param2:int, param3:String, param4:int) : void
      {
         this.biaoStr = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"请在分钟内回到镖车格范围内否则将会脱离运镖任务镖车位置倒计时",[param1,param2,param3,param4]) + "</textformat>";
      }
      
      public function setLayout(param1:Boolean) : void
      {
         if(param1)
         {
            this.rideBtn.filters = Tools.darkFilter;
            this.taskBtn.filters = Tools.darkFilter;
            this.friendBtn.filters = Tools.darkFilter;
            this.partyBtn.filters = Tools.darkFilter;
            this.meirenBtn.filters = Tools.darkFilter;
            this.tulongdaoBtn.filters = Tools.darkFilter;
            this.rideBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
            this.taskBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
            this.friendBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
            this.partyBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
            this.meirenBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
            this.tulongdaoBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
         }
         else
         {
            this.rideBtn.filters = [];
            this.taskBtn.filters = [];
            this.friendBtn.filters = [];
            this.partyBtn.filters = [];
            this.meirenBtn.filters = [];
            this.tulongdaoBtn.filters = [];
            this.rideBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            this.taskBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            this.friendBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            this.partyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            this.meirenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            this.tulongdaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
         this.circleBar.setLayout(param1);
      }
      
      public function setBtnEnabled(param1:Boolean) : void
      {
         if(param1)
         {
            this.charBtn.mouseEnabled = true;
            this.skillBtn.mouseEnabled = true;
            this.rideBtn.mouseEnabled = true;
            this.taskBtn.mouseEnabled = true;
            this.teamBtn.mouseEnabled = true;
            this.friendBtn.mouseEnabled = true;
            this.partyBtn.mouseEnabled = true;
            this.mallBtn.mouseEnabled = true;
            this.meirenBtn.mouseEnabled = true;
            this.tulongdaoBtn.mouseEnabled = true;
         }
         else
         {
            this.charBtn.mouseEnabled = false;
            this.skillBtn.mouseEnabled = false;
            this.rideBtn.mouseEnabled = false;
            this.taskBtn.mouseEnabled = false;
            this.teamBtn.mouseEnabled = false;
            this.friendBtn.mouseEnabled = false;
            this.partyBtn.mouseEnabled = false;
            this.mallBtn.mouseEnabled = false;
            this.meirenBtn.mouseEnabled = false;
            this.tulongdaoBtn.mouseEnabled = false;
         }
      }
   }
}

