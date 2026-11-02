package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFieldAutoSize;
   
   public class BiwuDahuiGuizeCanvas extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var bgImg:F9GridBitmap;
      
      private var _title:Bitmap;
      
      private var tz:Sprite;
      
      public function BiwuDahuiGuizeCanvas()
      {
         var _loc1_:FCanvas = null;
         var _loc2_:FTextArea = null;
         super();
         _loc1_ = new FCanvas();
         _loc1_.skin = "canvas1";
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 631;
         _loc1_.height = 406 - 50 + 6 + 40 + 15 + 40;
         addChild(_loc1_);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.bgImg = Tools.get9GridBitmpByName("biwuDahui_bg");
         this.bgImg.width = 691 - 76 + 1;
         this.bgImg.height = 396 - 50 + 40 + 15 + 40;
         addChild(this.bgImg);
         this.bgImg.x = 8;
         this.bgImg.y = 10;
         this._title = StaticValue.getBitmapByClassName("ui.biwuDahui.guizhe.txt");
         addChild(this._title);
         this._title.x = width / 2 - this._title.width / 2;
         this._title.y = 19;
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         _loc2_ = new FTextArea();
         _loc2_.textColor = StaticValue.ORANGE;
         _loc2_.width = 608;
         _loc2_.htmlText = LanResManager.getLanCommonTextWords("小组战：") + "<br><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家持有专属比武大会门票传入地图，开始混战，击败所有玩家，并将其他玩家赶出地图，剩下最后一人为胜") + "<br />" + LanResManager.getLanCommonTextWords("，胜者可进入三十二强争夺战。") + "</font>";
         addChild(_loc2_);
         _loc2_.x = 13;
         _loc2_.y = 42;
         _loc2_ = new FTextArea();
         _loc2_.textColor = StaticValue.ORANGE;
         _loc2_.width = 608;
         _loc2_.htmlText = LanResManager.getLanCommonTextWords("复活战：") + "<br><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("小组战比赛完后，在争夺小组战失利的玩家使用复活卷轴，将参加复活战的玩家传入地图，击败所有参加复活") + "<br>" + LanResManager.getLanCommonTextWords("战的玩家，并将其他玩家赶出地图，剩下最后一人，可变为黑马选手进入三十二强对决战。") + "</font>";
         addChild(_loc2_);
         _loc2_.x = 13;
         _loc2_.y = 92;
         _loc2_ = new FTextArea();
         _loc2_.textColor = StaticValue.ORANGE;
         _loc2_.width = 608;
         _loc2_.htmlText = LanResManager.getLanCommonTextWords("三十二强对决战：") + "<br><font color=\'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("三十二位晋级玩家，进行对决。传入地图后，玩家重新获得天山雪莲朵，在地图内耗尽对方的天山雪") + "<br>" + LanResManager.getLanCommonTextWords("莲，并将其赶出地图为胜，胜者将进入十六强对决战。") + "</font>";
         addChild(_loc2_);
         _loc2_.x = 13;
         _loc2_.y = 142;
         _loc2_ = new FTextArea();
         _loc2_.textColor = StaticValue.ORANGE;
         _loc2_.width = 608;
         _loc2_.htmlText = LanResManager.getLanCommonTextWords("十六强对决战：") + "<br><font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("十六位晋级玩家，进行对决。传入地图后，玩家重新获得天山雪莲朵，在地图内耗尽对方的天山雪莲") + "<br>" + LanResManager.getLanCommonTextWords("，并将其赶出地图为胜，胜者将进入八强对决战。") + "</font>";
         addChild(_loc2_);
         _loc2_.x = 13;
         _loc2_.y = 192;
         _loc2_ = new FTextArea();
         _loc2_.textColor = StaticValue.ORANGE;
         _loc2_.width = 608;
         _loc2_.htmlText = LanResManager.getLanCommonTextWords("八强对决战：") + "<br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("八位晋级玩家，进行对决。传入地图后，玩家重新获得天山雪莲朵，在地图内耗尽对方的天山雪莲") + "<br />" + LanResManager.getLanCommonTextWords("，并将其赶出地图为胜，胜者将进入四强对决战。") + "</font>";
         addChild(_loc2_);
         _loc2_.x = 13;
         _loc2_.y = 242;
         _loc2_ = new FTextArea();
         _loc2_.textColor = StaticValue.ORANGE;
         _loc2_.width = 608;
         _loc2_.htmlText = LanResManager.getLanCommonTextWords("四强对决战：") + "<br><font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("四位晋级玩家，进行对决。传入地图后，玩家重新获得天山雪莲朵，在地图内耗尽对方的天山雪莲") + "<br>" + LanResManager.getLanCommonTextWords("，并将其赶出地图为胜，胜者将进入冠亚军对决战。") + "<br></font>";
         addChild(_loc2_);
         _loc2_.x = 13;
         _loc2_.y = 292;
         _loc2_.height = 50;
         _loc2_ = new FTextArea();
         _loc2_.textColor = StaticValue.ORANGE;
         _loc2_.autoSize = TextFieldAutoSize.LEFT;
         _loc2_.htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanCommonTextWords("冠亚军争夺赛：") + "<br><font color=\'" + StaticValue.PURPLE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("在四强中获胜的玩家，进行对决。传入地图后，玩家重新获得天山雪莲朵，在地图内耗尽对方的天山") + "<br>" + LanResManager.getLanCommonTextWords("雪莲，并将其赶出地图为胜，胜者赢得冠军，败者获得亚军。") + "</font></textformat/>";
         addChild(_loc2_);
         _loc2_.x = 13;
         _loc2_.y = 355 - 19 + 7;
         _loc2_.height = 50;
         _loc2_ = new FTextArea();
         _loc2_.textColor = StaticValue.RED;
         _loc2_.autoSize = TextFieldAutoSize.LEFT;
         _loc2_.htmlText = "<textformat leading=\'0.1\'>" + "<b>" + LanResManager.getLanCommonTextWords("注：如果玩家在规定时间内没有分出胜负，则优先判定玩家包裹中的天山雪莲，雪莲多者为胜，当雪莲数") + "<br />" + LanResManager.getLanCommonTextWords("量相同时，则判定战斗力高的玩家为获胜者") + "</b></textformat/>";
         _loc2_.x = 13;
         _loc2_.y = 355 - 19 + 7 + 30 + 20;
         _loc2_.height = 55;
         addChild(_loc2_);
         this.tz = new Sprite();
         this.tz.graphics.beginFill(0,0);
         this.tz.graphics.drawRect(0,0,613,40);
         this.tz.graphics.endFill();
         this.tz.width = 613;
         this.tz.height = 40;
         this.tz.x = 0;
         this.tz.y = 0;
         this.tz.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDowns);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseReleaseds);
         addChild(this.tz);
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - this.width,Tools.currentStage.stageHeight - this.height));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

