package com.tgame.shell.view.components
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
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class YNlianhuanchongzhiPanel extends FPanel
   {
      
      public static const YN_LIANHUANCHONGZHI_LINGQU_DAY:String = "YN_LIANHUANCHONGZHI_LINGQU_DAY";
      
      public static const YN_LIANHUANCHONGZHI_LINGQU_ZHONGJI:String = "YN_LIANHUANCHONGZHI_LINGQU_ZHONGJI";
      
      private var bg:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ftTime:FTextArea;
      
      private var ftDesc:FTextArea;
      
      private var btn:SecondButton;
      
      private var btn1:SecondButton;
      
      private var btn2:SecondButton;
      
      private var btn3:SecondButton;
      
      private var btn4:SecondButton;
      
      private var btn5:SecondButton;
      
      private var btn6:SecondButton;
      
      private var btn7:SecondButton;
      
      private var spr:Sprite;
      
      private var spr1:Sprite;
      
      private var arrX:Array = [50,148,248,344,441,538,636];
      
      private var arrY:Array = [113,35,113,35,113,36,113];
      
      public function YNlianhuanchongzhiPanel()
      {
         super();
         titleText = LanResManager.getLanCommonTextWords("连环充值");
         width = 750;
         height = 470;
         this.dragAble = true;
         this.showCloseButton = true;
         skin = "panel";
         this.addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynLianhuanchongzhi/bg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.ftTime = new FTextArea();
         this.ftTime.x = 20;
         this.ftTime.y = 20 + 370;
         this.ftTime.width = 350;
         this.ftTime.height = 22;
         this.ftTime.htmlText = "活动时间：2015年7月10日至2015年7月16日";
         this.ftTime.textColor = StaticValue.RED;
         addChild(this.ftTime);
         this.ftDesc = new FTextArea();
         this.ftDesc.x = 420;
         this.ftDesc.y = 380;
         this.ftDesc.width = 200;
         this.ftDesc.height = 22;
         this.ftDesc.htmlText = "当前充值";
         this.ftDesc.textColor = StaticValue.YELLOW;
         addChild(this.ftDesc);
         this.ft = new FTextArea();
         this.ft.x = 450;
         this.ft.y = 400;
         this.ft.width = 200;
         this.ft.height = 22;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("即可领取大礼包！");
         this.ft.textColor = StaticValue.YELLOW;
         addChild(this.ft);
         this.btn1 = new SecondButton();
         this.btn1.x = 60;
         this.btn1.y = 185;
         this.btn1.label = LanResManager.getLanCommonTextWords("领取");
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn1);
         this.btn2 = new SecondButton();
         this.btn2.x = 158;
         this.btn2.y = 110;
         this.btn2.label = LanResManager.getLanCommonTextWords("领取");
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn2);
         this.btn3 = new SecondButton();
         this.btn3.x = 258;
         this.btn3.y = 185;
         this.btn3.label = LanResManager.getLanCommonTextWords("领取");
         this.btn3.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn3);
         this.btn4 = new SecondButton();
         this.btn4.x = 355;
         this.btn4.y = 110;
         this.btn4.label = LanResManager.getLanCommonTextWords("领取");
         this.btn4.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn4);
         this.btn5 = new SecondButton();
         this.btn5.x = 453;
         this.btn5.y = 185;
         this.btn5.label = LanResManager.getLanCommonTextWords("领取");
         this.btn5.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn5);
         this.btn6 = new SecondButton();
         this.btn6.x = 550;
         this.btn6.y = 110;
         this.btn6.label = LanResManager.getLanCommonTextWords("领取");
         this.btn6.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn6);
         this.btn7 = new SecondButton();
         this.btn7.x = 650;
         this.btn7.y = 185;
         this.btn7.label = LanResManager.getLanCommonTextWords("领取");
         this.btn7.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn7);
         this.btn = new SecondButton();
         this.btn.x = 487;
         this.btn.y = 355;
         this.btn.label = LanResManager.getLanCommonTextWords("领取");
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btn);
         this.spr1 = new Sprite();
         addChild(this.spr1);
         this.spr = new Sprite();
         this.spr.x = 75;
         this.spr.y = 315;
         addChild(this.spr);
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         switch(param1.target)
         {
            case this.btn:
               dispatchEvent(new BaseEvent(YN_LIANHUANCHONGZHI_LINGQU_ZHONGJI));
               break;
            case this.btn1:
            case this.btn2:
            case this.btn3:
            case this.btn4:
            case this.btn5:
            case this.btn6:
            case this.btn7:
               dispatchEvent(new BaseEvent(YN_LIANHUANCHONGZHI_LINGQU_DAY,"",param1.target.name));
         }
      }
      
      public function setData(param1:String, param2:int, param3:int, param4:Array, param5:Array, param6:int, param7:int) : void
      {
         var _loc8_:int = 0;
         var _loc9_:ItemFace = null;
         var _loc10_:Object = null;
         var _loc11_:Bitmap = null;
         var _loc12_:ItemFace = null;
         this.ftTime.htmlText = param1;
         this.ftDesc.htmlText = LanResManager.getLanCommonTextWords("您当前已充值") + param2 + LanResManager.getLanCommonTextWords("天，再充值") + param3 + LanResManager.getLanCommonTextWords("天");
         while(this.spr1.numChildren > 0)
         {
            this.spr1.removeChildAt(0);
         }
         _loc8_ = 0;
         while(_loc8_ < param4.length)
         {
            _loc10_ = param4[_loc8_];
            _loc9_ = new ItemFace(new Goods(int(_loc10_.id)),65,65);
            _loc9_.x = int(this.arrX[_loc8_]);
            _loc9_.y = int(this.arrY[_loc8_]);
            _loc9_.setShowCount(false);
            this.spr1.addChild(_loc9_);
            if(_loc10_.state == "1")
            {
               this["btn" + (_loc8_ + 1)].label = LanResManager.getLanCommonTextWords("已领取");
               this["btn" + (_loc8_ + 1)].enabled == false;
            }
            else
            {
               this["btn" + (_loc8_ + 1)].label = LanResManager.getLanCommonTextWords("领取");
               this["btn" + (_loc8_ + 1)].enabled == true;
            }
            this["btn" + (_loc8_ + 1)].name = _loc10_.day;
            _loc8_++;
         }
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         _loc8_ = 0;
         while(_loc8_ < param5.length)
         {
            _loc10_ = param5[_loc8_];
            _loc11_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc11_.x = 71 + 50 * _loc8_;
            _loc11_.y = 0;
            this.spr.addChild(_loc11_);
            _loc12_ = new ItemFace(new Goods(int(_loc10_.id)));
            _loc12_.x = 73 + 50 * _loc8_;
            _loc12_.y = 2;
            _loc12_.setShowCount(true);
            _loc12_.count = int(_loc10_.num);
            this.spr.addChild(_loc12_);
            _loc8_++;
         }
         _loc9_ = new ItemFace(new Goods(param6),65,65);
         _loc9_.setShowCount(false);
         _loc9_.x = 401;
         _loc9_.y = -31;
         this.spr.addChild(_loc9_);
         if(param7 == 1)
         {
            this.btn.label = LanResManager.getLanCommonTextWords("已领取");
            this.btn.enabled = true;
         }
         else if(param7 == 0)
         {
            this.btn.label = LanResManager.getLanCommonTextWords("领取");
         }
      }
   }
}

