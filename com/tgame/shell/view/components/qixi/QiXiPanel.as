package com.tgame.shell.view.components.qixi
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class QiXiPanel extends FPanel
   {
      
      public static const UI_QIXI:String = "UI_QIXI";
      
      public static const UI_QIXI_GET:String = "UI_QIXI_GET";
      
      public static const UI_QIXI_PAIHANG:String = "UI_QIXI_PAIHANG";
      
      public static const UI_QIXI_TIJIAO:String = "UI_QIXI_TIJIAO";
      
      private var tf:TextFormat;
      
      private var rongyuzhi:FTextArea;
      
      private var lingquBtn1:SmallButton;
      
      private var lingquBtn2:SmallButton;
      
      private var lingquBtn3:SmallButton;
      
      private var lingquBtn4:SmallButton;
      
      private var lingquBtn5:SmallButton;
      
      private var kuang:Bitmap;
      
      private var itemSpr:Sprite;
      
      private var paihang:QiXiRankPanel;
      
      private var hateBar:MovieClip;
      
      private var barSpr:Sprite;
      
      private var niao:DisplayObject;
      
      private var jinduFt:FTextArea;
      
      public function QiXiPanel()
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:FTextArea = null;
         super();
         this.titleText = LanResManager.getLanCommonTextWords("七夕情人节");
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 370 + 30 + 60 + 100 - 80 + 3;
         height = 403 + 2 + 2 + 150 + 8;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tf = new TextFormat();
         this.tf.align = "center";
         _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/qixi/bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/qixi/huiBg.swf");
         _loc1_.x = 10;
         _loc1_.y = 2 + 430;
         addChild(_loc1_);
         this.niao = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/qixi/niao.swf");
         this.niao.x = 40;
         this.niao.y = 200;
         addChild(this.niao);
         _loc2_ = new FTextArea();
         _loc2_.wordWrap = true;
         _loc2_.multiline = true;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 15;
         _loc2_.y = 290 + 15;
         _loc2_.width = 442;
         _loc2_.height = 120;
         _loc2_.htmlText = "<font color =\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动时间：") + "<br></font>" + "<font color =\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("2014年8月1日至2014年8月3日") + "<br></font>" + "<font color =\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动规则：") + "<br>" + LanResManager.getLanCommonTextWords("活动期间全世界怪物都会有几率掉落牵牛织女星碎片、爱慕情书和花语心愿。") + "<br>" + LanResManager.getLanCommonTextWords("玩家可以使用爱慕情书和花语心愿对心仪的异性倾诉爱慕。") + "<br>" + LanResManager.getLanCommonTextWords("活动期间七夕活跃度每到达一定程度都可领取一次大奖，愿有情人终成眷属。") + "<br>" + LanResManager.getLanCommonTextWords("领奖截止日期2014年8月3日24点，玩家如过期未能领取奖励则奖励作废。") + "</font>";
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.wordWrap = true;
         _loc2_.multiline = true;
         _loc2_.filters = StaticValue.filter;
         _loc2_.x = 35 + 20;
         _loc2_.y = 407 + 32;
         _loc2_.width = 420;
         _loc2_.height = 20;
         _loc2_.htmlText = "<font color =\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("活跃度100") + "    " + LanResManager.getLanCommonTextWords("活跃度300") + "    " + LanResManager.getLanCommonTextWords("活跃度500") + "    " + LanResManager.getLanCommonTextWords("活跃度1000") + "    " + LanResManager.getLanCommonTextWords("排行前10") + "</font>";
         addChild(_loc2_);
         this.lingquBtn1 = new SmallButton();
         addChild(this.lingquBtn1);
         this.lingquBtn1.x = 37 + 20;
         this.lingquBtn1.y = 485 + 12;
         this.lingquBtn1.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.lingquBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBtn2 = new SmallButton();
         addChild(this.lingquBtn2);
         this.lingquBtn2.x = 37 + 78 + 20;
         this.lingquBtn2.y = 485 + 12;
         this.lingquBtn2.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.lingquBtn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBtn3 = new SmallButton();
         addChild(this.lingquBtn3);
         this.lingquBtn3.x = 37 + 78 + 78 + 20;
         this.lingquBtn3.y = 485 + 12;
         this.lingquBtn3.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.lingquBtn3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBtn4 = new SmallButton();
         addChild(this.lingquBtn4);
         this.lingquBtn4.x = 37 + 78 + 78 + 78 + 20;
         this.lingquBtn4.y = 485 + 12;
         this.lingquBtn4.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.lingquBtn4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingquBtn5 = new SmallButton();
         addChild(this.lingquBtn5);
         this.lingquBtn5.x = 37 + 78 + 78 + 78 + 78 + 20;
         this.lingquBtn5.y = 485 + 12;
         this.lingquBtn5.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.lingquBtn5.enabled;
         this.lingquBtn5.addEventListener(MouseEvent.CLICK,this.onClick);
         var _loc3_:int = 0;
         while(_loc3_ < 5)
         {
            this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
            addChild(this.kuang);
            this.kuang.x = 45 + _loc3_ * 78 + 20;
            this.kuang.y = 433 + 20;
            _loc3_++;
         }
         this.barSpr = new Sprite();
         addChild(this.barSpr);
         this.itemSpr = new Sprite();
         addChild(this.itemSpr);
         this.jinduFt = new FTextArea();
         this.jinduFt.wordWrap = true;
         this.jinduFt.multiline = true;
         this.jinduFt.filters = StaticValue.filter;
         this.jinduFt.x = 200;
         this.jinduFt.y = 260 - 3;
         this.jinduFt.width = 100;
         this.jinduFt.height = 20;
         addChild(this.jinduFt);
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
         switch(param1.target)
         {
            case this.lingquBtn1:
               dispatchEvent(new BaseEvent(UI_QIXI_GET,"",1));
               break;
            case this.lingquBtn2:
               dispatchEvent(new BaseEvent(UI_QIXI_GET,"",2));
               break;
            case this.lingquBtn3:
               dispatchEvent(new BaseEvent(UI_QIXI_GET,"",3));
               break;
            case this.lingquBtn4:
               dispatchEvent(new BaseEvent(UI_QIXI_GET,"",4));
               break;
            case this.lingquBtn5:
               dispatchEvent(new BaseEvent(UI_QIXI_GET,"",5));
         }
      }
      
      private function setItem(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.itemSpr.numChildren > 0)
         {
            this.itemSpr.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new Goods(param1[_loc2_].id);
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.x = 47 + _loc2_ * 78 + 20;
            _loc4_.y = 435 + 20;
            this.itemSpr.addChild(_loc4_);
            if(param1[_loc2_].islingqu)
            {
               this["lingquBtn" + (_loc2_ + 1)].enabled = false;
               this["lingquBtn" + (_loc2_ + 1)].label = LanResManager.getLanCommonTextWords("已领取");
            }
            else
            {
               this["lingquBtn" + (_loc2_ + 1)].enabled = true;
               this["lingquBtn" + (_loc2_ + 1)].label = LanResManager.getLanCommonTextWords("领取奖励");
            }
            _loc2_++;
         }
      }
      
      public function update(param1:int, param2:Array) : void
      {
         this.setItem(param2);
         this.setBar(param1);
      }
      
      public function setPaihang(param1:int, param2:int, param3:Array, param4:int, param5:int) : void
      {
         if(!this.paihang)
         {
            this.paihang = new QiXiRankPanel();
            this.paihang.setParent = this;
         }
         this.paihang.x = 370 + 30 + 60 + 100 + 111 - 191;
         this.paihang.y = -30 - 2;
         this.paihang.dragAble = false;
         addChild(this.paihang);
         this.paihang.updateRank(param1,param2,param3,param4,param5);
      }
      
      public function setBar(param1:int) : void
      {
         var v1:int = param1;
         this.jinduFt.htmlText = "<font color =\'" + StaticValue.GREEN_HTML + "\'>" + v1 + "/1000</font>";
         if(v1 > 1000)
         {
            v1 = 1000;
         }
         if(this.hateBar)
         {
            this.hateBar.gotoAndStop(int(v1 / 10));
         }
         else
         {
            LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/qixi/bar.swf",function(param1:MovieClip):*
            {
               if(param1)
               {
                  hateBar = param1;
                  hateBar.gotoAndStop(int(v1 / 10));
                  barSpr.addChild(hateBar);
                  hateBar.x = 50 + 43;
                  hateBar.y = 379 - 123;
               }
            });
         }
         this.niao.x = 270 / 1000 * v1 + 40;
      }
   }
}

