package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNzhimengqianzhuangPanel extends FPanel
   {
      
      public static const UI_YN_ZHIMENGQIANZHUANG_DUIHUAN_CLICK:String = "UI_YN_ZHIMENGQIANZHUANG_DUIHUAN_CLICK";
      
      private var ft:FTextArea;
      
      private var ftNum:FTextArea;
      
      private var spr:Sprite;
      
      private var spr1:Sprite;
      
      private var spr2:Sprite;
      
      private var spr3:Sprite;
      
      private var spr4:Sprite;
      
      public function YNzhimengqianzhuangPanel()
      {
         super();
         width = 715;
         height = 650;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("之梦商城");
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
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/ynHuodong/zmqz_bg.swf");
         _loc1_.x = 10;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 30;
         this.ft.y = 15;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("【之梦商城活动说明】");
         this.ft.width = 250;
         this.ft.height = 20;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 30;
         this.ft.y = 40;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("之梦商城活动说明文字");
         this.ft.width = 665;
         this.ft.height = 60;
         this.ft.wordWrap = true;
         this.ft.multiline = true;
         addChild(this.ft);
         this.ftNum = new FTextArea();
         this.ftNum.x = 450;
         this.ftNum.y = 15;
         this.ftNum.width = 200;
         this.ftNum.height = 20;
         this.ftNum.htmlText = "当前之梦商城值：XXX";
         addChild(this.ftNum);
         this.spr = new Sprite();
         addChild(this.spr);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_YN_ZHIMENGQIANZHUANG_DUIHUAN_CLICK,"",param1.target.name));
      }
      
      public function setData(param1:Array, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Goods = null;
         var _loc7_:ItemFace = null;
         var _loc8_:FTextArea = null;
         var _loc9_:FTextArea = null;
         var _loc10_:SecondButton = null;
         this.ftNum.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前之梦商城值：") + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "</font>";
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_].ar;
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = new Goods(int(_loc4_[_loc5_].gid));
               _loc7_ = new ItemFace(_loc6_,65,65);
               _loc7_.x = 30 + 85 * _loc5_;
               _loc7_.y = 94 + 128 * _loc3_;
               this.spr.addChild(_loc7_);
               _loc8_ = new FTextArea();
               _loc8_.x = 18 + 85 * _loc5_;
               _loc8_.y = 157 + 128 * _loc3_;
               _loc8_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + _loc6_.res.name + "</font>";
               _loc8_.width = 85;
               this.spr.addChild(_loc8_);
               _loc9_ = new FTextArea();
               _loc9_.x = 25 + 16 + 85 * _loc5_;
               _loc9_.y = 172 + 128 * _loc3_;
               _loc9_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("价格：") + _loc4_[_loc5_].price + "</font>";
               _loc9_.width = 80;
               this.spr.addChild(_loc9_);
               _loc10_ = new SecondButton();
               _loc10_.x = 45 + 85 * _loc5_;
               _loc10_.y = 192 + 128 * _loc3_;
               _loc10_.label = LanResManager.getLanCommonTextWords("兑换");
               _loc10_.name = _loc4_[_loc5_].index;
               _loc10_.addEventListener(MouseEvent.CLICK,this.onClick);
               this.spr.addChild(_loc10_);
               _loc5_++;
            }
            _loc3_++;
         }
      }
   }
}

