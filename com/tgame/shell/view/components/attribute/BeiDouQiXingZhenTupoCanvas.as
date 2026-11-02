package com.tgame.shell.view.components.attribute
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FAlertEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class BeiDouQiXingZhenTupoCanvas extends Sprite
   {
      
      public var _parent3:DisplayObject;
      
      public var _parent2:DisplayObject;
      
      private var closeBtn:FSimpleButton;
      
      private var bgCanvas:FCanvas;
      
      private var img:Bitmap;
      
      private var zhufuzhi:int;
      
      private var suipian:FTextArea;
      
      private var zhufuzhiFT:FTextArea;
      
      private var zhufuzhiF:FTextArea;
      
      private var buyBtn:SecondButton;
      
      private var barBg:Bitmap;
      
      private var barBar:ColorBar;
      
      private var tupoyaoqiu:FTextArea;
      
      private var kstpBtn:SecondButton;
      
      private var zdtpBtn:SecondButton;
      
      private var goodsId:int;
      
      private var item:ItemFace;
      
      private var xingyunzhiNum:int;
      
      public function BeiDouQiXingZhenTupoCanvas()
      {
         var _loc1_:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 425;
         this.bgCanvas.height = 107;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         _loc1_ = new FCanvas();
         _loc1_.skin = "canvas1";
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 425;
         _loc1_.height = 107;
         addChild(_loc1_);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.suipian = new FTextArea();
         addChild(this.suipian);
         this.suipian.multiline = true;
         this.suipian.autoSize = TextFieldAutoSize.LEFT;
         this.suipian.wordWrap = true;
         this.suipian.width = 200;
         this.suipian.height = 20;
         this.suipian.x = 17;
         this.suipian.y = 15;
         this.suipian.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("星灵碎片") + "</font>";
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 17;
         this.img.y = 32;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 15;
         this.buyBtn.y = 73;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhufuzhiFT = new FTextArea();
         addChild(this.zhufuzhiFT);
         this.zhufuzhiFT.multiline = true;
         this.zhufuzhiFT.autoSize = TextFieldAutoSize.LEFT;
         this.zhufuzhiFT.wordWrap = true;
         this.zhufuzhiFT.width = 50;
         this.zhufuzhiFT.height = 20;
         this.zhufuzhiFT.x = 73;
         this.zhufuzhiFT.y = 35;
         this.zhufuzhiFT.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"祝福值") + "</font>";
         this.barBg = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg);
         this.barBg.width = 120;
         this.barBg.x = 115;
         this.barBg.y = 38;
         this.barBar = new ColorBar(5,110,5);
         addChild(this.barBar);
         this.barBar.x = 115 + 4;
         this.barBar.y = 41;
         this.zhufuzhiF = new FTextArea();
         addChild(this.zhufuzhiF);
         this.zhufuzhiF.multiline = true;
         this.zhufuzhiF.autoSize = TextFieldAutoSize.LEFT;
         this.zhufuzhiF.wordWrap = true;
         this.zhufuzhiF.width = 200;
         this.zhufuzhiF.height = 20;
         this.zhufuzhiF.x = 73 + 15;
         this.zhufuzhiF.y = 35 + 20;
         this.zhufuzhiF.htmlText = "<font  color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("祝福值将会在每日6点清零") + "</font>";
         this.tupoyaoqiu = new FTextArea();
         addChild(this.tupoyaoqiu);
         this.tupoyaoqiu.multiline = true;
         this.tupoyaoqiu.autoSize = TextFieldAutoSize.LEFT;
         this.tupoyaoqiu.wordWrap = true;
         this.tupoyaoqiu.width = 220;
         this.tupoyaoqiu.height = 120;
         this.tupoyaoqiu.x = 250;
         this.tupoyaoqiu.y = 17;
         this.tupoyaoqiu.textColor = StaticValue.BlUE20;
         this.tupoyaoqiu.htmlText = LanResManager.getLanCommonTextWords("突破前提： ") + LanResManager.getLanCommonTextWords("突破天枢星") + "<br>" + LanResManager.getLanCommonTextWords("突破需要： ") + LanResManager.getLanCommonTextWords("星灵碎片") + "10" + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("突破成功率：") + " 3%";
         this.kstpBtn = new SecondButton();
         this.kstpBtn.label = LanResManager.getLanCommonTextWords("开始突破");
         addChild(this.kstpBtn);
         this.kstpBtn.x = 237 + 5 + 5;
         this.kstpBtn.y = 78 + 10 - 15;
         this.kstpBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdtpBtn = new SecondButton();
         this.zdtpBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         addChild(this.zdtpBtn);
         this.zdtpBtn.x = 323 + 5 + 5;
         this.zdtpBtn.y = 78 + 10 - 15;
         this.zdtpBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         var str:String = null;
         var e:MouseEvent = param1;
         if(this.zhufuzhi > 0)
         {
            str = "";
            str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("北斗七星阵突破祝福值重要提示：") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("北斗七星阵等级领悟失败将会增加一定幅度的祝福值；") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("祝福值越高则下次突破成功几率越高。") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您当前已经积累了祝福值：") + this.zhufuzhi + LanResManager.getLanCommonTextWords("点") + "+<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("祝福值将会在每日早晨准时清空，") + "<br></font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("为避免损失，强烈建议您请在该时间之前完成突破") + "<br></font>" + "</textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续领悟");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _parent3.dispatchEvent(new BaseEvent(BeiDouQiXingZhen.UI_BEIDOUQIXINGZHEN_TUPO_CLOSE));
               }
            });
         }
         else
         {
            this._parent3.dispatchEvent(new BaseEvent(BeiDouQiXingZhen.UI_BEIDOUQIXINGZHEN_TUPO_CLOSE));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kstpBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_BEIDOUQIXINGZHEN_KAISHITUPO_CLICK));
               break;
            case this.zdtpBtn:
               if(this.zdtpBtn.label == LanResManager.getLanCommonTextWords("自动突破"))
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_BEIDOUQIXINGZHEN_ZIDONGTUPO_CLICK,"",true));
               }
               else
               {
                  this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_BEIDOUQIXINGZHEN_ZIDONGTUPO_CLICK,"",false));
               }
               break;
            case this.buyBtn:
               this._parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_SANSHILIUSHOU_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      private function aa(param1:Event = null) : void
      {
         var e:Event = param1;
         var ftaw:FTextArea = new FTextArea();
         with(ftaw)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = 140;
            y = 55;
            textColor = StaticValue.YELLOW;
            width = 132;
            htmlText = LanResManager.getLanCommonTextWords("祝福值+") + String(xingyunzhiNum);
         }
         addChild(ftaw);
         TweenMax.to(ftaw,1,{
            "y":1,
            "onComplete":this.onCom,
            "onCompleteParams":[ftaw]
         });
      }
      
      private function onCom(param1:FTextArea) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      public function setTupoInit(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         var _loc7_:String = "";
         _loc7_ = _loc7_ + "<textformat leading=\'6\'>";
         if(param1 == null || param1.length == 0)
         {
            param1 = LanResManager.getLanCommonTextWords("无");
         }
         if(param2)
         {
            _loc7_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + "</font><br>";
         }
         else
         {
            _loc7_ += LanResManager.getLanCommonTextWords("领悟前提：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "</font><br>";
         }
         if(param5)
         {
            _loc7_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         else
         {
            _loc7_ += LanResManager.getLanCommonTextWords("消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         _loc7_ += LanResManager.getLanCommonTextWords("领悟成功几率：") + param6 / 100 + "%";
         _loc7_ = _loc7_ + "</textformat>";
         this.tupoyaoqiu.htmlText = _loc7_;
         this.suipian.htmlText = "<font  color =\'" + StaticValue.ORANGE_HTML + "\'>" + param3 + "</font>";
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.zhufuzhi = param1;
         if(param1 > param2)
         {
            this.barBar.setValue(param2,param2);
         }
         else
         {
            this.barBar.setValue(param1,param2);
         }
         if(param3 != 0)
         {
            this.xingyunzhiNum = param3;
            this.aa();
         }
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.goodsId = param1.id;
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = 17 + 2;
         this.item.y = 32 + 2;
         addChild(this.item);
         if(!param2)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.item.filters = [];
         }
      }
      
      public function setZdtsBtnLabel(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdtpBtn.label = LanResManager.getLanCommonTextWords("自动突破");
         }
         else
         {
            this.zdtpBtn.label = LanResManager.getLanCommonTextWords("停止突破");
         }
      }
   }
}

