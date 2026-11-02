package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TCursorManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class XiangQianTianFuPanel extends FPanel
   {
      
      public static const UI_TIANFU_XIANGQIAN_PANEL_DRAG_START:String = "UI_TIANFU_XIANGQIAN_PANEL_DRAG_START";
      
      public static const UI_TIANFU_XIANGQIAN_PANEL_DRAG_ENTER:String = "UI_TIANFU_XIANGQIAN_PANEL_DRAG_ENTER";
      
      public static const UI_YIWANGTIANFU:String = "UI_YIWANGTIANFU";
      
      public static const UI_HUANXINGTIANFU:String = "UI_HUANXINGTIANFU";
      
      public static const UI_NEXT_PAGE:String = "UI_NEXT_PAGE";
      
      public static const UI_PRE_PAGE:String = "UI_PRE_PAGE";
      
      public static const UI_HUANXINGTIANFU_CLICK:String = "UI_HUANXINGTIANFU_CLICK";
      
      private var container:Sprite;
      
      private var container1:Sprite;
      
      private var container2:Sprite;
      
      private var container3:Sprite;
      
      private var container4:Sprite;
      
      private var p:Point;
      
      private var bgImg:DisplayObject;
      
      private var btnYW:SecondButton;
      
      private var btnHX:SecondButton;
      
      private var btnPre:FSimpleButton;
      
      private var btnNext:FSimpleButton;
      
      private var ftPage:FTextArea;
      
      private var ftDesc:FTextArea;
      
      private var tfNum:int;
      
      private var tfPage:int;
      
      private var tfAllPage:int;
      
      private var selectTF1:int;
      
      private var selectTF2:int;
      
      private var select:MovieClip;
      
      private var tfArr:Array = [];
      
      private var tfAr:Array = [];
      
      private var ars:Array = [];
      
      private var goodsBg:Sprite;
      
      private var curItem:ItemFace;
      
      private var currItem:ItemFace;
      
      private var names:String;
      
      private var xqTFL:int;
      
      private var xqTFG:int;
      
      private var xqTF:Goods;
      
      private var xqTFX:int;
      
      private var xqTFY:int;
      
      private var xqTFName:String;
      
      private var copper:int;
      
      private var gas:int;
      
      private var bit:Bitmap;
      
      private var lbl:FLabel;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public var lockon1:int = 0;
      
      private var hxTime:String = "0";
      
      private var hxTianFuPanel:HuanXingTianFuOKPanel;
      
      private var gongImg:DisplayObject;
      
      private var gongImgObj:Object = {};
      
      public function XiangQianTianFuPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 630;
         height = 410;
         this.titleText = LanResManager.getLanCommonTextWords("镶嵌天赋");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 5;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.container = new Sprite();
         this.container.x = 0;
         this.container.y = 0;
         this.container.width = width - 5;
         this.container.height = height - 5;
         addChild(this.container);
         this.container1 = new Sprite();
         this.container1.x = 10;
         this.container1.y = 2;
         with(this.container1.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,150,320);
            endFill();
         }
         this.container1.name = "spr1";
         addChild(this.container1);
         this.container1.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP,false,30);
         this.container2 = new Sprite();
         this.container2.x = this.container1.x + 150;
         this.container2.y = 2;
         with(this.container2.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,150,320);
            endFill();
         }
         this.container2.name = "spr2";
         addChild(this.container2);
         this.container2.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP,false,30);
         this.container3 = new Sprite();
         this.container3.x = this.container2.x + 150;
         this.container3.y = 2;
         with(this.container3.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,150,320);
            endFill();
         }
         this.container3.name = "spr3";
         addChild(this.container3);
         this.container3.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP,false,30);
         this.container4 = new Sprite();
         this.container4.x = this.container3.x + 150;
         this.container4.y = 2;
         with(this.container4.graphics)
         {
            beginFill(2003199,0);
            drawRect(0,0,150,320);
            endFill();
         }
         addChild(this.container4);
         this.container4.name = "spr4";
         this.container4.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP,false,30);
         this.btnYW = new SecondButton();
         this.btnYW.x = 20;
         this.btnYW.y = 340;
         this.btnYW.label = LanResManager.getLanCommonTextWords("遗忘天赋");
         this.btnYW.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnYW);
         this.btnHX = new SecondButton();
         this.btnHX.x = 20 + this.btnYW.width + 40;
         this.btnHX.y = 340;
         this.btnHX.label = LanResManager.getLanCommonTextWords("唤醒天赋");
         this.btnHX.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnHX);
         this.btnPre = new FSimpleButton();
         this.btnPre.skin = "previousButton";
         this.btnPre.x = 270;
         this.btnPre.y = 340;
         addChild(this.btnPre);
         this.btnPre.addEventListener(MouseEvent.CLICK,this.onClick1);
         this.ftPage = new FTextArea();
         this.ftPage.textColor = StaticValue.WHITE;
         this.ftPage.x = this.btnPre.x + this.btnPre.width + 5;
         this.ftPage.y = 340;
         this.ftPage.htmlText = "1/2";
         this.ftPage.width = 25;
         addChild(this.ftPage);
         this.btnNext = new FSimpleButton();
         this.btnNext.skin = "nextButton";
         this.btnNext.x = this.ftPage.x + this.ftPage.width + 5;
         this.btnNext.y = 340;
         addChild(this.btnNext);
         this.btnNext.addEventListener(MouseEvent.CLICK,this.onClick1);
         this.ftDesc = new FTextArea();
         this.ftDesc.x = 435;
         this.ftDesc.y = 332;
         this.ftDesc.width = 165;
         this.ftDesc.height = 35;
         this.ftDesc.textColor = StaticValue.ORANGE;
         this.ftDesc.wordWrap = true;
         this.ftDesc.htmlText = LanResManager.getLanCommonTextWords("注：天赋一旦镶嵌则不可以摘下，只有选择遗忘天赋！");
         addChild(this.ftDesc);
      }
      
      private function onMouseUP(param1:MouseEvent) : void
      {
         var _loc2_:FLabel = null;
         var _loc10_:Array = null;
         var _loc11_:ItemFace = null;
         var _loc12_:int = 0;
         var _loc13_:Object = null;
         if(this.lockon1 == 1)
         {
            return;
         }
         this.currItem = TCursorManager.currentItemFace;
         var _loc3_:Sprite = param1.target as Sprite;
         var _loc4_:Sprite = new Sprite();
         if(_loc3_ == null)
         {
            _loc2_ = param1.target as FLabel;
            _loc4_ = _loc2_.parent as Sprite;
         }
         else
         {
            _loc4_ = _loc3_;
         }
         var _loc5_:Object = new Object();
         switch(_loc4_.name)
         {
            case "spr1":
               _loc5_.l = 1;
               break;
            case "spr2":
               _loc5_.l = 2;
               break;
            case "spr3":
               _loc5_.l = 3;
               break;
            case "spr4":
               _loc5_.l = 4;
         }
         var _loc6_:int = 0;
         var _loc7_:Goods = new Goods(2001);
         if(TCursorManager.currentItemFace == null)
         {
            return;
         }
         _loc7_ = TCursorManager.currentItemFace.getBaseItem() as Goods;
         if(_loc7_.id >= 9811 && _loc7_.id <= 9820 || _loc7_.id >= 9881 && _loc7_.id <= 9890 || _loc7_.id == 41458 || _loc7_.id == 42175)
         {
            _loc6_ = 1;
         }
         else if(_loc7_.id >= 9821 && _loc7_.id <= 9830 || _loc7_.id >= 9891 && _loc7_.id <= 9900 || _loc7_.id == 41459 || _loc7_.id == 42176)
         {
            _loc6_ = 2;
         }
         else if(_loc7_.id >= 9841 && _loc7_.id <= 9850 || _loc7_.id >= 9911 && _loc7_.id <= 9920 || _loc7_.id == 41461 || _loc7_.id == 42178)
         {
            _loc6_ = 3;
         }
         else if(_loc7_.id >= 9851 && _loc7_.id <= 9860 || _loc7_.id >= 9921 && _loc7_.id <= 9930 || _loc7_.id == 41462 || _loc7_.id == 42179)
         {
            _loc6_ = 4;
         }
         else if(_loc7_.id >= 9831 && _loc7_.id <= 9840 || _loc7_.id >= 9901 && _loc7_.id <= 9910 || _loc7_.id == 41460 || _loc7_.id == 42177)
         {
            _loc6_ = 5;
         }
         else if(_loc7_.id >= 9871 && _loc7_.id <= 9880 || _loc7_.id >= 9941 && _loc7_.id <= 9950 || _loc7_.id == 41464 || _loc7_.id == 42181)
         {
            _loc6_ = 6;
         }
         else if(_loc7_.id >= 9861 && _loc7_.id <= 9870 || _loc7_.id >= 9931 && _loc7_.id <= 9940 || _loc7_.id == 41463 || _loc7_.id == 42180)
         {
            _loc6_ = 7;
         }
         else
         {
            _loc6_ = 1;
         }
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc9_ < this.tfAr.length)
         {
            _loc10_ = this.tfAr[_loc9_];
            if(_loc8_ == 1)
            {
               break;
            }
            _loc12_ = 0;
            while(_loc12_ < _loc10_.length)
            {
               _loc13_ = this.ars[_loc9_][_loc12_];
               if(_loc13_.t == _loc6_ && _loc5_.l == _loc9_ + 1)
               {
                  _loc5_.g = _loc6_;
                  this.xqTFX = _loc13_.x;
                  this.xqTFY = _loc13_.y;
                  this.xqTF = new Goods(_loc7_.id);
                  this.xqTFL = _loc9_;
                  this.xqTFG = _loc12_;
                  this.xqTFName = _loc7_.res.name.substr(0,2);
                  _loc8_ = 1;
                  break;
               }
               _loc12_++;
            }
            _loc9_++;
         }
         dispatchEvent(new BaseEvent(UI_TIANFU_XIANGQIAN_PANEL_DRAG_ENTER,"",_loc5_));
      }
      
      private function onClick1(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnNext:
               dispatchEvent(new BaseEvent(UI_NEXT_PAGE,"",[this.tfPage,this.lockon1]));
               break;
            case this.btnPre:
               dispatchEvent(new BaseEvent(UI_PRE_PAGE,"",[this.tfPage,this.lockon1]));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = this.curItem;
         if(_loc2_ == null)
         {
            if(param1.target == this.btnYW || param1.target == this.btnHX)
            {
               FAlert.show(LanResManager.getLanCommonTextWords("请选择要遗忘或唤醒的天赋！"));
            }
            return;
         }
         if(this.select == null)
         {
            if(param1.target == this.btnYW || param1.target == this.btnHX)
            {
               FAlert.show(LanResManager.getLanCommonTextWords("请选择要遗忘或唤醒的天赋！"));
            }
            return;
         }
         var _loc3_:Array = _loc2_.name.split(",");
         var _loc4_:Object = new Object();
         _loc4_.l = this.selectTF1 + 1;
         _loc4_.g = _loc3_[3];
         switch(param1.target)
         {
            case this.btnYW:
               dispatchEvent(new BaseEvent(UI_YIWANGTIANFU,"",_loc4_));
               break;
            case this.btnHX:
               if(_loc2_.filters.length == 0)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("该天赋无需唤醒！"));
                  return;
               }
               if(!this.hxTianFuPanel)
               {
                  this.hxTianFuPanel = new HuanXingTianFuOKPanel();
               }
               POPWindowManager.showWindow(this.hxTianFuPanel);
               this.hxTianFuPanel.$parent = this;
               _loc4_.jc = 0;
               this.hxTianFuPanel.setData(this.copper,this.gas,_loc4_);
         }
      }
      
      public function reHxTianFuPanel() : void
      {
         if(this.hxTianFuPanel != null && this.hxTianFuPanel.parent != null)
         {
            this.hxTianFuPanel.parent.removeChild(this.hxTianFuPanel);
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         this.reHxTianFuPanel();
         if(this.select != null && this.select.parent != null)
         {
            this.select.parent.removeChild(this.select);
         }
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:Array = _loc2_.split(",");
         this.selectTF1 = _loc3_[2];
         this.selectTF2 = _loc3_[1];
         this.copper = _loc3_[4];
         this.gas = _loc3_[5];
         var _loc4_:ItemFace = param1.currentTarget as ItemFace;
         this.select = StaticValue.getMCByClassName("ui.skill.default") as MovieClip;
         addChild(this.select);
         this.select.x = _loc4_.x + 2 + 150 * _loc3_[2] + 9;
         this.select.y = _loc4_.y + 2;
         this.select.mouseEnabled = false;
         this.select.mouseChildren = false;
         this.curItem = _loc4_;
      }
      
      public function setData(param1:Array, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:ItemFace = null;
         var _loc7_:Goods = null;
         var _loc8_:Object = null;
         var _loc9_:FLabel = null;
         var _loc15_:int = 0;
         if(param5 != -1)
         {
            this.lockon1 = 1;
            this.lockon();
         }
         else
         {
            this.unlock();
         }
         if(this.gongImg != null && this.gongImg.parent != null)
         {
            removeChild(this.gongImg);
         }
         if(this.gongImgObj[param2] != null)
         {
            this.gongImg = this.gongImgObj[param2];
         }
         else
         {
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/tianfu/xiangqiantianfu" + param2 + ".swf",616,331);
            this.gongImgObj[param2] = this.gongImg;
         }
         if(this.select != null && this.select.parent != null)
         {
            this.select.parent.removeChild(this.select);
         }
         this.select = null;
         if(this.container1 != null)
         {
            while(this.container1.numChildren != 0)
            {
               this.container1.removeChildAt(0);
            }
         }
         if(this.container2 != null)
         {
            while(this.container2.numChildren != 0)
            {
               this.container2.removeChildAt(0);
            }
         }
         if(this.container3 != null)
         {
            while(this.container3.numChildren != 0)
            {
               this.container3.removeChildAt(0);
            }
         }
         if(this.container4 != null)
         {
            while(this.container4.numChildren != 0)
            {
               this.container4.removeChildAt(0);
            }
         }
         this.tfAr = [];
         var _loc10_:Array = [];
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         this.tfArr = [];
         this.ars = new Array();
         var _loc13_:Array = [];
         var _loc14_:int = 0;
         while(_loc14_ < param4)
         {
            _loc10_ = [];
            _loc13_ = [];
            _loc15_ = 0;
            while(_loc15_ < 5)
            {
               _loc8_ = param1[_loc14_][_loc15_];
               _loc7_ = new Goods(_loc8_.id);
               _loc11_ = int(_loc8_.x);
               _loc12_ = int(_loc8_.y);
               _loc9_ = new FLabel();
               _loc9_.x = _loc11_ + 7 - 150 * _loc14_;
               _loc9_.y = _loc12_ + 11;
               _loc9_.text = _loc8_.name;
               _loc9_.textColor = StaticValue.ORANGE;
               _loc9_.mouseEnabled = false;
               _loc9_.name = "lbl" + _loc15_;
               if(_loc8_.jh == 0)
               {
                  this.bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
                  this.bit.x = _loc11_ - 150 * _loc14_ - 1;
                  this.bit.y = _loc12_;
                  this.bit.alpha = 0.2;
                  this["container" + (_loc14_ + 1)].addChild(this.bit);
                  this["container" + (_loc14_ + 1)].addChild(_loc9_);
               }
               else
               {
                  _loc6_ = new ItemFace(_loc7_);
                  if(param5 == -1)
                  {
                     _loc6_.addEventListener(MouseEvent.CLICK,this.onItemClick);
                  }
                  _loc6_.name = _loc8_.id + "," + _loc15_ + "," + _loc14_ + "," + _loc8_.t + "," + _loc8_.copper + "," + _loc8_.gas;
                  _loc6_.x = _loc11_ - 150 * _loc14_;
                  _loc6_.y = _loc12_;
                  _loc6_.removeListener();
                  _loc6_.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
                  _loc6_.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
                  if(_loc8_.jh == 1)
                  {
                     switch(_loc14_)
                     {
                        case 0:
                           this.container1.addChild(_loc6_);
                           break;
                        case 1:
                           this.container2.addChild(_loc6_);
                           break;
                        case 2:
                           this.container3.addChild(_loc6_);
                           break;
                        case 3:
                           this.container4.addChild(_loc6_);
                     }
                  }
                  if(_loc8_.state == 1 && _loc8_.type == 0)
                  {
                     _loc6_.filters = Tools.blackWhiteFilter;
                  }
               }
               _loc13_.push(_loc8_);
               _loc10_.push(_loc6_);
               _loc15_++;
            }
            this.ars.push(_loc13_);
            this.tfArr.push(_loc10_);
            _loc14_++;
         }
         this.tfAr = this.tfArr;
         this.tfPage = param2;
         param3 = param3;
         this.ftPage.htmlText = this.tfPage + "/" + param3;
         if(this.tfPage == 1)
         {
            this.btnPre.enabled = false;
         }
         else
         {
            this.btnPre.enabled = true;
         }
         if(this.tfPage == param3)
         {
            this.btnNext.enabled = false;
         }
         else
         {
            this.btnNext.enabled = true;
         }
         this.gongImg.x = 5;
         this.gongImg.y = 2;
         addChildAt(this.gongImg,1);
      }
      
      private function onMouseOut(param1:Object) : void
      {
         if(this.tipCanvas.parent != null)
         {
            this.tipCanvas.parent.removeChild(this.tipCanvas);
         }
      }
      
      private function onMouseMove() : void
      {
         if(this.tipCanvas.parent != null)
         {
            this.tipCanvas.x = Tools.currentStage.mouseX + 15;
            this.tipCanvas.y = Tools.currentStage.mouseY + 12;
         }
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Goods = null;
         var _loc8_:Goods = null;
         var _loc9_:Number = NaN;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:Array = _loc2_.split(",");
         var _loc4_:int = int(_loc3_[2]);
         var _loc5_:int = int(_loc3_[1]);
         _loc6_ = this.ars[_loc4_][_loc5_];
         if(_loc6_.id == 1)
         {
            _loc6_.id = _loc3_[0];
         }
         _loc8_ = new Goods(_loc6_.id);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc9_ = 0;
               _loc10_ = _loc8_.res.name;
               _loc9_ = Number(_loc6_.zhi);
               _loc11_ = "";
               if(_loc9_ < 0)
               {
                  _loc11_ = String(_loc9_).replace("-","");
                  _loc11_ = _loc11_ + "%";
               }
               else
               {
                  _loc11_ = String(_loc9_);
               }
               _loc12_ = "";
               _loc12_ = _loc12_ + "<textformat leading=\'6\'>";
               _loc12_ = _loc12_ + _loc10_;
               _loc12_ = _loc12_ + ("<br />" + LanResManager.getLanCommonTextWords("天赋属性:") + "<br />");
               _loc12_ = _loc12_ + ("             " + this.typeName(int(_loc3_[3])) + "：" + _loc11_ + "<br />");
               _loc13_ = _loc6_.time;
               if(_loc13_ != "0")
               {
                  _loc12_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("有效期：") + _loc13_ + "</font>";
               }
               else if(this.hxTime != "0")
               {
                  if(_loc6_.state == 0)
                  {
                     _loc13_ = this.hxTime;
                     _loc12_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("有效期：") + _loc13_ + "</font>";
                  }
               }
               _loc12_ += "</textformat>";
               this.showTip(_loc12_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.x = Tools.currentStage.mouseX + 15;
                  this.tipCanvas.y = Tools.currentStage.mouseY + 12;
               }
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 5;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 12;
      }
      
      public function ywRe(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:ItemFace = null;
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:FLabel = null;
         if(param1 == 1)
         {
            if(this.curItem == null)
            {
               return;
            }
            _loc5_ = this.curItem;
            this.bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.bit.x = _loc5_.x + 2;
            this.bit.y = _loc5_.y + 2;
            this.bit.alpha = 0.2;
            this.lbl = new FLabel();
            this.lbl.x = _loc5_.x + 11;
            this.lbl.y = _loc5_.y + 16;
            this.lbl.text = this.typeName(param4);
            this.lbl.textColor = StaticValue.ORANGE;
            this.lbl.name = "lbl" + _loc7_;
            this["container" + (this.selectTF1 + 1)].removeChild(this.curItem);
            _loc6_ = this.tfGS(this.selectTF1,param4);
            _loc7_ = int(_loc6_.g);
            _loc8_ = this["container" + (this.selectTF1 + 1)].getChildByName("lbl" + _loc7_) as FLabel;
            if(_loc8_ != null)
            {
               if(_loc8_.text == "")
               {
                  this["container" + (this.selectTF1 + 1)].addChild(this.bit);
                  this["container" + (this.selectTF1 + 1)].addChild(this.lbl);
               }
            }
            else
            {
               this["container" + (this.selectTF1 + 1)].addChild(this.bit);
               this["container" + (this.selectTF1 + 1)].addChild(this.lbl);
            }
         }
         if(this.select != null && this.select.parent != null)
         {
            this.select.parent.removeChild(this.select);
         }
         this.select = null;
      }
      
      public function hxRe(param1:int, param2:int, param3:int, param4:int, param5:String) : void
      {
         var _loc6_:ItemFace = null;
         var _loc7_:Object = null;
         if(param1 == 1)
         {
            if(this.tfAr.length != 0)
            {
               this.hxTime = "0";
               _loc6_ = this.tfAr[this.selectTF1][this.selectTF2] as ItemFace;
               _loc7_ = this.ars[this.selectTF1][this.selectTF2] as Object;
               _loc7_.state = 1;
               _loc7_.time = param5;
               this.hxTime = param5;
               if(_loc6_ == null)
               {
                  return;
               }
               _loc6_.filters = [];
            }
         }
      }
      
      public function xqRe(param1:int, param2:int, param3:int, param4:int, param5:Object) : void
      {
         var _loc6_:ItemFace = new ItemFace(this.xqTF);
         var _loc7_:String = "";
         var _loc8_:Object = this.tfGS(param3 - 1,param4);
         var _loc9_:Object = new Object();
         _loc9_.jh = 1;
         _loc9_.id = this.xqTF.id;
         _loc9_.name = this.typeName(param4);
         _loc9_.t = param4;
         _loc9_.zhi = param5.zhi;
         var _loc10_:int = int(_loc8_.g);
         _loc9_.type = param5.type;
         _loc9_.state = 0;
         _loc9_.time = param5.time;
         _loc9_.x = this.ars[param3 - 1][_loc10_].x;
         _loc9_.y = this.ars[param3 - 1][_loc10_].y;
         _loc9_.gid = param5.goid;
         _loc9_.gnum = param5.gonum;
         _loc9_.copper = param5.copper;
         _loc9_.gas = param5.gas;
         this.ars[param3 - 1][_loc10_] = _loc9_;
         _loc6_.name = this.xqTF.id + "," + _loc8_.g + "," + (param3 - 1) + "," + param4 + "," + param5.copper + "," + param5.gas + "," + this.xqTF.id;
         this.xqTFX -= 150 * (param3 - 1);
         _loc6_.x = this.xqTFX + 2;
         _loc6_.y = this.xqTFY + 2;
         _loc6_.addEventListener(MouseEvent.CLICK,this.onItemClick);
         switch(param3 - 1)
         {
            case 0:
               this.container1.addChild(_loc6_);
               break;
            case 1:
               this.container2.addChild(_loc6_);
               break;
            case 2:
               this.container3.addChild(_loc6_);
               break;
            case 3:
               this.container4.addChild(_loc6_);
         }
         _loc6_.removeListener();
         _loc6_.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         _loc6_.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
      }
      
      private function tfGS(param1:int, param2:int) : Object
      {
         var _loc5_:int = 0;
         var _loc3_:Object = new Object();
         var _loc4_:Object = new Object();
         while(_loc5_ < 5)
         {
            if(this.ars[param1][_loc5_].t == param2)
            {
               _loc3_.g = _loc5_;
               break;
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      private function typeName(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("攻击");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("防御");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("暴击");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("闪避");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("生命");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("体力");
               break;
            case 7:
               _loc2_ = LanResManager.getLanCommonTextWords("内力");
         }
         return _loc2_;
      }
      
      public function lockon() : void
      {
         this.btnHX.enabled = false;
         this.btnYW.enabled = false;
         this.lockon1 = 1;
      }
      
      public function unlock() : void
      {
         this.btnHX.enabled = true;
         this.btnYW.enabled = true;
         this.lockon1 = 0;
      }
   }
}

