package com.tgame.shell.view.components.attribute.tushidahui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.tushidahui.view.info.TushidahuiChuangGuanVO;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class TushidahuiTupoCanvas extends Sprite
   {
      
      public var _parent3:DisplayObject;
      
      public var _parent2:DisplayObject;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var _desTxt:FTextArea;
      
      private var img:Bitmap;
      
      private var CjBar:ColorBar;
      
      private var daojuming:FTextArea;
      
      private var lingwuyaoqiu:FTextArea;
      
      private var buyBtn:SecondButton;
      
      private var kslwBtn:SecondButton;
      
      public var zdlwBtn:SecondButton;
      
      private var zhufuzhi:int;
      
      private var xingyunzhiNum:int;
      
      private var goodsId:int;
      
      private var item:ItemFace;
      
      private var _vo:TushidahuiChuangGuanVO;
      
      public function TushidahuiTupoCanvas()
      {
         var _loc1_:FCanvas = null;
         var _loc4_:FTextArea = null;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 270;
         this.bgCanvas.height = 370;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         _loc1_ = new FCanvas();
         _loc1_.skin = "canvas1";
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 270;
         _loc1_.height = 380;
         addChild(_loc1_);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         var _loc2_:FLabel = new FLabel();
         addChild(_loc2_);
         _loc2_.x = 23;
         _loc2_.y = 20;
         _loc2_.defaultTextFormat = new TextFormat(null,14);
         _loc2_.textColor = StaticValue.ORANGE;
         _loc2_.text = LanResManager.getLanCommonTextWords("屠狮大会");
         this._desTxt = new FTextArea();
         addChild(this._desTxt);
         this._desTxt.multiline = true;
         this._desTxt.filters = StaticValue.filter;
         this._desTxt.textColor = StaticValue.ORANGE;
         this._desTxt.autoSize = TextFieldAutoSize.LEFT;
         this._desTxt.wordWrap = true;
         this._desTxt.width = 200;
         this._desTxt.height = 30;
         this._desTxt.x = 23;
         this._desTxt.y = 45;
         this._desTxt.htmlText = "<textformat leading=\'8\'><font size=\'12\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("突破重重阻隔，营救狮王谢逊，流芳千古，创造奇迹。") + "</font>";
         var _loc3_:FLabel = new FLabel();
         addChild(_loc3_);
         _loc3_.x = 22;
         _loc3_.y = 125;
         _loc3_.defaultTextFormat = new TextFormat(null,14);
         _loc3_.textColor = StaticValue.ORANGE;
         _loc3_.text = LanResManager.getLanCommonTextWords("闯关祝福值");
         _loc4_ = new FTextArea();
         addChild(_loc4_);
         _loc4_.multiline = true;
         _loc4_.autoSize = TextFieldAutoSize.LEFT;
         _loc4_.wordWrap = true;
         _loc4_.width = 220;
         _loc4_.height = 120;
         _loc4_.x = 23;
         _loc4_.y = 170;
         var _loc5_:String = "";
         _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("闯关失败将会增加祝福值") + "</font>");
         _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.BlUE20_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("祝福值越高则下次领悟成功率越高") + "</font>");
         _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.RED_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("每日凌晨6：00将会准时清空祝福值") + "</font>");
         _loc5_ = _loc5_ + ("<font color=\'" + StaticValue.RED_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("请在此期间完成领悟，以免造成损失") + "</font>");
         _loc5_ = _loc5_ + "</textformat>";
         _loc4_.htmlText = _loc5_;
         this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img);
         this.img.width = 170;
         this.img.x = 50;
         this.img.y = 149 - 11 + 10;
         this.CjBar = new ColorBar(5,132,11);
         addChild(this.CjBar);
         this.CjBar.x = 69;
         this.CjBar.y = 152 - 11 + 10;
         this.CjBar.setValue(2,2);
         this.daojuming = new FTextArea();
         addChild(this.daojuming);
         this.daojuming.multiline = true;
         this.daojuming.autoSize = TextFieldAutoSize.LEFT;
         this.daojuming.wordWrap = true;
         this.daojuming.width = 220;
         this.daojuming.height = 120;
         this.daojuming.x = 25;
         this.daojuming.y = 282 - 35 - 10 + 14;
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 25;
         this.img.y = 282 - 10;
         this.lingwuyaoqiu = new FTextArea();
         addChild(this.lingwuyaoqiu);
         this.lingwuyaoqiu.multiline = true;
         this.lingwuyaoqiu.autoSize = TextFieldAutoSize.LEFT;
         this.lingwuyaoqiu.wordWrap = true;
         this.lingwuyaoqiu.width = 220;
         this.lingwuyaoqiu.height = 120;
         this.lingwuyaoqiu.x = 25 + 75;
         this.lingwuyaoqiu.y = 282 - 35 + 30 - 15;
         this.lingwuyaoqiu.textColor = StaticValue.BlUE20;
         this.lingwuyaoqiu.htmlText = "";
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(this.buyBtn);
         this.buyBtn.x = 23;
         this.buyBtn.y = 323 - 10;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.buyBtn.visible = false;
         this.kslwBtn = new SecondButton();
         this.kslwBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.kslwBtn);
         this.kslwBtn.x = 45;
         this.kslwBtn.y = 345;
         this.kslwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zdlwBtn = new SecondButton();
         this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         addChild(this.zdlwBtn);
         this.zdlwBtn.x = 155;
         this.zdlwBtn.y = 345;
         this.zdlwBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用闯关直升丹后点击开始领悟将可以直接领悟任意一层闯关") + "</font></textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kslwBtn:
               this._parent2.dispatchEvent(new BaseEvent(TushidahuiConst.UI_TUSHIDAHUI_KAISHITISHENG_CLICK));
               break;
            case this.zdlwBtn:
               if(this.zdlwBtn.label == LanResManager.getLanCommonTextWords("自动领悟"))
               {
                  this._parent2.dispatchEvent(new BaseEvent(TushidahuiConst.UI_TUSHIDAHUI_ZIDONGTISHENG_CLICK,"",true));
               }
               else
               {
                  this._parent2.dispatchEvent(new BaseEvent(TushidahuiConst.UI_TUSHIDAHUI_ZIDONGTISHENG_CLICK,"",false));
               }
               break;
            case this.buyBtn:
               this._parent2.dispatchEvent(new BaseEvent(TushidahuiConst.UI_TUSHIDAHUI_GOUMAI_CLICK,"",this.goodsId));
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this._parent3.dispatchEvent(new BaseEvent(Tushidahui.UI_TUSHIDAHUI_GUANBI_CLICK));
      }
      
      private function aa(param1:Event = null) : void
      {
         var e:Event = param1;
         var ftaw:FTextArea = new FTextArea();
         with(ftaw)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = 69;
            y = 152;
            textColor = StaticValue.YELLOW;
            width = 132;
            htmlText = LanResManager.getLanCommonTextWords("祝福值+") + String(xingyunzhiNum);
         }
         addChild(ftaw);
         TweenMax.to(ftaw,1,{
            "y":100,
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
         if(param2)
         {
            _loc7_ += LanResManager.getLanCommonTextWords("闯关前提：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + "</font><br>";
         }
         else
         {
            _loc7_ += LanResManager.getLanCommonTextWords("闯关前提：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "</font><br>";
         }
         if(param5)
         {
            _loc7_ += LanResManager.getLanCommonTextWords("闯关消耗：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         else
         {
            _loc7_ += LanResManager.getLanCommonTextWords("闯关消耗：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + param4 + LanResManager.getLanCommonTextWords("个") + "</font><br>";
         }
         _loc7_ += LanResManager.getLanCommonTextWords("闯关成功几率：") + param6 / 100 + "%";
         _loc7_ = _loc7_ + "</textformat>";
         this.lingwuyaoqiu.htmlText = _loc7_;
         this.daojuming.htmlText = "<font  color =\'" + StaticValue.ORANGE_HTML + "\'>" + param3 + "</font>";
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.zhufuzhi = param1;
         if(param1 > param2)
         {
            this.CjBar.setValue(param2,param2);
         }
         else
         {
            this.CjBar.setValue(param1,param2);
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
         this.item.x = 25 + 2;
         this.item.y = 272 + 2;
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
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("自动领悟");
         }
         else
         {
            this.zdlwBtn.label = LanResManager.getLanCommonTextWords("停止领悟");
         }
      }
      
      public function set vo(param1:TushidahuiChuangGuanVO) : void
      {
         this._vo = param1;
         this._desTxt.htmlText = this._vo.des;
         this.setZhufuzhi(this._vo.blessCurt,this._vo.blessMax);
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this._vo.goodsID,true);
         var _loc3_:Boolean = false;
         if(_loc2_.count >= this._vo.goodsCnt)
         {
            _loc3_ = true;
         }
         this.setGoods(_loc2_,_loc3_);
         this.setTupoInit(this._vo.condition,true,_loc2_.res.name,this._vo.goodsCnt,true,this._vo.successPercent);
      }
   }
}

