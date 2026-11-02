package com.tgame.shell.view.components.mainui
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class HuaShanZhiDianJiangLi extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var containerBox:Sprite;
      
      private var yitiantulongSpr:Sprite;
      
      private var goodSpr:Sprite;
      
      private var huashanzhidianBG:DisplayObject;
      
      private var btnClose:NewSkinButton;
      
      private var wuhun:FTextArea;
      
      private var zhenqi:FTextArea;
      
      private var tongbi:FTextArea;
      
      private var jingyan:FTextArea;
      
      private var btnLingQu:SecondButton;
      
      private var jiangli:FTextArea;
      
      public function HuaShanZhiDianJiangLi()
      {
         super();
         this.containerBox = new Sprite();
         addChild(this.containerBox);
         this.yitiantulongSpr = new Sprite();
         addChild(this.yitiantulongSpr);
         this.goodSpr = new Sprite();
         this.goodSpr.x = 125;
         this.goodSpr.y = 170;
         addChild(this.goodSpr);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function setHuaShanZhiDianJiangLiData(param1:Object) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Goods = null;
         var _loc7_:ItemFace = null;
         this.removeContainerBoxChildren();
         this.removeyitiantulongSprChildren();
         if(param1.sucess == 1)
         {
            this.huashanzhidianBG = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/huashanzhidian/tiaozhanchenggong.swf");
            this.containerBox.addChild(this.huashanzhidianBG);
            this.btnClose = new NewSkinButton();
            this.btnClose.skin = "hszdboss53_Button";
            this.btnClose.x = 500;
            this.btnClose.y = 20;
            this.containerBox.addChild(this.btnClose);
            this.btnClose.addEventListener(MouseEvent.CLICK,this.onClickCloseHuaShanZhiDianHandler);
            this.wuhun = new FTextArea();
            this.wuhun.textColor = StaticValue.GREEN;
            this.wuhun.filters = StaticValue.filter;
            this.wuhun.text = LanResManager.getLanCommonTextWords("武魂：") + param1.wuhun;
            this.wuhun.x = 120;
            this.wuhun.y = 130;
            this.containerBox.addChild(this.wuhun);
            this.zhenqi = new FTextArea();
            this.zhenqi.textColor = StaticValue.GREEN;
            this.zhenqi.filters = StaticValue.filter;
            this.zhenqi.text = LanResManager.getLanCommonTextWords("真气：") + param1.zhenqi;
            this.zhenqi.x = 200;
            this.zhenqi.y = 130;
            this.containerBox.addChild(this.zhenqi);
            this.tongbi = new FTextArea();
            this.tongbi.textColor = StaticValue.GREEN;
            this.tongbi.filters = StaticValue.filter;
            this.tongbi.text = LanResManager.getLanCommonTextWords("铜币：") + param1.tongbi;
            this.tongbi.x = 300;
            this.tongbi.y = 130;
            this.containerBox.addChild(this.tongbi);
            this.jingyan = new FTextArea();
            this.jingyan.textColor = StaticValue.GREEN;
            this.jingyan.filters = StaticValue.filter;
            this.jingyan.text = LanResManager.getLanCommonTextWords("经验：") + param1.jingyan;
            this.jingyan.x = 120;
            this.jingyan.y = 180;
            this.containerBox.addChild(this.jingyan);
            this.jingyan = new FTextArea();
            this.jingyan.textColor = StaticValue.GREEN;
            this.jingyan.filters = StaticValue.filter;
            this.jingyan.text = LanResManager.getLanCommonTextWords("奖励物品：");
            this.jingyan.x = 240;
            this.jingyan.y = 180;
            this.containerBox.addChild(this.jingyan);
            if(param1.numDaoJu)
            {
               _loc2_ = param1.daoArr;
               _loc3_ = 0;
               while(_loc3_ < param1.numDaoJu)
               {
                  _loc4_ = int(_loc2_[_loc3_].id);
                  _loc5_ = int(_loc2_[_loc3_].num);
                  _loc6_ = new Goods(_loc4_);
                  _loc6_.count = _loc5_;
                  _loc7_ = new ItemFace(_loc6_);
                  _loc7_.x = 300;
                  _loc7_.y = 170;
                  this.containerBox.addChild(_loc7_);
                  _loc3_++;
               }
            }
            this.btnLingQu = new SecondButton();
            this.btnLingQu.label = LanResManager.getLanCommonTextWords("领取奖励");
            this.btnLingQu.x = 230;
            this.btnLingQu.y = 240;
            this.btnLingQu.name = param1.idBoss;
            this.containerBox.addChild(this.btnLingQu);
            this.btnLingQu.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         }
         else
         {
            this.huashanzhidianBG = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/huashanzhidian/tiaozhanshibai.swf");
            this.containerBox.addChild(this.huashanzhidianBG);
            this.btnClose = new NewSkinButton();
            this.btnClose.skin = "hszdboss53_Button";
            this.containerBox.addChild(this.btnClose);
            this.btnClose.addEventListener(MouseEvent.CLICK,this.onClickCloseHuaShanZhiDianHandler);
            this.btnLingQu = new SecondButton();
            this.btnLingQu.label = LanResManager.getLanCommonTextWords("退出");
            this.btnLingQu.x = 230;
            this.btnLingQu.y = 240;
            this.containerBox.addChild(this.btnLingQu);
            this.btnLingQu.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         }
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         var _loc4_:Object = null;
         var _loc2_:SecondButton = param1.target as SecondButton;
         var _loc3_:String = _loc2_.label;
         switch(_loc3_)
         {
            case LanResManager.getLanCommonTextWords("领取奖励"):
               _loc4_ = new Object();
               _loc4_.idBoss = int(_loc2_.name);
               break;
            case LanResManager.getLanCommonTextWords("退出"):
               break;
            case LanResManager.getLanCommonTextWords("退出副本"):
               this._parent.dispatchEvent(new BaseEvent(MainUI.YITIANTULONG_TUICHU_CLICK));
         }
      }
      
      private function onClickCloseHuaShanZhiDianHandler(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new Event(MainUI.HUASHANZHIDIANJIANGLI_CLOSE_CLICK));
      }
      
      public function setYiTianTuLongData(param1:Object) : void
      {
      }
      
      private function removeContainerBoxChildren() : void
      {
         while(this.containerBox.numChildren > 0)
         {
            this.containerBox.removeChildAt(0);
         }
      }
      
      private function removeyitiantulongSprChildren() : void
      {
         while(this.yitiantulongSpr.numChildren > 0)
         {
            this.yitiantulongSpr.removeChildAt(0);
         }
      }
      
      public function setYiTianTuLongJiangLi(param1:int, param2:int, param3:Array) : void
      {
         var _loc6_:Goods = null;
         var _loc7_:ItemFace = null;
         this.removeContainerBoxChildren();
         this.removeyitiantulongSprChildren();
         this.huashanzhidianBG = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/jiangliBg_" + param2 + ".swf");
         this.yitiantulongSpr.addChild(this.huashanzhidianBG);
         this.wuhun = new FTextArea();
         this.wuhun.textColor = StaticValue.WHITE;
         this.wuhun.text = LanResManager.getLanCommonTextWords("获得武魂：") + param1;
         this.wuhun.x = 120;
         this.wuhun.y = 130;
         this.wuhun.width = 300;
         this.yitiantulongSpr.addChild(this.wuhun);
         var _loc4_:FTextArea = new FTextArea();
         _loc4_.textColor = StaticValue.WHITE;
         _loc4_.text = LanResManager.getLanCommonTextWords("获得物品：");
         _loc4_.x = 120;
         _loc4_.y = this.wuhun.y + 20;
         _loc4_.width = 300;
         this.yitiantulongSpr.addChild(_loc4_);
         this.btnLingQu = new SecondButton();
         this.btnLingQu.label = LanResManager.getLanCommonTextWords("退出副本");
         this.btnLingQu.x = 230;
         this.btnLingQu.y = 240;
         this.yitiantulongSpr.addChild(this.btnLingQu);
         this.btnLingQu.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         while(this.goodSpr.numChildren > 0)
         {
            this.goodSpr.removeChildAt(0);
         }
         var _loc5_:int = 0;
         while(_loc5_ < param3.length)
         {
            _loc6_ = new Goods(param3[_loc5_].id);
            _loc6_.count = param3[_loc5_].count;
            _loc7_ = new ItemFace(_loc6_);
            _loc7_.x = 50 * _loc5_;
            this.goodSpr.addChild(_loc7_);
            _loc5_++;
         }
      }
   }
}

