package com.tgame.shell.view.components.fengzhengjie
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class FengZhengJiePanel extends FPanel
   {
      
      public static const UI_GETXUNZHANG:String = "UI_GETXUNZHANG";
      
      public static const UI_ZHIZAOFENGZHENG:String = "UI_ZHIZAOFENGZHENG";
      
      public static const UI_SHENGJIFENGZHENG:String = "UI_SHENGJIFENGZHENG";
      
      public static const UI_LOOKRANK:String = "UI_LOOKRANK";
      
      public static const UI_GETMEIREN:String = "UI_GETZHANPAO";
      
      private var t_qingmuzhi:FTextArea;
      
      private var c_qingmuzhi:FTextArea;
      
      private var lookRankBtn:SecondButton;
      
      private var zhizaoBtn:SecondButton;
      
      private var shengjiBtn:SecondButton;
      
      private var xunzhangBtn:SecondButton;
      
      private var bg:DisplayObject;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft4:FTextArea;
      
      private var ft5:FTextArea;
      
      private var type:int = -1;
      
      private var currentPage:int = 1;
      
      public function FengZhengJiePanel()
      {
         super();
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 370;
         height = 403;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         var _loc1_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/fengzhengjie/bg.png",349,328);
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.t_qingmuzhi = new FTextArea();
         this.t_qingmuzhi.textColor = StaticValue.GREEN;
         this.t_qingmuzhi.filters = StaticValue.filter;
         this.t_qingmuzhi.text = LanResManager.getLanCommonTextWords("当前倾慕值：");
         this.t_qingmuzhi.x = 136;
         this.t_qingmuzhi.y = 131;
         this.t_qingmuzhi.width = 220;
         addChild(this.t_qingmuzhi);
         this.lookRankBtn = new SecondButton();
         this.lookRankBtn.label = LanResManager.getLanCommonTextWords("倾慕排行榜");
         this.lookRankBtn.x = 138;
         this.lookRankBtn.y = 341;
         addChild(this.lookRankBtn);
         this.lookRankBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xunzhangBtn = new SecondButton();
         this.xunzhangBtn.x = 186;
         this.xunzhangBtn.y = 100;
         this.xunzhangBtn.label = LanResManager.getLanCommonTextWords("领取勋章");
         addChild(this.xunzhangBtn);
         this.xunzhangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhizaoBtn = new SecondButton();
         this.zhizaoBtn.x = 14;
         this.zhizaoBtn.y = 200 - 3;
         this.zhizaoBtn.label = LanResManager.getLanCommonTextWords("制造风筝");
         addChild(this.zhizaoBtn);
         this.zhizaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shengjiBtn = new SecondButton();
         this.shengjiBtn.x = 14;
         this.shengjiBtn.y = 264 - 3;
         this.shengjiBtn.label = LanResManager.getLanCommonTextWords("升级风筝");
         addChild(this.shengjiBtn);
         this.shengjiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft1 = new FTextArea();
         this.ft1.text = LanResManager.getLanCommonTextWords("制造风筝,需要风筝设计图1个");
         this.ft1.textColor = StaticValue.YELLOW;
         this.ft1.filters = StaticValue.filter;
         this.ft1.x = 74;
         this.ft1.y = 175;
         this.ft1.width = 280;
         this.ft1.height = 25;
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         this.ft2.text = LanResManager.getLanCommonTextWords("升级风筝,将消耗背包中所有的五彩棉纸。");
         this.ft2.x = 74;
         this.ft2.y = 227;
         this.ft2.width = 280;
         this.ft2.height = 25;
         this.ft2.textColor = StaticValue.YELLOW;
         this.ft2.filters = StaticValue.filter;
         addChild(this.ft2);
         this.c_qingmuzhi = new FTextArea();
         this.c_qingmuzhi.text = "";
         this.c_qingmuzhi.x = 74;
         this.c_qingmuzhi.y = 244;
         this.c_qingmuzhi.width = 280;
         this.c_qingmuzhi.height = 25;
         this.c_qingmuzhi.textColor = StaticValue.GREEN;
         this.c_qingmuzhi.filters = StaticValue.filter;
         addChild(this.c_qingmuzhi);
         this.ft3 = new FTextArea();
         this.ft3.htmlText = LanResManager.getLanCommonTextWords("将风筝交给襄阳城内的秋香姐,可提高秋香倾慕值.") + "<br>" + LanResManager.getLanCommonTextWords("风筝质量越好,提升的倾慕值越高.");
         this.ft3.x = 12;
         this.ft3.y = 293;
         this.ft3.textColor = StaticValue.WHITE;
         this.ft3.filters = StaticValue.filter;
         this.ft3.width = 335;
         this.ft3.height = 35;
         addChild(this.ft3);
         this.ft4 = new FTextArea();
         this.ft4.htmlText = LanResManager.getLanCommonTextWords("又到了一年一度的风筝节，美丽动人的秋香姐又来到襄阳城中看风筝.") + "<br>" + LanResManager.getLanCommonTextWords("不知道谁的风筝能被秋香姐看重，抱得美人归呢？");
         this.ft4.x = 134;
         this.ft4.y = 13;
         this.ft4.textColor = StaticValue.WHITE;
         this.ft4.filters = StaticValue.filter;
         this.ft4.width = 210;
         this.ft4.height = 70;
         this.ft4.wordWrap = true;
         addChild(this.ft4);
         this.ft5 = new FTextArea();
         this.ft5.htmlText = LanResManager.getLanCommonTextWords("倾慕值达到1314可领取勋章");
         this.ft5.x = 187;
         this.ft5.y = 80;
         this.ft5.textColor = StaticValue.WHITE;
         this.ft5.filters = StaticValue.filter;
         this.ft5.width = 170;
         this.ft5.height = 20;
         addChild(this.ft5);
         var _loc2_:Bitmap = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 136;
         _loc2_.y = 79;
         addChild(_loc2_);
         _loc2_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 21;
         _loc2_.y = 157;
         addChild(_loc2_);
         _loc2_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         _loc2_.x = 21;
         _loc2_.y = 221;
         addChild(_loc2_);
         var _loc3_:ItemFace = new ItemFace(new Goods(41879));
         _loc3_.x = 23;
         _loc3_.y = 223;
         addChild(_loc3_);
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
         switch(param1.currentTarget)
         {
            case this.xunzhangBtn:
               dispatchEvent(new BaseEvent(UI_GETXUNZHANG,"",this.type));
               break;
            case this.lookRankBtn:
               dispatchEvent(new BaseEvent(UI_LOOKRANK,"",[this.currentPage,this.type]));
               break;
            case this.zhizaoBtn:
               dispatchEvent(new BaseEvent(UI_ZHIZAOFENGZHENG,"",this.type));
               break;
            case this.shengjiBtn:
               dispatchEvent(new BaseEvent(UI_SHENGJIFENGZHENG,"",this.type));
         }
      }
      
      private function setInit(param1:int) : void
      {
         var _loc2_:ItemFace = null;
         if(param1 == 1)
         {
            this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/fengzhengjie/fengzhengjie_bg.png",117,151);
            this.zhizaoBtn.label = LanResManager.getLanCommonTextWords("制造风筝");
            this.shengjiBtn.label = LanResManager.getLanCommonTextWords("升级风筝");
            this.ft1.text = LanResManager.getLanCommonTextWords("制造风筝,需要风筝设计图1个");
            this.ft2.text = LanResManager.getLanCommonTextWords("升级风筝,将消耗背包中所有的五彩棉纸。");
            this.ft3.htmlText = LanResManager.getLanCommonTextWords("将风筝交给襄阳城内的秋香姐,可提高秋香倾慕值.") + "<br>" + LanResManager.getLanCommonTextWords("风筝质量越好,提升的倾慕值越高.");
            this.ft4.htmlText = LanResManager.getLanCommonTextWords("又到了一年一度的风筝节，美丽动人的秋香姐又来到襄阳城中看风筝.") + "<br>" + LanResManager.getLanCommonTextWords("不知道谁的风筝能被秋香姐看重，抱得美人归呢？");
            this.ft5.htmlText = LanResManager.getLanCommonTextWords("倾慕值达到1314可领取勋章");
            _loc2_ = new ItemFace(new Goods(727690));
            _loc2_.x = 138;
            _loc2_.y = 81;
            addChild(_loc2_);
            _loc2_ = new ItemFace(new Goods(41878));
            _loc2_.x = 23;
            _loc2_.y = 159;
            addChild(_loc2_);
            this.titleText = LanResManager.getLanCommonTextWords("风筝节");
         }
         else
         {
            this.bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/fengzhengjie/fengdengjie_bg.png",117,151);
            this.zhizaoBtn.label = LanResManager.getLanCommonTextWords("制造风灯");
            this.shengjiBtn.label = LanResManager.getLanCommonTextWords("升级风灯");
            this.ft1.text = LanResManager.getLanCommonTextWords("制作风灯，需要风灯设计图一个");
            this.ft2.text = LanResManager.getLanCommonTextWords("升级风灯，将消耗背包中所有的五彩棉纸");
            this.ft3.htmlText = LanResManager.getLanCommonTextWords("将风灯交给嫦娥仙子，可提高嫦娥仙子对你的的好感度") + "<br>" + LanResManager.getLanCommonTextWords("风灯质量越好，提升的好感度越高。");
            this.ft4.htmlText = LanResManager.getLanCommonTextWords("又到了一年一度的中秋佳节，美丽动人的嫦娥仙子降临人间赏月看灯。") + "<br>" + LanResManager.getLanCommonTextWords("大家快来制作灯笼来博取嫦娥仙子的好感吧!");
            this.ft5.htmlText = LanResManager.getLanCommonTextWords("好感度到1314可领取嫦娥外装！");
            _loc2_ = new ItemFace(new Goods(722405));
            _loc2_.x = 138;
            _loc2_.y = 81;
            addChild(_loc2_);
            _loc2_ = new ItemFace(new Goods(722420));
            _loc2_.x = 23;
            _loc2_.y = 159;
            addChild(_loc2_);
            this.titleText = LanResManager.getLanCommonTextWords("风灯节");
         }
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
      }
      
      public function update(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean, param6:Boolean) : void
      {
         this.type = param1;
         this.t_qingmuzhi.text = LanResManager.getLanCommonTextWords("当前倾慕值：") + param2;
         if(param1 == 1)
         {
            this.c_qingmuzhi.text = LanResManager.getLanCommonTextWords("当前赠送风筝可获得倾慕：") + param3;
         }
         else
         {
            this.c_qingmuzhi.text = LanResManager.getLanCommonTextWords("当前赠送风灯可获得好感：") + param3;
         }
         this.xunzhangBtn.enabled = param4;
         this.zhizaoBtn.enabled = param5;
         this.shengjiBtn.enabled = param6;
         this.setInit(param1);
      }
   }
}

