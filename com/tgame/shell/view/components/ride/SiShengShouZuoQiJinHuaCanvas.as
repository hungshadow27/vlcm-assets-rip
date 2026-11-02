package com.tgame.shell.view.components.ride
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.MountSkill;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.RidePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.*;
   
   public class SiShengShouZuoQiJinHuaCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      public var $parent:DisplayObject;
      
      private var _point1:int;
      
      private var point1:int;
      
      private var _point2:int;
      
      private var point2:int;
      
      private var _point3:int;
      
      private var point3:int;
      
      private var _point4:int;
      
      private var point4:int;
      
      private var _point5:int;
      
      private var point5:int;
      
      private var allAddP1Btn:FSimpleButton;
      
      private var addP1Btn:FSimpleButton;
      
      private var subP1Btn:FSimpleButton;
      
      private var allSubP1Btn:FSimpleButton;
      
      private var allAddP2Btn:FSimpleButton;
      
      private var addP2Btn:FSimpleButton;
      
      private var subP2Btn:FSimpleButton;
      
      private var allSubP2Btn:FSimpleButton;
      
      private var allAddP3Btn:FSimpleButton;
      
      private var addP3Btn:FSimpleButton;
      
      private var subP3Btn:FSimpleButton;
      
      private var allSubP3Btn:FSimpleButton;
      
      private var allAddP4Btn:FSimpleButton;
      
      private var addP4Btn:FSimpleButton;
      
      private var subP4Btn:FSimpleButton;
      
      private var allSubP4Btn:FSimpleButton;
      
      private var okBtn:SmallButton;
      
      private var autoBtn:SmallButton;
      
      private var weiBtn:SecondButton;
      
      private var StartUpBtn:SecondButton;
      
      private var pointTitle:FTextArea;
      
      private var pointValue:FTextArea;
      
      private var introduceText:FTextArea;
      
      private var text:FTextArea;
      
      private var text1:FTextArea;
      
      private var Value1:FTextArea;
      
      private var skillContainer:Sprite;
      
      private var foodContainer:Sprite;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var currShowItem:ItemFace;
      
      private var imgIco1:DisplayObject;
      
      private var strIcoMath:String;
      
      private var ftaC1:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var ft:FTextArea;
      
      private var _avatar:Bitmap;
      
      public function SiShengShouZuoQiJinHuaCanvas()
      {
         var bg:Bitmap;
         super();
         this.bgImg = new Bitmap();
         this.bgImg.x = 10;
         addChild(this.bgImg);
         this.bgImg.name = "ui.ride.sishenshou.ui";
         bg = StaticValue.getBitmapByClassName("ui.ride.sishenshou.jiadianShuxing.tet");
         addChild(bg);
         bg.x = 218;
         bg.y = 112;
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 10;
            y = -20 + 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("坐骑进化：");
         }
         addChild(this.ft);
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
         this.foodContainer = new Sprite();
         addChild(this.foodContainer);
         this.foodContainer.x = 277;
         this.foodContainer.y = 28;
         with(this.foodContainer.graphics)
         {
            beginFill(0,0.5);
            drawRect(0,0,35,35);
            endFill();
         }
         this.foodContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.foodContainer.addEventListener(MouseEvent.MOUSE_UP,this.onfoodClick,false,30);
         this.foodContainer.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.foodContainer.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         this.skillContainer = new Sprite();
         addChild(this.skillContainer);
         this.skillContainer.x = 22;
         this.skillContainer.y = 261;
         this.skillContainer.addEventListener(MouseEvent.CLICK,this.skillOnClick);
         this.ftaC1 = new FTextArea();
         with(this.ftaC1)
         {
            width = 150;
            height = 60;
            x = 20;
            y = 35;
            filters = StaticValue.filter;
            textColor = StaticValue.RED;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.ftaC1);
         this.introduceText = new FTextArea();
         with(this.introduceText)
         {
            width = 140;
            height = 130;
            x = 20;
            y = 120;
            filters = StaticValue.filter;
            textColor = StaticValue.BlUE20;
            wordWrap = true;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("青龙在二十八星宿之中，由东方七宿：角、亢、氐、房、心、尾、箕组成，形似‘龙是东方的代表，而东方在五行中属木，色为青，所以称之‘青龙代表春季。") + "</textformat>";
         }
         addChild(this.introduceText);
         this.text = new FTextArea();
         with(this.text)
         {
            width = 80;
            height = 80;
            x = 185;
            y = 20;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            wordWrap = true;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("将物品拖入喂食框中，点击【喂】可使圣兽快速升级，增强战斗力。") + "</textformat>";
         }
         addChild(this.text);
         this.weiBtn = new SecondButton();
         this.weiBtn.label = LanResManager.getLanCommonTextWords("喂");
         addChild(this.weiBtn);
         this.weiBtn.x = 270;
         this.weiBtn.y = 70;
         this.weiBtn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.pointTitle = new FTextArea();
         with(this.pointTitle)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 165;
            y = 136;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'9\'>" + LanResManager.getLanCommonTextWords("进攻型防御型轻身型健体型潜能点") + "</textformat>";
         }
         addChild(this.pointTitle);
         this.pointValue = new FTextArea();
         with(this.pointValue)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 214;
            y = 135;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'10\'>" + "0<br>" + "0<br>" + "0<br>" + "0<br>" + "0</textformat>";
         }
         addChild(this.pointValue);
         this.allAddP1Btn = new FSimpleButton();
         this.allAddP1Btn.skin = "upButton";
         this.allAddP1Btn.toolTip = LanResManager.getLanTextWords(this,"将剩余的潜能点全部分配到进攻型",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         addChild(this.allAddP1Btn);
         this.allAddP1Btn.x = 243;
         this.allAddP1Btn.y = 135;
         this.allAddP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP1Btn = new FSimpleButton();
         this.addP1Btn.skin = "sumButton";
         this.addP1Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将点潜能点分配到进攻型",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.addP1Btn);
         this.addP1Btn.x = 265;
         this.addP1Btn.y = 135;
         this.addP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP1Btn = new FSimpleButton();
         this.subP1Btn.skin = "subButton";
         this.subP1Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将未确定分配的个点数还原到潜能点上",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.subP1Btn);
         this.subP1Btn.x = 287;
         this.subP1Btn.y = 135;
         this.subP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP1Btn = new FSimpleButton();
         this.allSubP1Btn.skin = "bottomButton";
         this.allSubP1Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将全部未确定分配的点数还原到潜能点上",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.allSubP1Btn);
         this.allSubP1Btn.x = 309;
         this.allSubP1Btn.y = 135;
         this.allSubP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allAddP2Btn = new FSimpleButton();
         this.allAddP2Btn.skin = "upButton";
         this.allAddP2Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将剩余的潜能点全部分配到防御型",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.allAddP2Btn);
         this.allAddP2Btn.x = 243;
         this.allAddP2Btn.y = 160;
         this.allAddP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP2Btn = new FSimpleButton();
         this.addP2Btn.skin = "sumButton";
         this.addP2Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将点潜能点分配到防御型",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.addP2Btn);
         this.addP2Btn.x = 265;
         this.addP2Btn.y = 160;
         this.addP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP2Btn = new FSimpleButton();
         this.subP2Btn.skin = "subButton";
         this.subP2Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将未确定分配的个点数还原到潜能点上",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.subP2Btn);
         this.subP2Btn.x = 287;
         this.subP2Btn.y = 160;
         this.subP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP2Btn = new FSimpleButton();
         this.allSubP2Btn.skin = "bottomButton";
         this.allSubP2Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将全部未确定分配的点数还原到潜能点上",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.allSubP2Btn);
         this.allSubP2Btn.x = 309;
         this.allSubP2Btn.y = 160;
         this.allSubP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allAddP3Btn = new FSimpleButton();
         this.allAddP3Btn.skin = "upButton";
         this.allAddP3Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将剩余的潜能点全部分配到轻身型",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.allAddP3Btn);
         this.allAddP3Btn.x = 243;
         this.allAddP3Btn.y = 185;
         this.allAddP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP3Btn = new FSimpleButton();
         this.addP3Btn.skin = "sumButton";
         this.addP3Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将点潜能点分配到轻身型",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.addP3Btn);
         this.addP3Btn.x = 265;
         this.addP3Btn.y = 185;
         this.addP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP3Btn = new FSimpleButton();
         this.subP3Btn.skin = "subButton";
         this.subP3Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将未确定分配的个点数还原到潜能点上",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.subP3Btn);
         this.subP3Btn.x = 287;
         this.subP3Btn.y = 185;
         this.subP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP3Btn = new FSimpleButton();
         this.allSubP3Btn.skin = "bottomButton";
         this.allSubP3Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将全部未确定分配的点数还原到潜能点上",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.allSubP3Btn);
         this.allSubP3Btn.x = 309;
         this.allSubP3Btn.y = 185;
         this.allSubP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allAddP4Btn = new FSimpleButton();
         this.allAddP4Btn.skin = "upButton";
         this.allAddP4Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将剩余的潜能点全部分配到健体型",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.allAddP4Btn);
         this.allAddP4Btn.x = 243;
         this.allAddP4Btn.y = 210;
         this.allAddP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP4Btn = new FSimpleButton();
         this.addP4Btn.skin = "sumButton";
         this.addP4Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将点潜能点分配到健体型",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.addP4Btn);
         this.addP4Btn.x = 265;
         this.addP4Btn.y = 210;
         this.addP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP4Btn = new FSimpleButton();
         this.subP4Btn.skin = "subButton";
         this.subP4Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将未确定分配的个点数还原到潜能点上",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.subP4Btn);
         this.subP4Btn.x = 287;
         this.subP4Btn.y = 210;
         this.subP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP4Btn = new FSimpleButton();
         this.allSubP4Btn.skin = "bottomButton";
         this.allSubP4Btn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"将全部未确定分配的点数还原到潜能点上",[StaticValue.RED_HTML]) + "</textformat>";
         addChild(this.allSubP4Btn);
         this.allSubP4Btn.x = 309;
         this.allSubP4Btn.y = 210;
         this.allSubP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.okBtn = new SmallButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         this.okBtn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"分配潜能点之后点确定按钮让分配方案生效",[StaticValue.WHITE_HTML]) + "</textformat>";
         addChild(this.okBtn);
         this.okBtn.x = 245;
         this.okBtn.y = 235;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.autoBtn = new SmallButton();
         this.autoBtn.label = LanResManager.getLanCommonTextWords("推荐");
         this.autoBtn.toolTip = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,"如果您是一位新手可以按照推荐方案进行配点",[StaticValue.WHITE_HTML]) + "</textformat>";
         addChild(this.autoBtn);
         this.autoBtn.x = 290;
         this.autoBtn.y = 235;
         this.autoBtn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.text1 = new FTextArea();
         with(this.text1)
         {
            x = 188;
            y = 262;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'3\'>" + LanResManager.getLanCommonTextWords("需要等级：铜币消耗：真气消耗：") + "</textformat>";
         }
         addChild(this.text1);
         this.Value1 = new FTextArea();
         with(this.Value1)
         {
            x = 285;
            y = 262;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'3\'>" + "0<br>" + "0<br>" + "0" + "</textformat>";
         }
         this.addChild(this.Value1);
         this.StartUpBtn = new SecondButton();
         this.StartUpBtn.label = LanResManager.getLanCommonTextWords("开始进阶");
         this.StartUpBtn.x = 215;
         this.StartUpBtn.y = 316;
         this.StartUpBtn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addChild(this.StartUpBtn);
         this.StartUpBtn.enabled = false;
         this._avatar = new Bitmap();
         this._avatar.name = "avatar";
         addChild(this._avatar);
      }
      
      protected function onMouseTip3(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.showTip("<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以放入经验丹，来提升坐骑经验。") + "</font></textformat>");
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
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function onfoodClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_FEED_JINJIE_DRAG_ENTER));
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.foodContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.foodContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_FEED_JINJIE_DRAG_START,"",this.currItem));
            this.foodContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onPoint(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.target)
         {
            case this.allAddP1Btn:
               if(this._point5 > 0)
               {
                  this._point1 += this._point5;
                  this._point5 = 0;
               }
               break;
            case this.addP1Btn:
               if(this._point5 > 0)
               {
                  this._point1 += 1;
                  --this._point5;
               }
               break;
            case this.subP1Btn:
               if(this._point1 > this.point1)
               {
                  --this._point1;
                  this._point5 += 1;
               }
               break;
            case this.allSubP1Btn:
               if(this._point1 > this.point1)
               {
                  this._point5 += this._point1 - this.point1;
                  this._point1 = this.point1;
               }
               break;
            case this.allAddP2Btn:
               if(this._point5 > 0)
               {
                  this._point2 += this._point5;
                  this._point5 = 0;
               }
               break;
            case this.addP2Btn:
               if(this._point5 > 0)
               {
                  this._point2 += 1;
                  --this._point5;
               }
               break;
            case this.subP2Btn:
               if(this._point2 > this.point2)
               {
                  --this._point2;
                  this._point5 += 1;
               }
               break;
            case this.allSubP2Btn:
               if(this._point2 > this.point2)
               {
                  this._point5 += this._point2 - this.point2;
                  this._point2 = this.point2;
               }
               break;
            case this.allAddP3Btn:
               if(this._point5 > 0)
               {
                  this._point3 += this._point5;
                  this._point5 = 0;
               }
               break;
            case this.addP3Btn:
               if(this._point5 > 0)
               {
                  this._point3 += 1;
                  --this._point5;
               }
               break;
            case this.subP3Btn:
               if(this._point3 > this.point3)
               {
                  --this._point3;
                  this._point5 += 1;
               }
               break;
            case this.allSubP3Btn:
               if(this._point3 > this.point3)
               {
                  this._point5 += this._point3 - this.point3;
                  this._point3 = this.point3;
               }
               break;
            case this.allAddP4Btn:
               if(this._point5 > 0)
               {
                  this._point4 += this._point5;
                  this._point5 = 0;
               }
               break;
            case this.addP4Btn:
               if(this._point5 > 0)
               {
                  this._point4 += 1;
                  --this._point5;
               }
               break;
            case this.subP4Btn:
               if(this._point4 > this.point4)
               {
                  --this._point4;
                  this._point5 += 1;
               }
               break;
            case this.allSubP4Btn:
               if(this._point4 > this.point4)
               {
                  this._point5 += this._point4 - this.point4;
                  this._point4 = this.point4;
               }
               break;
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_FEED_JINJIE_OKBTN,"",[this._point1,this._point2,this._point3,this._point4]));
               break;
            case this.autoBtn:
               if(this.point5 == 0)
               {
                  return;
               }
               this._point5 = this.point5;
               this._point1 = this.point1;
               this._point1 += this._point5 - int(this._point5 * 0.2) - int(this._point5 * 0.2) - int(this._point5 * 0.2);
               this._point2 = this.point2;
               this._point2 += int(this._point5 * 0.2);
               this._point3 = this.point3;
               this._point3 += int(this._point5 * 0.2);
               this._point4 = this.point4;
               this._point4 += int(this._point5 * 0.2);
               this._point5 = 0;
               break;
            case this.weiBtn:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_FEED_JINJIE_WEIBTN));
               break;
            case this.StartUpBtn:
               if(this.currShowItem != null)
               {
                  _loc2_ = this.currShowItem.getBaseItem().id;
                  this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_FEED_JINJIE_STARTJINJIE,"",_loc2_));
               }
         }
         this.pointValue.htmlText = "<textformat leading=\'10\'>" + this._point1 + "<br>" + this._point2 + "<br>" + this._point3 + "<br>" + this._point4 + "<br>" + this._point5 + "<br>" + "</textformat>";
      }
      
      private function skillOnClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         if(this.currShowItem)
         {
            this.currShowItem.showKungFuFram = false;
         }
         _loc2_.showKungFuFram = true;
         this.currShowItem = _loc2_;
         var _loc3_:int = _loc2_.getBaseItem().id;
         this.setJinJieTiaoJian(0,0,0);
         this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_FEED_JINJIE_SKILL_CHICK,"",_loc3_));
      }
      
      public function setAvatar(param1:BitmapData, param2:int) : void
      {
         this.avatar = param1;
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         var _loc2_:int = 160;
         var _loc3_:int = 105;
         var _loc4_:Rectangle = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
         if(_loc4_.width > _loc2_ || _loc4_.height > _loc3_)
         {
            _loc5_ = _loc2_ / _loc4_.width;
            _loc6_ = _loc3_ / _loc4_.height;
            if(_loc5_ > _loc6_)
            {
               this._avatar.scaleX = this._avatar.scaleY = _loc6_;
            }
            else
            {
               this._avatar.scaleX = this._avatar.scaleY = _loc5_;
            }
         }
         this._avatar.y = -20 + 50 - 30 + (_loc3_ - this._avatar.height) / 2;
         this._avatar.x = -30 - 130 + 160 + (_loc2_ - this._avatar.width) / 2;
      }
      
      public function setSkill(param1:Object, param2:int) : void
      {
         var _loc6_:ItemFace = null;
         var _loc7_:Skill = null;
         var _loc8_:MountSkill = null;
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         var _loc3_:Array = new Array(0,43,86,129,0,43,86,129);
         var _loc4_:Array = new Array(0,0,0,0,41,41,41,41);
         var _loc5_:int = 0;
         for each(_loc7_ in param1)
         {
            if(_loc7_ is MountSkill)
            {
               _loc6_ = new ItemFace(_loc7_ as Skill);
               if((_loc7_ as MountSkill).lv <= 0)
               {
                  _loc6_.setShowCount(false);
               }
               this.skillContainer.addChild(_loc6_);
               _loc6_.x = _loc3_[_loc5_];
               _loc6_.y = _loc4_[_loc5_];
               if((_loc7_ as Skill).id == param2)
               {
                  _loc6_.showKungFuFram = true;
                  this.StartUpBtn.enabled = true;
                  this.currShowItem = _loc6_;
               }
               _loc8_ = _loc7_ as MountSkill;
               if(_loc8_.lv == 0)
               {
                  _loc6_.filters = Tools.blackWhiteFilter;
               }
               _loc5_++;
            }
         }
      }
      
      public function setPoint(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this._point1 = this.point1 = param1;
         this._point2 = this.point2 = param2;
         this._point3 = this.point3 = param3;
         this._point4 = this.point4 = param4;
         this._point5 = this.point5 = param5;
         this.pointValue.htmlText = "<textformat leading=\'10\'>" + this._point1 + "<br>" + this._point2 + "<br>" + this._point3 + "<br>" + this._point4 + "<br>" + this._point5 + "<br>" + "</textformat>";
      }
      
      public function setJinJieTiaoJian(param1:int, param2:int, param3:int) : void
      {
         this.Value1.htmlText = "<textformat leading=\'3\'>" + param1 + "<br>" + param2 + "<br>" + param3 + "<br>" + "</textformat>";
         this.StartUpBtn.enabled = true;
      }
      
      public function setFood(param1:Goods = null) : void
      {
         while(this.foodContainer.numChildren > 0)
         {
            this.foodContainer.removeChildAt(0);
         }
         if(param1 == null)
         {
            return;
         }
         this.foodContainer.addChild(new ItemFace(param1));
      }
      
      public function setIntroduceTextAndAvatar(param1:int) : void
      {
         if(param1 == 0)
         {
            if(this.imgIco1 != null && this.imgIco1.parent != null)
            {
               this.imgIco1.parent.removeChild(this.imgIco1);
            }
            this.ftaC1.htmlText = LanResManager.getLanCommonTextWords("该坐骑无法进化,只有圣兽以上才可以进化！");
            this.introduceText.htmlText = "";
            return;
         }
         this.ftaC1.htmlText = "";
         switch(param1)
         {
            case 1:
               this.introduceText.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("青龙在二十八星宿之中，由东方七宿：角、亢、氐、房、心、尾、箕组成，形似龙。是东方的代表，而东方在五行中属木，色为青，所以称之青龙，代表春季。") + "</textformat>";
               break;
            case 2:
               this.introduceText.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("白虎在二十八星宿之中，由西方七宿：奎、娄、胃、昂、毕、觜、参组成，形似虎。是西方的代表，而西方在五行中属金，色为白。所以称之白虎，代表秋季。") + "</textformat>";
               break;
            case 3:
               this.introduceText.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("朱雀在二十八星宿之中，由南方七宿：井、鬼、柳、星、张、翼、轸组成，形似鸟。是南方的代表，而南方在五行中属火，色为赤，赤为朱。所以称之朱雀，代表夏季。") + "</textformat>";
               break;
            case 4:
               this.introduceText.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("玄武在二十八星宿之中，由北方七宿：斗、牛、女、虚、危、室、壁组成，形似龟蛇。是北方的代表，而北方在五行中属水，色为黑，黑为武。所以称之玄武，代表冬季。") + "</textformat>";
         }
      }
      
      public function BtnInit(param1:Boolean) : void
      {
         this.allAddP1Btn.enabled = param1;
         this.addP1Btn.enabled = param1;
         this.subP1Btn.enabled = param1;
         this.allSubP1Btn.enabled = param1;
         this.allAddP2Btn.enabled = param1;
         this.addP2Btn.enabled = param1;
         this.subP2Btn.enabled = param1;
         this.allSubP2Btn.enabled = param1;
         this.allAddP3Btn.enabled = param1;
         this.addP3Btn.enabled = param1;
         this.subP3Btn.enabled = param1;
         this.allSubP3Btn.enabled = param1;
         this.allAddP4Btn.enabled = param1;
         this.addP4Btn.enabled = param1;
         this.subP4Btn.enabled = param1;
         this.allSubP4Btn.enabled = param1;
         this.okBtn.enabled = param1;
         this.autoBtn.enabled = param1;
         this.weiBtn.enabled = param1;
         this.StartUpBtn.enabled = param1;
      }
   }
}

