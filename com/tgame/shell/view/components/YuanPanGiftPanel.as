package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.getDefinitionByName;
   import gs.TweenLite;
   import gs.easing.Quad;
   
   public class YuanPanGiftPanel extends FPanel
   {
      
      public static const ZHUANPAN_KAISHI_BTN_CLICK:String = "ZHUANPAN_KAISHI_BTN_CLICK";
      
      public static const ZHUANPAN_LINGJIANG_BTN_CLICK:String = "ZHUANPAN_LINGJIANG_BTN_CLICK";
      
      public static const ZHUANPAN_AGAIN_BTN_CLICK:String = "ZHUANPAN_AGAIN_BTN_CLICK";
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var line:DisplayObject;
      
      private var lineSpr:Sprite;
      
      private var goodsArr:Array;
      
      private var goodsContainer:Sprite;
      
      private var startBtn:SimpleButton;
      
      private var getBtn:SimpleButton;
      
      private var bg:DisplayObject;
      
      private var curIndex:int;
      
      private var againBtn:SecondButton;
      
      private var text:FTextArea;
      
      private var panelType:int;
      
      public var item:ItemFace;
      
      private var ty:int;
      
      public function YuanPanGiftPanel()
      {
         var $class:Class = null;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 385 + 20;
         height = 385 + 47;
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         titleText = LanResManager.getLanCommonTextWords("幸运转盘");
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhuanpan/bg.swf");
         this.bg.x = 9 + 1;
         this.bg.y = 2;
         this.goodsContainer = new Sprite();
         this.goodsContainer.x = 0;
         this.goodsContainer.y = 0;
         addChild(this.goodsContainer);
         this.againBtn = new SecondButton();
         this.againBtn.label = LanResManager.getLanCommonTextWords("重来一次");
         this.againBtn.enabled = false;
         this.againBtn.toolTip = "<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("如果你对所获得的道具不满意可以使用此功能重新转动一次转盘使用此功能消耗一个转盘魔石道具领取奖励后将不能使用该功能请在领取奖励前使用") + "</font></textformat>";
         addChild(this.againBtn);
         this.againBtn.x = 300;
         this.againBtn.y = 350;
         this.againBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.text = new FTextArea();
         with(this.text)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 20;
            x = 10;
            y = 10;
            textColor = StaticValue.GREEN;
         }
         addChild(this.text);
         $class = getDefinitionByName("zhuanpan.btn.zhuandong") as Class;
         this.startBtn = new $class() as SimpleButton;
         this.startBtn.x = 151;
         this.startBtn.y = 143;
         addChildAt(this.startBtn,2);
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         $class = getDefinitionByName("zhuanpan.btn.lingqiu") as Class;
         this.getBtn = new $class() as SimpleButton;
         this.getBtn.x = 151;
         this.getBtn.y = 143;
         this.getBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChildAt(this.getBtn,2);
         this.lineSpr = new Sprite();
         addChildAt(this.lineSpr,1);
         this.lineSpr.x = 150 + 50;
         this.lineSpr.y = 141 + 50 + 2;
         this.line = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhuanpan/jiantouno.swf");
         this.line.x = 37 - 40 - 10 - 5 + 2;
         this.line.y = -30 - 20 - 50;
         this.lineSpr.addChildAt(this.line,0);
      }
      
      public function setData(param1:Boolean, param2:int, param3:int) : void
      {
         var _loc4_:ItemFace = null;
         if(param1)
         {
            this.againBtn.enabled = true;
            this.startBtn.visible = false;
            this.getBtn.visible = true;
            this.lineSpr.rotation = param3 * 30;
            this.curIndex = param3;
            if(this.ty == 1 || this.ty == 3)
            {
               _loc4_ = this.goodsContainer.getChildByName("" + param3) as ItemFace;
               _loc4_.showGiftSelect(true);
            }
         }
         else
         {
            this.againBtn.enabled = false;
            this.startBtn.visible = true;
            this.getBtn.visible = false;
            this.lineSpr.rotation = 0;
         }
      }
      
      public function setTitle(param1:int, param2:Array) : void
      {
         var _loc3_:Class = null;
         var _loc4_:int = 0;
         if(this.bg.parent != null && Boolean(this.bg))
         {
            this.bg.parent.removeChild(this.bg);
         }
         if(this.getBtn.parent != null && Boolean(this.getBtn))
         {
            this.getBtn.parent.removeChild(this.getBtn);
         }
         if(this.startBtn.parent != null && Boolean(this.startBtn))
         {
            this.startBtn.parent.removeChild(this.startBtn);
         }
         switch(param1)
         {
            case SpecialGoodsID.XUANZHUANSHI:
               this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhuanpan/bg.swf");
               this.bg.x = 9 + 1;
               this.bg.y = 2;
               addChildAt(this.bg,0);
               titleText = LanResManager.getLanCommonTextWords("幸运转盘");
               _loc3_ = getDefinitionByName("zhuanpan.btn.zhuandong") as Class;
               this.startBtn = new _loc3_() as SimpleButton;
               this.startBtn.x = 151;
               this.startBtn.y = 143;
               addChildAt(this.startBtn,2);
               this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
               _loc3_ = getDefinitionByName("zhuanpan.btn.lingqiu") as Class;
               this.getBtn = new _loc3_() as SimpleButton;
               this.getBtn.x = 151;
               this.getBtn.y = 143;
               this.getBtn.addEventListener(MouseEvent.CLICK,this.onClick);
               addChildAt(this.getBtn,2);
               this.ty = 1;
               this.goodsContainer.visible = true;
               break;
            case SpecialGoodsID.YNHUANGDAOZHUANPAN:
               this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynHuangdaozhuanpan/bg.swf");
               this.bg.x = 9 + 1;
               this.bg.y = 2;
               addChildAt(this.bg,0);
               _loc4_ = this.numChildren;
               titleText = LanResManager.getLanCommonTextWords("黄道转盘");
               _loc3_ = getDefinitionByName("ui.xingzuo.zhuandong.btn") as Class;
               this.startBtn = new _loc3_() as SimpleButton;
               this.startBtn.x = 140;
               this.startBtn.y = 141;
               addChildAt(this.startBtn,_loc4_ - 1);
               this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
               _loc3_ = getDefinitionByName("ui.xingzuo.lingqiu.btn") as Class;
               this.getBtn = new _loc3_() as SimpleButton;
               this.getBtn.x = 140;
               this.getBtn.y = 141;
               this.getBtn.addEventListener(MouseEvent.CLICK,this.onClick);
               _loc4_ = this.numChildren;
               addChildAt(this.getBtn,_loc4_ - 1);
               this.ty = 2;
               this.goodsContainer.visible = false;
               this.startBtn.visible = true;
               this.getBtn.visible = true;
               break;
            case SpecialGoodsID.YNWANGZHEZHUANPAN:
               this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/wzzp_bg.swf");
               this.bg.x = 9 + 1;
               this.bg.y = 2;
               addChildAt(this.bg,0);
               titleText = LanResManager.getLanCommonTextWords("王者转盘");
               _loc3_ = getDefinitionByName("zhuanpan.btn.zhuandong") as Class;
               this.startBtn = new _loc3_() as SimpleButton;
               this.startBtn.x = 151;
               this.startBtn.y = 143;
               addChildAt(this.startBtn,2);
               this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
               _loc3_ = getDefinitionByName("zhuanpan.btn.lingqiu") as Class;
               this.getBtn = new _loc3_() as SimpleButton;
               this.getBtn.x = 151;
               this.getBtn.y = 143;
               this.getBtn.addEventListener(MouseEvent.CLICK,this.onClick);
               addChildAt(this.getBtn,2);
               this.ty = 3;
               this.goodsContainer.visible = true;
         }
      }
      
      public function setGoods(param1:Array) : void
      {
         var _loc3_:ItemFace = null;
         this.goodsArr = new Array();
         this.goodsArr = param1;
         if(this.goodsArr == null)
         {
            return;
         }
         while(this.goodsContainer.numChildren > 0)
         {
            this.goodsContainer.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new ItemFace(new Goods(param1[_loc2_].goodId));
            _loc3_.name = param1[_loc2_].id;
            switch(param1[_loc2_].id)
            {
               case 0:
                  _loc3_.x = 186;
                  _loc3_.y = 59;
                  break;
               case 1:
                  _loc3_.x = 246;
                  _loc3_.y = 72;
                  break;
               case 2:
                  _loc3_.x = 293;
                  _loc3_.y = 116;
                  break;
               case 3:
                  _loc3_.x = 307;
                  _loc3_.y = 177;
                  break;
               case 4:
                  _loc3_.x = 293;
                  _loc3_.y = 237;
                  break;
               case 5:
                  _loc3_.x = 246;
                  _loc3_.y = 281;
                  break;
               case 6:
                  _loc3_.x = 186;
                  _loc3_.y = 294;
                  break;
               case 7:
                  _loc3_.x = 125;
                  _loc3_.y = 281;
                  break;
               case 8:
                  _loc3_.x = 78;
                  _loc3_.y = 237;
                  break;
               case 9:
                  _loc3_.x = 64;
                  _loc3_.y = 177;
                  break;
               case 10:
                  _loc3_.x = 78;
                  _loc3_.y = 116;
                  break;
               case 11:
                  _loc3_.x = 125;
                  _loc3_.y = 72;
            }
            this.goodsContainer.addChild(_loc3_);
            _loc2_++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         switch(e.target)
         {
            case this.startBtn:
               dispatchEvent(new BaseEvent(YuanPanGiftPanel.ZHUANPAN_KAISHI_BTN_CLICK));
               break;
            case this.getBtn:
               if(this.panelType == 0)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("点击领取后将不能再使用转盘魔石进行刷新，是否确认领取"),"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        dispatchEvent(new BaseEvent(YuanPanGiftPanel.ZHUANPAN_LINGJIANG_BTN_CLICK));
                     }
                  },true);
               }
               else if(this.panelType == 1)
               {
                  dispatchEvent(new BaseEvent(YuanPanGiftPanel.ZHUANPAN_LINGJIANG_BTN_CLICK));
               }
               break;
            case this.againBtn:
               dispatchEvent(new BaseEvent(YuanPanGiftPanel.ZHUANPAN_AGAIN_BTN_CLICK));
         }
      }
      
      public function setTurn(param1:int = 0, param2:int = 5, param3:int = 1440) : void
      {
         var _loc4_:ItemFace = null;
         this.lineSpr.rotation = 0;
         if(this.ty == 1 || this.ty == 3)
         {
            _loc4_ = this.goodsContainer.getChildByName("" + this.curIndex) as ItemFace;
            _loc4_.showGiftSelect(false);
         }
         this.curIndex = param1;
         this.startBtn.enabled = false;
         this.startBtn.visible = true;
         this.getBtn.visible = false;
         this.againBtn.enabled = false;
         this.startBtn.filters = Tools.blackWhiteFilter;
         if(this.startBtn.hasEventListener(MouseEvent.CLICK))
         {
            this.startBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
         }
         TweenLite.to(this.lineSpr,param2,{
            "rotation":param3 + param1 * 30,
            "onComplete":this.setStartButton,
            "ease":Quad.easeInOut
         });
      }
      
      public function setStartButton(param1:Boolean = false) : void
      {
         this.startBtn.visible = param1;
         this.getBtn.visible = !param1;
         this.againBtn.enabled = !param1;
         var _loc2_:ItemFace = this.goodsContainer.getChildByName("" + this.curIndex) as ItemFace;
         _loc2_.showGiftSelect(!param1);
      }
      
      public function onTurnOver(param1:int) : void
      {
         var goods:Goods;
         var tempItem:ItemFace;
         var p:Point;
         var backpackBtn:DisplayObject;
         var toPixelP:Point;
         var dis:Number;
         var dur:Number;
         var $itemFace:ItemFace = null;
         var onComplete:Function = null;
         var index:int = param1;
         onComplete = function():void
         {
            if($itemFace.parent != null)
            {
               $itemFace.parent.removeChild($itemFace);
               $itemFace.destroy();
            }
         };
         this.lineSpr.rotation = 0;
         this.setStartButton(true);
         this.startBtn.filters = null;
         this.startBtn.enabled = true;
         if(!this.startBtn.hasEventListener(MouseEvent.CLICK))
         {
            this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
         goods = new Goods(this.goodsArr[index].goodId);
         $itemFace = new ItemFace(goods);
         tempItem = this.goodsContainer.getChildByName("" + index) as ItemFace;
         p = this.localToGlobal(new Point(tempItem.x,tempItem.y));
         $itemFace.x = p.x;
         $itemFace.y = p.y;
         backpackBtn = GameInstance.uiInstance.mainUI.functionContainer.backpackBtn;
         toPixelP = backpackBtn.localToGlobal(new Point(backpackBtn.width / 2 - 15,backpackBtn.height / 2 - 20));
         dis = Point.distance(p,toPixelP);
         dur = dis * 0.003;
         GameInstance.stage.addChild($itemFace);
         TweenLite.to($itemFace,dur,{
            "x":toPixelP.x,
            "y":toPixelP.y,
            "alpha":0.35,
            "onComplete":onComplete
         });
      }
      
      public function onMouseClick(param1:MouseEvent) : void
      {
         this.text.htmlText = "x" + mouseX + "        y" + mouseY;
         this.line.x = mouseX;
         this.line.y = mouseY;
      }
      
      public function setType(param1:int = 0) : void
      {
         this.panelType = param1;
         switch(param1)
         {
            case 0:
               this.againBtn.visible = true;
               break;
            case 1:
               this.againBtn.visible = false;
         }
      }
   }
}

