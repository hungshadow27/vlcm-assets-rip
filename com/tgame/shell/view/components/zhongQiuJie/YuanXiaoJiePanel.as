package com.tgame.shell.view.components.zhongQiuJie
{
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   
   public class YuanXiaoJiePanel extends Sprite
   {
      
      public static const UI_YUANXIAOJIE_DUIHUANSHENQI:String = "UI_YUANXIAOJIE_DUIHUANSHENQI";
      
      public static const UI_YUANXIAOJIE_ZHONGJIANGMINGDAN:String = "UI_YUANXIAOJIE_ZHONGJIANGMINGDAN";
      
      public static const UI_RANK_JIANGLI_CLICK:String = "UI_RANK_JIANGLI_CLICK";
      
      private var tf:TextFormat;
      
      private var bg:DisplayObject;
      
      public var tabBar:FTabBar;
      
      private var bgSpr:Sprite;
      
      private var index:int;
      
      private var container0:Sprite;
      
      private var container1:Sprite;
      
      private var container2:Sprite;
      
      private var container3:Sprite;
      
      private var container4:Sprite;
      
      private var container5:Sprite;
      
      private var itemSpr0:Sprite;
      
      private var itemSpr2:Sprite;
      
      private var duiHuanBtn:SecondButton;
      
      private var mingDanBtn0:SecondButton;
      
      private var mingDanBtn1:SecondButton;
      
      private var mingDanBtn2:SecondButton;
      
      private var mingDanBtn3:SecondButton;
      
      private var mingDanBtn4:SecondButton;
      
      private var mingDanBtn5:SecondButton;
      
      private var mingDanBtn6:SecondButton;
      
      private var mingDanBtn7:SecondButton;
      
      private var rank:YuanXiaoJieRankPanel;
      
      private var closeBtn:FSimpleButton;
      
      private var tz:Sprite;
      
      private var posArr:Array = [{
         "x":60,
         "y":147
      },{
         "x":65,
         "y":150
      },{
         "x":60,
         "y":220
      },{
         "x":70,
         "y":230
      },{
         "x":65,
         "y":160
      },{
         "x":90,
         "y":200
      }];
      
      public function YuanXiaoJiePanel()
      {
         var _loc1_:int = 0;
         var _loc2_:Sprite = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:SecondButton = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yuanXiaoJie/bg.swf");
         this.bgSpr.addChild(this.bg);
         this.tabBar = new FTabBar();
         this.tabBar.addButton("总览",this.onTabClick);
         this.tabBar.addButton("猜灯谜",this.onTabClick);
         this.tabBar.addButton("赏花灯",this.onTabClick);
         this.tabBar.addButton("吃元宵",this.onTabClick);
         this.tabBar.addButton("灯谜大赛",this.onTabClick);
         this.tabBar.addButton("抽奖",this.onTabClick);
         addChild(this.tabBar);
         this.tabBar.x = 140;
         this.tabBar.y = 120;
         _loc1_ = 0;
         while(_loc1_ < 6)
         {
            _loc2_ = new Sprite();
            _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yuanXiaoJie/" + _loc1_ + ".swf");
            _loc2_.x = this.posArr[_loc1_].x;
            _loc2_.y = this.posArr[_loc1_].y;
            _loc2_.addChild(_loc3_);
            _loc2_.visible = false;
            addChild(_loc2_);
            this["container" + _loc1_] = _loc2_;
            _loc1_++;
         }
         this.itemSpr0 = new Sprite();
         this.container0.addChild(this.itemSpr0);
         this.itemSpr2 = new Sprite();
         this.container2.addChild(this.itemSpr2);
         this.duiHuanBtn = new SecondButton();
         this.container2.addChild(this.duiHuanBtn);
         this.duiHuanBtn.x = 220;
         this.duiHuanBtn.y = 105;
         this.duiHuanBtn.label = "兑换神器";
         this.duiHuanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         _loc1_ = 0;
         while(_loc1_ < 7)
         {
            _loc4_ = new SecondButton();
            _loc4_.name = "" + _loc1_;
            _loc4_.x = 35 + _loc1_ * 55;
            _loc4_.y = 250;
            _loc4_.label = "第" + (_loc1_ + 1) + "期";
            _loc4_.addEventListener(MouseEvent.CLICK,this.onClick2);
            this["mingDanBtn" + _loc1_] = _loc4_;
            this.container4.addChild(_loc4_);
            _loc1_++;
         }
         this.rank = new YuanXiaoJieRankPanel();
         this.rank.$parent = this;
         this.rank.visible = false;
         this.rank.x = 475;
         this.rank.y = -20 + 3;
         this.rank.dragAble = false;
         this.container4.addChild(this.rank);
         this.tz = new Sprite();
         this.tz.graphics.beginFill(0,0);
         this.tz.graphics.drawRect(0,0,583,100);
         this.tz.graphics.endFill();
         this.tz.width = 583;
         this.tz.height = 100;
         this.tz.x = 0;
         this.tz.y = 0;
         this.tz.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDowns);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseReleaseds);
         addChild(this.tz);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = 508;
         this.closeBtn.y = 22;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.setItem0([501433,501434,0,44418,0,0,44420,0,0,50780,50014,0,501435,501436,0]);
      }
      
      private function onClose(param1:* = null) : void
      {
         this.rank.visible = false;
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - this.width,Tools.currentStage.stageHeight - this.height));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.duiHuanBtn:
               dispatchEvent(new BaseEvent(UI_YUANXIAOJIE_DUIHUANSHENQI));
         }
      }
      
      private function onClick2(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.target.name);
         dispatchEvent(new BaseEvent(UI_YUANXIAOJIE_ZHONGJIANGMINGDAN,"",_loc2_ + 1));
      }
      
      public function setItem0(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.itemSpr0.numChildren != 0)
         {
            this.itemSpr0.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(param1[_loc2_] > 0)
            {
               _loc3_ = new Goods(param1[_loc2_]);
               if(_loc3_ != null)
               {
                  _loc4_ = new ItemFace(_loc3_);
                  _loc4_.x = 315 + int(_loc2_ % 3) * 45 + 20;
                  _loc4_.y = 4 + int(_loc2_ / 3) * 50;
                  this.itemSpr0.addChild(_loc4_);
               }
            }
            _loc2_++;
         }
      }
      
      public function setItem2(param1:Goods) : void
      {
         while(this.itemSpr2.numChildren != 0)
         {
            this.itemSpr2.removeChildAt(0);
         }
         var _loc2_:ItemFace = new ItemFace(param1);
         _loc2_.x = 165;
         _loc2_.y = 96;
         this.itemSpr2.addChild(_loc2_);
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         this.rank.visible = false;
         switch((param1.target as FButton).label)
         {
            case "总览":
               this.index = 0;
               break;
            case "猜灯谜":
               this.index = 1;
               break;
            case "赏花灯":
               this.index = 2;
               break;
            case "吃元宵":
               this.index = 3;
               break;
            case "灯谜大赛":
               this.index = 4;
               break;
            case "抽奖":
               this.index = 5;
         }
         this.setPanel(this.index);
      }
      
      public function setPanel(param1:int) : void
      {
         if(param1 == 2)
         {
            this.setItem2(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(44419,true));
         }
         var _loc2_:int = 0;
         while(_loc2_ < 6)
         {
            if(_loc2_ == param1)
            {
               this["container" + _loc2_].visible = true;
            }
            else
            {
               this["container" + _loc2_].visible = false;
            }
            _loc2_++;
         }
      }
      
      public function setRank(param1:int, param2:Array) : void
      {
         this.rank.visible = true;
         this.rank.updateRank(param1,param2);
      }
   }
}

