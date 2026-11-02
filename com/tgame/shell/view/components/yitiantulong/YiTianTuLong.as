package com.tgame.shell.view.components.yitiantulong
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class YiTianTuLong extends FPanel
   {
      
      public static const UI_SHOW_YITIANTULONG:String = "UI_SHOW_YITIANTULONG";
      
      public static const UI_YITIANTULONG_ZHOANGJIAN_CLICK:String = "UI_YITIANTULONG_ZHOANGJIAN_CLICK";
      
      public static const UI_XUANTIEZHONGJIAN_ZHUZAO_CLICK:String = "UI_XUANTIEZHONGJIAN_ZHUZAO_CLICK";
      
      public static const UI_XUANTIEZHONGJIAN_CUILIAN_CLICK:String = "UI_XUANTIEZHONGJIAN_CUILIAN_CLICK";
      
      public static const UI_YITIANTULONG_JINCHANG_CLICK:String = "UI_YITIANTULONG_JINCHANG_CLICK";
      
      public static const UI_YITIANTULONG_WUHUNSHANGDIAN_CLICK:String = "UI_YITIANTULONG_WUHUNSHANGDIAN_CLICK";
      
      public static const UI_XUANTIEZHONGJIAN_FANGRU_CLICK:String = "UI_XUANTIEZHONGJIAN_FANGRU_CLICK";
      
      public static const UI_YITIANTULONG_KUAFUBAOGUO_CLICK:String = "UI_YITIANTULONG_KUAFUBAOGUO_CLICK";
      
      private var bg:DisplayObject;
      
      private var bg1:DisplayObject;
      
      private var bloodMcSpr:Sprite;
      
      private var bloodMc1:MovieClip;
      
      private var bloodMc2:MovieClip;
      
      private var bloodMc3:MovieClip;
      
      private var shopBtn:NewSkinButton;
      
      private var baozangBtn:NewSkinButton;
      
      private var zhongjianBtn:NewSkinButton;
      
      private var jinruBtn:NewSkinButton;
      
      private var zhuzaoBtn:NewSkinButton;
      
      private var cuilianBtn:NewSkinButton;
      
      private var fangruBtn:SecondButton;
      
      private var colorBar1:ColorBar;
      
      private var colorBar2:ColorBar;
      
      private var tipCanvas:FCanvas;
      
      private var daojuFts:FTextArea;
      
      private var cuilianFts:FTextArea;
      
      private var fubenFts:FTextArea;
      
      private var changdiFts:FTextArea;
      
      private var daoMc:MovieClip;
      
      private var huoyuedu1:int = 0;
      
      private var jianMc:MovieClip;
      
      private var huoyuedu2:int = 0;
      
      private var lineList:FList;
      
      private var scroll:FVScorllBar;
      
      private var equipSpr:Sprite;
      
      private var yitianCount:FTextArea;
      
      private var tulongCount:FTextArea;
      
      private var kuafubaoguoBtn:NewSkinButton;
      
      private var daojishi:YiTianTuLongJiShi;
      
      private var shuoming:FTextArea;
      
      private var huodongshijian:FTextArea;
      
      private var kuang:Bitmap;
      
      private var bgZZ:DisplayObject;
      
      private var isFirst:Boolean = false;
      
      public function YiTianTuLong()
      {
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 931 + 20;
         height = 580;
         titleText = LanResManager.getLanCommonTextWords("倚天屠龙");
         this.addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/bg2.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2 + 63;
         this.bloodMcSpr.y = 2 + 35;
         addChild(this.bloodMcSpr);
         this.shopBtn = new NewSkinButton();
         this.shopBtn.skin = "wuhunshangdianBtn";
         this.shopBtn.x = 400 - 16 + 40;
         this.shopBtn.y = 30 + 10 + 80 - 20;
         addChild(this.shopBtn);
         this.shopBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jinruBtn = new NewSkinButton();
         this.jinruBtn.skin = "pipeiBtn";
         this.jinruBtn.x = this.shopBtn.x;
         this.jinruBtn.y = this.shopBtn.y + 100;
         addChild(this.jinruBtn);
         this.jinruBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.baozangBtn = new NewSkinButton();
         this.baozangBtn.skin = "baozangBtn";
         this.baozangBtn.x = this.shopBtn.x;
         this.baozangBtn.y = this.shopBtn.y + 150;
         addChild(this.baozangBtn);
         this.baozangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.kuafubaoguoBtn = new NewSkinButton();
         this.kuafubaoguoBtn.skin = "baoguoBtn";
         this.kuafubaoguoBtn.x = this.shopBtn.x;
         this.kuafubaoguoBtn.y = this.shopBtn.y + 50;
         addChild(this.kuafubaoguoBtn);
         this.kuafubaoguoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lineList = new FList();
         this.lineList.skin = "list";
         this.lineList.itemRenderer = new ruchangList();
         this.lineList.listWidth = 194;
         addChild(this.lineList);
         this.lineList.x = 29 + 350;
         this.lineList.y = 35 + 60;
         this.lineList.visible = false;
         this.lineList.addEventListener(MouseEvent.CLICK,this.onlistClick);
         this.scroll = new FVScorllBar(this.lineList,326);
         addChild(this.scroll);
         this.scroll.x = 225 + 350;
         this.scroll.y = 20 + 60;
         this.scroll.visible = false;
         this.zhongjianBtn = new NewSkinButton();
         this.zhongjianBtn.skin = "zhongjianchaxunBtn";
         this.zhongjianBtn.x = 250 + 157;
         this.zhongjianBtn.y = 400 - 75 - 20;
         addChild(this.zhongjianBtn);
         this.zhongjianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tipCanvas.width = 395;
         this.tipCanvas.height = 510;
         this.tipCanvas.x = 270 + 5;
         this.tipCanvas.y = -15;
         this.fubenFts = new FTextArea();
         addChild(this.fubenFts);
         this.fubenFts.width = 120;
         this.fubenFts.height = 17;
         this.fubenFts.x = 150 + 285;
         this.fubenFts.y = 300 - 8 + 190;
         this.fubenFts.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>1/100</font>";
         LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/jindu1.swf",function(param1:MovieClip):*
         {
            if(param1)
            {
               jianMc = param1;
               jianMc.x = 65;
               jianMc.y = 460;
               jianMc.gotoAndStop(huoyuedu1);
               addChildAt(jianMc,1);
            }
         });
         LoadSwf.AndReturnMC(GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/jindu2.swf",function(param1:MovieClip):*
         {
            if(param1)
            {
               daoMc = param1;
               daoMc.x = 65 + 560;
               daoMc.y = 460;
               daoMc.gotoAndStop(huoyuedu2);
               addChildAt(daoMc,1);
            }
         });
         this.yitianCount = new FTextArea();
         addChild(this.yitianCount);
         this.yitianCount.width = 120;
         this.yitianCount.height = 17;
         this.yitianCount.x = 240 - 65;
         this.yitianCount.y = 380 + 85;
         this.yitianCount.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>1/100</font>";
         this.tulongCount = new FTextArea();
         addChild(this.tulongCount);
         this.tulongCount.width = 120;
         this.tulongCount.height = 17;
         this.tulongCount.x = 540 + 180 + 34;
         this.tulongCount.y = 380 + 85;
         this.tulongCount.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>1/100</font>";
         this.setDaoJian();
         this.shuoming = new FTextArea();
         this.shuoming.x = 540 + 36;
         this.shuoming.y = 40 + 26;
         this.shuoming.textColor = StaticValue.GREEN;
         this.shuoming.width = 200;
         this.shuoming.height = 20;
         this.shuoming.htmlText = LanResManager.getLanCommonTextWords("游戏说明");
         addChild(this.shuoming);
         ToolTips.createToolTips(this.shuoming,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("规则说明：") + "<br>" + LanResManager.getLanCommonTextWords("1.玩家需要拥有屠龙刀或者拥有倚天剑才可以匹配战场。") + "<br>" + LanResManager.getLanCommonTextWords("2.玩家点击匹配进入锁定状态，此时不能进行其他操作，只可以点击取消匹配来退出匹配面板。") + "<br>" + LanResManager.getLanCommonTextWords("3.此战场为30V30，pvp对战战场，玩家匹配完毕进入战场后倒计时开始对战。") + "<br>" + LanResManager.getLanCommonTextWords("4.击杀敌对玩家可增长武魂值（武魂值可在武魂商店兑换强化道具），连续击杀可获得连斩加成武魂。") + "<br>" + LanResManager.getLanCommonTextWords("5.率先击碎对方“神兵”的阵营将获得胜利奖励。") + "<br>" + LanResManager.getLanCommonTextWords("6.玩家通过在武魂商店里兑换的道具来增加倚天剑和屠龙刀的淬炼值，当两个神兵的淬炼值满时可通") + LanResManager.getLanCommonTextWords("过铸造面板来获得绝世神兵玄铁重剑。") + "<br>" + LanResManager.getLanCommonTextWords("7.玩家铸造神兵后淬炼值将清空，玩家需要重新注满淬炼值从而来提升神兵重剑的力量。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.huodongshijian = new FTextArea();
         this.huodongshijian.x = 540 + 36 - 200;
         this.huodongshijian.y = 40;
         this.huodongshijian.textColor = StaticValue.RED;
         this.huodongshijian.width = 230;
         this.huodongshijian.height = 20;
         this.huodongshijian.htmlText = LanResManager.getLanCommonTextWords("活动时间：每日 19:00:00 - 20:00:00");
         addChild(this.huodongshijian);
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         if(this.tipCanvas.parent != null)
         {
            this.tipCanvas.parent.removeChild(this.tipCanvas);
         }
      }
      
      public function onClose1(param1:* = null) : void
      {
         if(this.tipCanvas.parent != null)
         {
            this.tipCanvas.parent.removeChild(this.tipCanvas);
         }
      }
      
      private function setDaoJian() : void
      {
         var loadUrl:String = null;
         var loadUrl2:String = null;
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/jian.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            if(Boolean(bloodMc1) && bloodMc1.parent != null)
            {
               bloodMc1.stop();
               bloodMc1.parent.removeChild(bloodMc1);
            }
            bloodMc1 = _loc2_.content as MovieClip;
            if(bloodMc1)
            {
               bloodMcSpr.addChild(bloodMc1);
            }
         },null,false,loadUrl);
         loadUrl2 = GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/dao.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl2)
            {
               return;
            }
            if(Boolean(bloodMc2) && bloodMc2.parent != null)
            {
               bloodMc2.stop();
               bloodMc2.parent.removeChild(bloodMc2);
            }
            bloodMc2 = _loc2_.content as MovieClip;
            if(bloodMc2)
            {
               bloodMc2.x = 350 + 304 - 63;
               bloodMcSpr.addChild(bloodMc2);
            }
         },null,false,loadUrl2);
      }
      
      private function onlistClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_YITIANTULONG_JINCHANG_CLICK,"",this.lineList.selectItem.id));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shopBtn:
               dispatchEvent(new BaseEvent(UI_YITIANTULONG_WUHUNSHANGDIAN_CLICK,"",8));
               break;
            case this.baozangBtn:
               dispatchEvent(new BaseEvent(UI_YITIANTULONG_WUHUNSHANGDIAN_CLICK,"",9));
               break;
            case this.zhuzaoBtn:
               dispatchEvent(new BaseEvent(UI_XUANTIEZHONGJIAN_ZHUZAO_CLICK));
               break;
            case this.cuilianBtn:
               if(this.equipSpr.numChildren > 0)
               {
                  dispatchEvent(new BaseEvent(UI_XUANTIEZHONGJIAN_CUILIAN_CLICK));
               }
               break;
            case this.zhongjianBtn:
               dispatchEvent(new BaseEvent(UI_YITIANTULONG_ZHOANGJIAN_CLICK));
               break;
            case this.fangruBtn:
               if(this.fangruBtn.label == LanResManager.getLanCommonTextWords("放入装备"))
               {
                  dispatchEvent(new BaseEvent(UI_XUANTIEZHONGJIAN_FANGRU_CLICK));
               }
               else
               {
                  while(this.equipSpr.numChildren > 0)
                  {
                     this.equipSpr.removeChildAt(0);
                  }
                  this.fangruBtn.label = LanResManager.getLanCommonTextWords("放入装备");
                  this.cuilianBtn.enabled = false;
                  this.cuilianFts.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'></font>";
               }
               break;
            case this.kuafubaoguoBtn:
               dispatchEvent(new BaseEvent(UI_YITIANTULONG_KUAFUBAOGUO_CLICK));
               break;
            case this.jinruBtn:
               dispatchEvent(new BaseEvent(UI_YITIANTULONG_JINCHANG_CLICK,"",1));
         }
      }
      
      public function setCuiLian(param1:String, param2:int, param3:int) : void
      {
         this.cuilianBtn.enabled = true;
         this.fangruBtn.label = LanResManager.getLanCommonTextWords("取出装备");
         this.cuilianFts.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "：" + param2 + "/" + param3 + "</font>";
      }
      
      public function setChengGong() : void
      {
         this.daojishi = new YiTianTuLongJiShi();
         this.daojishi.$parent = this;
         POPWindowManager.showWindow(this.daojishi);
         this.daojishi.setPipei(true);
      }
      
      public function setZhuZao(param1:String, param2:int, param3:Boolean) : void
      {
         var closeBtn:FSimpleButton;
         var loadUrl2:String = null;
         var nm:String = param1;
         var count:int = param2;
         var isCuilian:Boolean = param3;
         addChild(this.tipCanvas);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/zhongjianbg.swf");
         this.bg1.x = 0;
         this.bg1.y = 1;
         this.tipCanvas.addChild(this.bg1);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/zhongjianbgwenzi.swf");
         this.bg1.x = 40;
         this.bg1.y = 31;
         this.tipCanvas.addChild(this.bg1);
         this.bgZZ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/zikuang.swf");
         this.bgZZ.x = 16;
         this.bgZZ.y = 455;
         this.tipCanvas.addChild(this.bgZZ);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/zikuang.swf");
         this.bg1.x = 253;
         this.bg1.y = 455;
         this.tipCanvas.addChild(this.bg1);
         loadUrl2 = GameConfig.fileBaseFolder + "res/ui/UIditu/yitiantulong/zhongjian.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl2)
            {
               return;
            }
            if(Boolean(bloodMc3) && bloodMc3.parent != null)
            {
               bloodMc3.stop();
               bloodMc3.parent.removeChild(bloodMc3);
            }
            bloodMc3 = _loc2_.content as MovieClip;
            if(bloodMc3)
            {
               tipCanvas.addChild(bloodMc3);
            }
         },null,false,loadUrl2);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.tipCanvas.addChild(this.kuang);
         this.kuang.x = 175 - 2;
         this.kuang.y = 430 - 2;
         this.equipSpr = new Sprite();
         this.equipSpr.x = 175;
         this.equipSpr.y = 430;
         this.tipCanvas.addChild(this.equipSpr);
         closeBtn = new FSimpleButton();
         closeBtn.skin = "closeButton";
         this.tipCanvas.addChild(closeBtn);
         closeBtn.x = 370;
         closeBtn.y = 2 + 2 + 2;
         closeBtn.addEventListener(MouseEvent.CLICK,this.onClose1);
         this.fangruBtn = new SecondButton();
         this.fangruBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         this.fangruBtn.x = 150 + 10;
         this.fangruBtn.y = 420 + 52;
         this.tipCanvas.addChild(this.fangruBtn);
         this.fangruBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhuzaoBtn = new NewSkinButton();
         this.zhuzaoBtn.skin = "zhuzaoBtn";
         this.zhuzaoBtn.x = 250 + 45;
         this.zhuzaoBtn.y = 250 + 84;
         this.tipCanvas.addChild(this.zhuzaoBtn);
         this.zhuzaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cuilianBtn = new NewSkinButton();
         this.cuilianBtn.skin = "cuilianBtn";
         this.cuilianBtn.x = 50 - 15 + 25;
         this.cuilianBtn.y = 250 + 84;
         this.cuilianBtn.enabled = false;
         this.tipCanvas.addChild(this.cuilianBtn);
         this.cuilianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.daojuFts = new FTextArea();
         this.tipCanvas.addChild(this.daojuFts);
         this.daojuFts.width = 136;
         this.daojuFts.height = 17;
         this.daojuFts.x = 150 - 15 - 105 + 240;
         this.daojuFts.y = 300 + 152 + 5;
         this.daojuFts.htmlText = "<font color = \'" + StaticValue.YELLOW_HTML + "\'>" + nm + "：" + count + "/100</font>";
         this.cuilianFts = new FTextArea();
         this.tipCanvas.addChild(this.cuilianFts);
         this.cuilianFts.width = 136;
         this.cuilianFts.height = 17;
         this.cuilianFts.x = 150 - 15 - 110;
         this.cuilianFts.y = 300 + 152 + 5;
         this.kuang.visible = !this.isFirst;
         this.cuilianBtn.visible = !this.isFirst;
         this.fangruBtn.visible = !this.isFirst;
         this.bgZZ.visible = !this.isFirst;
      }
      
      public function setPanel(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int, param7:Array, param8:int, param9:Boolean) : void
      {
         this.huoyuedu1 = int(param1 / param2 * 100);
         if(this.jianMc != null)
         {
            this.jianMc.gotoAndStop(this.huoyuedu1);
         }
         this.yitianCount.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + param1 + "/" + param2 + "</font>";
         this.huoyuedu2 = int(param3 / param4 * 100);
         if(this.daoMc != null)
         {
            this.daoMc.gotoAndStop(this.huoyuedu2);
         }
         this.tulongCount.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + param3 + "/" + param4 + "</font>";
         this.zhongjianBtn.enabled = param5;
         this.fubenFts.htmlText = "<font  color = \'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("副本次数：") + param6 + "/" + param8 + "</font>";
         this.lineList.dataProvider = param7;
         this.isFirst = param9;
      }
      
      public function setEquip(param1:Goods) : void
      {
         while(this.equipSpr.numChildren > 0)
         {
            this.equipSpr.removeChildAt(0);
         }
         var _loc2_:ItemFace = new ItemFace(param1);
         this.equipSpr.addChild(_loc2_);
      }
      
      public function setClose() : void
      {
         if(Boolean(this.daojishi) && this.daojishi.parent != null)
         {
            this.daojishi.onClose();
         }
      }
   }
}

