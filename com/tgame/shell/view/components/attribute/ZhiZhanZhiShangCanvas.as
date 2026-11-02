package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class ZhiZhanZhiShangCanvas extends Sprite
   {
      
      private static var MAX_LEVEL:int = 4;
      
      private static var IMAGE_SPAN:int = -300;
      
      private static var IMAGE_X_UNSCALED:int = 390;
      
      private static var IMAGE_Y_UNSCALED:int = 230;
      
      private static var IMAGE_SCALE_X:Number = 0.7;
      
      private static var IMAGE_SCALE_Y:Number = 0.7;
      
      private static var arrDesc:Array = ["<textformat leading=\'1\'><font size=\'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("《止战之殇》") + "<br/>" + LanResManager.getLanCommonTextWords("君子以自强不息，齐奏死之殇音，望平息战乱！") + "</font>" + "</textformat>","<textformat leading=\'1\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动时间") + "<br>" + LanResManager.getLanCommonTextWords("每周一、周四20:00-21:10开启活动。") + "</font>" + "</textformat>","<textformat leading=\'1\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动奖励") + "<br>" + LanResManager.getLanCommonTextWords("参与的玩家都将获得经验奖励；") + "<br>" + LanResManager.getLanCommonTextWords("获胜的阵营所有成员还将额外获得神兵——【天殇】。") + "</font>" + "</textformat>","<textformat leading=\'1\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动玩法") + "<br>" + LanResManager.getLanCommonTextWords("1.进入地图时，玩家将被随机分配至两个阵营，红方或蓝方，同阵营的玩家不可以互相残杀；") + "<br>" + LanResManager
      .getLanCommonTextWords("2.进入战场后将进入战斗准备阶段，期间不可以攻击，准备阶段过后将不可以再传入地图；") + "<br>" + LanResManager.getLanCommonTextWords("3.你的目标是和同阵营的兄弟，将敌人全部击败，视为获胜方！") + "</font>" + "</textformat>"];
      
      public var _$parent:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var fta:FTextArea;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var n:int;
      
      private var gongImg:DisplayObject;
      
      private var gongImgObj:Object;
      
      private var lastLevel:int = 1;
      
      private var container:Sprite;
      
      private var containerMask:Sprite;
      
      public function ZhiZhanZhiShangCanvas()
      {
         var bg:DisplayObject;
         var l:DisplayObject;
         var r:DisplayObject;
         var tf1:TextFormat;
         var i:int;
         var s:Sprite = null;
         this.gongImgObj = {};
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 2;
         this.fc1.width = 590;
         this.fc1.height = 340;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhizhanzhishang/intro.bg.swf");
         bg.x = 7;
         bg.y = 9;
         addChild(bg);
         l = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhizhanzhishang/intro.arrow.left.swf");
         l.x = 2;
         l.y = 104;
         addChild(l);
         r = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhizhanzhishang/intro.arrow.right.swf");
         r.x = 550;
         r.y = 104;
         addChild(r);
         this.container = new Sprite();
         this.container.x = 300;
         this.container.y = 48 + 5;
         addChild(this.container);
         this.containerMask = new Sprite();
         addChild(this.containerMask);
         this.containerMask.graphics.beginFill(0);
         this.containerMask.graphics.drawRect(0,15,530,260);
         this.containerMask.graphics.endFill();
         this.container.mask = this.containerMask;
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "QiShangQuanPreviousButton";
         addChild(this.previousButton);
         this.previousButton.x = 10;
         this.previousButton.y = 120;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "QiShangQuanNextButton";
         addChild(this.nextButton);
         this.nextButton.x = 562;
         this.nextButton.y = 120;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         tf1 = new TextFormat();
         tf1.size = 12;
         tf1.color = 65276;
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            defaultTextFormat = tf1;
            width = 200;
            height = 20;
            x = 8;
            y = 270;
            textColor = StaticValue.ORANGE_HTML;
            htmlText = arrDesc[0];
         }
         addChild(this.fta);
         i = 1;
         while(i <= MAX_LEVEL)
         {
            if(this.gongImgObj[i] == null)
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/zhizhanzhishang/" + i + ".jpg",IMAGE_X_UNSCALED,IMAGE_Y_UNSCALED);
               s = new Sprite();
               this.gongImg.x = -this.gongImg.width / 2;
               this.gongImg.y = -this.gongImg.height / 2;
               s.addChild(this.gongImg);
               this.gongImgObj[i] = s;
               if(i == MAX_LEVEL)
               {
                  s.x = -(IMAGE_X_UNSCALED + IMAGE_SPAN);
                  s.scaleX = IMAGE_SCALE_X;
                  s.scaleY = IMAGE_SCALE_Y;
               }
               else if(i == 1)
               {
                  s.x = 0;
               }
               else if(i == 2)
               {
                  s.x = IMAGE_X_UNSCALED + IMAGE_SPAN;
                  s.scaleX = IMAGE_SCALE_X;
                  s.scaleY = IMAGE_SCALE_Y;
               }
               else
               {
                  s.x = 0;
                  s.visible = false;
               }
               s.y = 83;
               this.container.addChild(s);
            }
            i++;
         }
         if(this.container.contains(this.gongImgObj[1]))
         {
            this.container.setChildIndex(this.gongImgObj[1],this.container.numChildren - 1);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.target)
         {
            case this.nextButton:
               _loc2_ = this.lastLevel - 1;
               if(_loc2_ < 1)
               {
                  _loc2_ = MAX_LEVEL;
               }
               this.setPicWithAnimation(this.lastLevel,_loc2_);
               break;
            case this.previousButton:
               _loc2_ = this.lastLevel + 1;
               if(_loc2_ > MAX_LEVEL)
               {
                  _loc2_ = 1;
               }
               this.setPicWithAnimation(this.lastLevel,_loc2_);
         }
      }
      
      private function setPicWithAnimation(param1:int, param2:int) : void
      {
         var _loc8_:DisplayObject = null;
         var _loc9_:DisplayObject = null;
         var _loc3_:DisplayObject = this.gongImgObj[param1] as DisplayObject;
         var _loc4_:DisplayObject = this.gongImgObj[param2] as DisplayObject;
         if(this.container.contains(_loc4_))
         {
            this.container.setChildIndex(_loc4_,this.container.numChildren - 1);
         }
         _loc4_.visible = true;
         var _loc5_:int = param2 - 1;
         var _loc6_:int = param2 + 1;
         if(param2 == 1)
         {
            _loc5_ = MAX_LEVEL;
         }
         else if(param2 == MAX_LEVEL)
         {
            _loc6_ = 1;
         }
         this.fta.htmlText = arrDesc[param2 - 1];
         this.lastLevel = param2;
         var _loc7_:int = 1;
         while(_loc7_ <= MAX_LEVEL)
         {
            if(_loc7_ != param2 && _loc7_ != _loc5_ && _loc7_ != _loc6_)
            {
               this.gongImgObj[_loc7_].visible = false;
               this.gongImgObj[_loc7_].x = 0;
            }
            _loc7_++;
         }
         if(_loc5_ >= 1)
         {
            _loc8_ = this.gongImgObj[_loc5_] as DisplayObject;
            _loc8_.visible = true;
            if(this.container.contains(_loc8_))
            {
               this.container.setChildIndex(_loc8_,this.container.numChildren - 3);
            }
            TweenMax.to(_loc8_,0.4,{
               "scaleX":IMAGE_SCALE_X,
               "scaleY":IMAGE_SCALE_Y,
               "x":-(IMAGE_X_UNSCALED + IMAGE_SPAN)
            });
         }
         TweenMax.to(_loc4_,0.4,{
            "scaleX":1,
            "scaleY":1,
            "x":0
         });
         if(_loc6_ >= 1)
         {
            _loc9_ = this.gongImgObj[_loc6_] as DisplayObject;
            _loc9_.visible = true;
            if(this.container.contains(_loc9_))
            {
               this.container.setChildIndex(_loc9_,this.container.numChildren - 4);
            }
            TweenMax.to(_loc9_,0.4,{
               "scaleX":IMAGE_SCALE_X,
               "scaleY":IMAGE_SCALE_Y,
               "x":IMAGE_X_UNSCALED + IMAGE_SPAN
            });
         }
      }
   }
}

