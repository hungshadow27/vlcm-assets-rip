package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YN2016cailushuPanel extends FPanel
   {
      
      public static const YN2016NEWYEAR_CG_BTN_CLICK:String = "YN2016NEWYEAR_CG_BTN_CLICK";
      
      private var ft:FTextArea;
      
      private var xArr:Array = [195,285,105,240,355,115,220,330];
      
      private var yArr:Array = [90,90,150,150,150,210,210,210];
      
      private var btnSpr:Sprite;
      
      public function YN2016cailushuPanel()
      {
         super();
         width = 520;
         height = 410;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("财禄树");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc2_:DisplayObject = null;
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/yn2016newyear/cg_bg.swf");
         _loc1_.x = 9;
         _loc1_.y = 0;
         addChild(_loc1_);
         _loc2_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/yn2016newyear/hb_left.swf");
         _loc2_.x = 175;
         _loc2_.y = 145;
         addChild(_loc2_);
         _loc2_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/yn2016newyear/hb_right.swf");
         _loc2_.x = 300;
         _loc2_.y = 145;
         addChild(_loc2_);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 10;
         this.ft.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("【时间】：") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("从2016年02月12号(0点) - 2016年02月18号(23点59)(财禄树活动时间)") + "</font>";
         this.ft.width = 450;
         this.ft.height = 20;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 35;
         this.ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("充值1000元宝可以获得1克“禄果”") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每个玩家最多可以采取8克“禄果”。") + "</font>";
         this.ft.width = 450;
         this.ft.height = 50;
         this.ft.wordWrap = true;
         this.ft.multiline = true;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 35;
         this.ft.y = 345;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("玩家采取够8克“禄果”后，树上会额外增加1克“黄金果”可以领取。");
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.width = 450;
         addChild(this.ft);
         this.btnSpr = new Sprite();
         addChild(this.btnSpr);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(YN2016NEWYEAR_CG_BTN_CLICK,"",param1.target.name));
      }
      
      public function setData(param1:Array, param2:Boolean, param3:Boolean) : void
      {
         var _loc5_:FSimpleButton = null;
         var _loc6_:FSimpleButton = null;
         while(this.btnSpr.numChildren > 0)
         {
            this.btnSpr.removeChildAt(0);
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = new FSimpleButton();
            _loc5_.skin = "yn2016cgsmall";
            _loc5_.addEventListener(MouseEvent.CLICK,this.onClick);
            switch(param1[_loc4_])
            {
               case 1:
                  _loc5_.name = "1";
                  _loc5_.x = int(this.xArr[0]);
                  _loc5_.y = int(this.yArr[0]);
                  break;
               case 2:
                  _loc5_.name = "2";
                  _loc5_.x = int(this.xArr[1]);
                  _loc5_.y = int(this.yArr[1]);
                  break;
               case 3:
                  _loc5_.name = "3";
                  _loc5_.x = int(this.xArr[2]);
                  _loc5_.y = int(this.yArr[2]);
                  break;
               case 4:
                  _loc5_.name = "4";
                  _loc5_.x = int(this.xArr[3]);
                  _loc5_.y = int(this.yArr[3]);
                  break;
               case 5:
                  _loc5_.name = "5";
                  _loc5_.x = int(this.xArr[4]);
                  _loc5_.y = int(this.yArr[4]);
                  break;
               case 6:
                  _loc5_.name = "6";
                  _loc5_.x = int(this.xArr[5]);
                  _loc5_.y = int(this.yArr[5]);
                  break;
               case 7:
                  _loc5_.name = "7";
                  _loc5_.x = int(this.xArr[6]);
                  _loc5_.y = int(this.yArr[6]);
                  break;
               case 8:
                  _loc5_.name = "8";
                  _loc5_.x = int(this.xArr[7]);
                  _loc5_.y = int(this.yArr[7]);
            }
            this.btnSpr.addChild(_loc5_);
            _loc4_++;
         }
         if(param2 && param3)
         {
            _loc6_ = new FSimpleButton();
            _loc6_.skin = "yn2016cgbig";
            _loc6_.x = 390;
            _loc6_.y = 85;
            _loc6_.name = "9";
            _loc6_.addEventListener(MouseEvent.CLICK,this.onClick);
            this.btnSpr.addChild(_loc6_);
         }
      }
   }
}

