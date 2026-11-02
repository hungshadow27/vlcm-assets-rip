package com.tgame.shell.view.components.ride
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.shell.view.components.RidePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.*;
   
   public class GradeUpgradeCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var _avatar:Bitmap;
      
      private var _mask:Shape;
      
      private var upgradeTip:FLabel;
      
      private var upgradeTip1:FLabel;
      
      private var expendTip:FTextArea;
      
      private var startBtn:SecondButton;
      
      public var sqlgdBtn:SecondButton;
      
      private var colorBar:ColorBar;
      
      private var checkBox:FCheckBox;
      
      public var $parent:DisplayObject;
      
      private var itemContainer:Sprite;
      
      private var itemContainer1:Sprite;
      
      private var tipBtn:SmallButton;
      
      private var tipPanel:RideFeedTipPanel;
      
      private var addBuff:ItemFace;
      
      private var shenQiLianGuDanTip:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var rTime:int;
      
      public function GradeUpgradeCanvas()
      {
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.ridefeed.gradeUpgrade.ui";
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.init();
      }
      
      private function init() : void
      {
         var text:FLabel;
         var text1:FTextArea;
         var lb:FLabel;
         this._mask = new Shape();
         with(this._mask)
         {
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,174,110);
            graphics.endFill();
         }
         this._mask.x = 4;
         this._mask.y = 30;
         addChild(this._mask);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         this.upgradeTip1 = new FLabel();
         with(this.upgradeTip1)
         {
            x = 5;
            y = 5 - 20;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("您当前的坐骑：");
         }
         addChild(this.upgradeTip1);
         this.upgradeTip = new FLabel();
         with(this.upgradeTip)
         {
            x = 5;
            y = 5;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("可以进阶为：");
         }
         addChild(this.upgradeTip);
         text = new FLabel();
         with(text)
         {
            x = 222;
            y = 30;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            text = LanResManager.getLanCommonTextWords("进阶流程");
         }
         addChild(text);
         text1 = new FTextArea();
         with(text1)
         {
            width = 137;
            height = 88;
            x = 186;
            y = 52;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            wordWrap = true;
         }
         text1.htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanTextWords(this,"进阶流程内容") + "</textformat>";
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            width = 310;
            height = 40;
            x = 8;
            y = 144;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            wordWrap = true;
         }
         text1.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"进阶提示") + "</textformat>";
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            width = 310;
            height = 48;
            x = 10;
            y = 187;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            wordWrap = true;
         }
         text1.htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanTextWords(this,"进阶成功几率祝福值") + "</textformat>";
         addChild(text1);
         this.expendTip = new FTextArea();
         with(this.expendTip)
         {
            width = 178;
            height = 45;
            x = 140;
            y = 240;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.expendTip);
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 118;
         this.checkBox.y = 287;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         lb = new FLabel();
         with(lb)
         {
            x = 140;
            y = 288;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本次操作使用进阶符");
         }
         addChild(lb);
         this.colorBar = new ColorBar(5,147,5,true);
         addChild(this.colorBar);
         this.colorBar.x = 135;
         this.colorBar.y = 192;
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 18;
         this.itemContainer.y = 265;
         this.itemContainer1 = new Sprite();
         addChild(this.itemContainer1);
         this.itemContainer1.x = 72;
         this.itemContainer1.y = 265;
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始提升");
         addChild(this.startBtn);
         this.startBtn.x = (328 - this.startBtn.width) / 2;
         this.startBtn.y = 316;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.sqlgdBtn = new SecondButton();
         this.sqlgdBtn.label = LanResManager.getLanCommonTextWords("使用神奇炼骨丹进阶");
         addChild(this.sqlgdBtn);
         this.sqlgdBtn.x = 328 - this.sqlgdBtn.width;
         this.sqlgdBtn.y = 316;
         this.sqlgdBtn.visible = false;
         this.sqlgdBtn.addEventListener(MouseEvent.CLICK,this.onStart);
         this.tipBtn = new SmallButton();
         this.tipBtn.label = LanResManager.getLanCommonTextWords("提示");
         this.tipBtn.x = 288;
         this.tipBtn.y = 185;
         addChild(this.tipBtn);
         this.tipBtn.addEventListener(MouseEvent.CLICK,this.onTip);
      }
      
      private function onTip(param1:MouseEvent = null) : void
      {
         if(!this.tipPanel)
         {
            this.tipPanel = new RideFeedTipPanel();
            GameInstance.uiInstance.uiContainer.addChild(this.tipPanel);
            this.tipPanel.x = (GameConfig.sceneWidth - this.tipPanel.panelWidth) / 2;
            this.tipPanel.y = (GameConfig.sceneHeight - this.tipPanel.panelHeight) / 2;
            this.tipPanel.setRTime(this.rTime);
         }
         else if(this.tipPanel.parent)
         {
            this.tipPanel.parent.removeChild(this.tipPanel);
         }
         else if(!this.tipPanel.parent)
         {
            this.tipPanel.visible = true;
            GameInstance.uiInstance.uiContainer.addChild(this.tipPanel);
            this.tipPanel.x = (GameConfig.sceneWidth - this.tipPanel.panelWidth) / 2;
            this.tipPanel.y = (GameConfig.sceneHeight - this.tipPanel.panelHeight) / 2;
            this.tipPanel.setRTime(this.rTime);
         }
      }
      
      public function showTip(param1:Function) : void
      {
         this.onTip();
         this.tipPanel.fun = param1;
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.GRADEUPGRADE_START));
               break;
            case this.sqlgdBtn:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_REED_SHENQILIANGUDAN_SHOW));
         }
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(RidePanel.GRADEUPGRADE_JINJIEFU_USE,"",this.checkBox.selectState));
      }
      
      private function showShenQiLianGudanTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.tip.htmlText = LanResManager.getLanTextWords(this,"神奇炼骨丹活动鼠标TIPS",[StaticValue.GREEN_HTML,StaticValue.RED_HTML]);
               addChild(this.tipCanvas);
               this.tipCanvas.width = this.tip.width + 4;
               this.tipCanvas.height = this.tip.height + 4;
               this.tipCanvas.x = mouseX + 15;
               this.tipCanvas.y = mouseY + 25;
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
         }
      }
      
      public function setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
      }
      
      public function setUpgradeGradeName(param1:String, param2:String) : void
      {
         this.upgradeTip1.text = LanResManager.getLanCommonTextWords("您当前的坐骑：") + param1;
         this.upgradeTip.text = LanResManager.getLanCommonTextWords("可以进阶为：") + param2;
      }
      
      public function setUpgradeAvatar(param1:BitmapData, param2:String) : void
      {
      }
      
      public function setUpgradeProbability(param1:Number, param2:Number) : void
      {
         this.colorBar.setValue(param1,param2);
      }
      
      public function setUpgradeExpendItem(param1:BaseItem = null, param2:BaseItem = null, param3:Boolean = false) : void
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.itemContainer.addChild(new ItemFace(param1));
         if(!param3)
         {
            this.itemContainer.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.itemContainer.filters = [];
         }
         while(this.itemContainer1.numChildren > 0)
         {
            this.itemContainer1.removeChildAt(0);
         }
         var _loc4_:ItemFace = new ItemFace(param2);
         _loc4_.setShowCount(false);
         this.itemContainer1.addChild(_loc4_);
         if(param2.count == 0)
         {
            this.itemContainer1.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.itemContainer1.filters = [];
            this.checkBox.enabled = true;
         }
         this.$parent.dispatchEvent(new BaseEvent(RidePanel.GRADEUPGRADE_JINJIEFU_USE,"",this.checkBox.selectState));
      }
      
      public function setUpgradeExpend(param1:int, param2:int, param3:int = 0) : void
      {
         this.expendTip.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("本次操作消耗铜钱") + LanResManager.getLanCommonTextWords("：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("本次操作成功几率") + LanResManager.getLanCommonTextWords("：") + param2 + "%" + (param3 > 0 ? "<font color=\'" + StaticValue.RED_HTML + "\'>+" + param3 + "%</font>" : "") + "</textformat>";
      }
      
      public function setAddBuff(param1:Buff) : void
      {
         if(this.addBuff)
         {
            if(this.addBuff.parent)
            {
               this.addBuff.parent.removeChild(this.addBuff);
            }
            this.addBuff.destroy();
         }
         if(!param1)
         {
            return;
         }
         this.addBuff = new ItemFace(param1);
         addChild(this.addBuff);
         this.addBuff.x = 289;
         this.addBuff.y = 272;
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         if(this._avatar.width >= 512 && this._avatar.height >= 218)
         {
            _loc2_ = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
            if(_loc2_.width > 229)
            {
               this._avatar.scaleX = this._avatar.scaleY = 229 / _loc2_.width;
            }
            this._avatar.x = 71 - this._avatar.width / 2;
         }
         else
         {
            _loc3_ = 1;
            if(this._avatar.height != 110)
            {
               _loc3_ = 110 / this._avatar.height;
            }
            _loc2_ = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
            this._avatar.bitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            this._avatar.bitmapData.copyPixels(param1,_loc2_,new Point(0,0));
            _loc4_ = 1;
            if(_loc2_.width > 174)
            {
               _loc4_ = 174 / _loc2_.width;
            }
            this._avatar.scaleX = this._avatar.scaleY = _loc3_ > _loc4_ ? _loc4_ : _loc3_;
            this._avatar.x = 91 - this._avatar.width / 2;
         }
         this._avatar.y = 85 - this._avatar.height / 2;
      }
      
      public function isShowShenQiLianGuDanTip(param1:Boolean) : void
      {
         var value:Boolean = param1;
         if(value)
         {
            if(!this.shenQiLianGuDanTip)
            {
               this.shenQiLianGuDanTip = new FTextArea();
               with(this.shenQiLianGuDanTip)
               {
                  
                  x = 5;
                  y = 320;
                  textColor = StaticValue.GREEN;
                  autoSize = TextFieldAutoSize.LEFT;
                  filters = StaticValue.filter;
                  htmlText = "<u>" + LanResManager.getLanCommonTextWords("神奇炼骨丹大奖说明") + "</u>";
                  addEventListener(MouseEvent.MOUSE_OVER,showShenQiLianGudanTip);
                  addEventListener(MouseEvent.MOUSE_OUT,showShenQiLianGudanTip);
               }
               addChild(this.shenQiLianGuDanTip);
            }
            this.shenQiLianGuDanTip.visible = value;
         }
         else if(this.shenQiLianGuDanTip)
         {
            this.shenQiLianGuDanTip.visible = value;
         }
      }
      
      public function setRTime(param1:int) : void
      {
         this.rTime = param1;
      }
   }
}

