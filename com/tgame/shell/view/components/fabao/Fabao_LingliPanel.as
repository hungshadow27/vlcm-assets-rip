package com.tgame.shell.view.components.fabao
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class Fabao_LingliPanel extends FPanel
   {
      
      public static const UI_QIANGHUAFABAO_CLICK:String = "UI_QIANGHUAFABAO_CLICK";
      
      public static const UI_NINGJIELINGLIDAN_CLICK:String = "UI_NINGJIELINGLIDAN_CLICK";
      
      public static const UI_AUTO_NINGJIELINGLIDAN:String = "UI_AUTO_NINGJIELINGLIDAN";
      
      private var ft:FTextArea;
      
      private var ftValue:FTextArea;
      
      private var ftQiu:FTextArea;
      
      private var ckb:FCheckBox;
      
      private var btnQianghua:SecondButton;
      
      private var btnNingjie:SecondButton;
      
      private var mc:MovieClip;
      
      private var mcSpr:Sprite;
      
      public function Fabao_LingliPanel()
      {
         super();
         width = 400;
         height = 289;
         titleText = LanResManager.getLanCommonTextWords("灵力");
         showCloseButton = true;
         dragAble = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/fabao/lingli_bg.png",380,242);
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 200;
         this.ft.y = 15;
         this.ft.width = 190;
         this.ft.height = 165;
         this.ft.wordWrap = true;
         this.ft.htmlText = "    <font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("灵力是强化法宝必不可少的资源。每次向法宝内灌注灵力，都需要一定的灵力值。") + "<br>" + LanResManager.getLanCommonTextWords("当灵力值满10000时，可以将灵力值转化为灵力丹。使用灵力丹可以直接增加10000灵力。每10秒钟获得一次灵力，下线不会获得。") + "<br>" + LanResManager.getLanCommonTextWords("灵力丹为非绑定道具，可自由交易。") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 175;
         this.ft.width = 95;
         this.ft.height = 70;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("法宝总属性：") + "\t<br>" + LanResManager.getLanCommonTextWords("法宝攻击灵气：") + "<br>" + LanResManager.getLanCommonTextWords("法宝护体罡气：") + "<br>" + LanResManager.getLanCommonTextWords("法宝命脉内息：") + "</font>";
         addChild(this.ft);
         this.ftValue = new FTextArea();
         this.ftValue.x = 95;
         this.ftValue.y = 192;
         this.ftValue.width = 85;
         this.ftValue.height = 70;
         this.ftValue.wordWrap = true;
         this.ftValue.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>9999999\t<br>9999999<br>9999999</font>";
         addChild(this.ftValue);
         this.mcSpr = new Sprite();
         addChild(this.mcSpr);
         this.ftQiu = new FTextArea();
         this.ftQiu.x = 107 - this.ftQiu.width / 2 - 5;
         this.ftQiu.y = 96;
         this.ftQiu.height = 20;
         this.ftQiu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>9999999\t<br>9999999<br>9999999</font>";
         addChild(this.ftQiu);
         this.btnQianghua = new SecondButton();
         this.btnQianghua.x = 245;
         this.btnQianghua.y = 173;
         this.btnQianghua.label = LanResManager.getLanCommonTextWords("强化法宝");
         this.btnQianghua.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnQianghua);
         this.btnNingjie = new SecondButton();
         this.btnNingjie.x = 245;
         this.btnNingjie.y = 196;
         this.btnNingjie.label = LanResManager.getLanCommonTextWords("凝结灵力丹");
         this.btnNingjie.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnNingjie);
         this.ckb = new FCheckBox();
         this.ckb.x = 190;
         this.ckb.y = 220;
         this.ckb.textColor = StaticValue.WHITE;
         this.ckb.text = LanResManager.getLanCommonTextWords("灵力满10000自动凝结灵力丹");
         this.ckb.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.ckb);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.target)
         {
            case this.btnNingjie:
               _loc2_ = -1;
               if(this.ckb.selectState)
               {
                  if(this.btnNingjie.label == LanResManager.getLanCommonTextWords("凝结灵力丹"))
                  {
                     this.btnNingjie.label = LanResManager.getLanCommonTextWords("停止凝结");
                     _loc2_ = 1;
                  }
                  else
                  {
                     this.btnNingjie.label = LanResManager.getLanCommonTextWords("凝结灵力丹");
                     _loc2_ = 2;
                  }
               }
               else
               {
                  this.btnNingjie.label = LanResManager.getLanCommonTextWords("凝结灵力丹");
                  _loc2_ = 3;
               }
               dispatchEvent(new BaseEvent(UI_NINGJIELINGLIDAN_CLICK,"",_loc2_));
               break;
            case this.btnQianghua:
               dispatchEvent(new BaseEvent(UI_QIANGHUAFABAO_CLICK));
               break;
            case this.ckb:
               dispatchEvent(new BaseEvent(UI_AUTO_NINGJIELINGLIDAN,"",this.ckb.selectState));
         }
      }
      
      public function setData(param1:String, param2:int, param3:int, param4:int = 0) : void
      {
         this.ftQiu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "</font>";
         this.ftQiu.x = 94 - this.ftQiu.textWidth / 2;
         this.ftQiu.width = this.ftQiu.textWidth + 10;
         var _loc5_:Array = param1.split(",");
         this.ftValue.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc5_[0] + "<br>" + _loc5_[1] + "<br>" + _loc5_[2] + "</font>";
         var _loc6_:int = int(Number(param2 / (param3 / 10000)));
         this.setQiu(_loc6_);
         this.ckb.selectState = param4 == 1 ? true : false;
      }
      
      public function setQiu(param1:int) : void
      {
         while(this.mcSpr.numChildren > 0)
         {
            this.mcSpr.removeChildAt(0);
         }
         this.mc = StaticValue.getMCByClassName("ui.fabao.lingliqiu") as MovieClip;
         this.mcSpr.addChild(this.mc);
         if(param1 > 100)
         {
            param1 = 100;
         }
         this.mc.x = 45;
         this.mc.y = 50;
         this.mc.gotoAndStop(param1);
      }
      
      public function setBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.btnNingjie.label = LanResManager.getLanCommonTextWords("凝结灵力丹");
         }
         else
         {
            this.btnNingjie.label = LanResManager.getLanCommonTextWords("停止凝结");
         }
      }
   }
}

