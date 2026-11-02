package com.tgame.shell.view.components.huangtubaye
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.MainButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.HuangTuBaYePanel;
   import com.tgame.shell.view.components.HuangTuBaYeShuoMingPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class ZhengZhanSiFang extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var bg1:DisplayObject;
      
      private var bg2:DisplayObject;
      
      private var bg3:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var ft1:FTextArea;
      
      private var bangpai:FTextArea;
      
      private var shuoming:FTextArea;
      
      private var chengArr:Array = [];
      
      private var xyArr:Array = [];
      
      private var spr:Sprite;
      
      private var jinruBtn:MainButton;
      
      private var jihuoBtn:MainButton;
      
      private var chengchi:int = 0;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var shuomingpanel:HuangTuBaYeShuoMingPanel;
      
      private var Dian:FSimpleButton;
      
      private var aaaaArr:Array = [];
      
      private var xuanzhongSpr:Sprite;
      
      public function ZhengZhanSiFang()
      {
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.multiline = true;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.x = 7;
         this.tip.y = 3;
         this.tipCanvas.addChild(this.tip);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/zzsfbg.swf");
         this.bg1.x = 2;
         this.bg1.y = 2;
         addChild(this.bg1);
         this.xyArr = [{
            "x":71,
            "y":12
         },{
            "x":72,
            "y":90
         },{
            "x":54,
            "y":160
         },{
            "x":92,
            "y":231
         },{
            "x":57,
            "y":381
         },{
            "x":107,
            "y":459
         },{
            "x":176,
            "y":360
         },{
            "x":272,
            "y":481
         },{
            "x":365,
            "y":452
         },{
            "x":491,
            "y":482
         },{
            "x":82,
            "y":301
         },{
            "x":570,
            "y":438
         },{
            "x":709,
            "y":458
         },{
            "x":816,
            "y":484
         },{
            "x":797,
            "y":408
         },{
            "x":842,
            "y":310
         },{
            "x":829,
            "y":234
         },{
            "x":791,
            "y":171
         },{
            "x":766,
            "y":98
         },{
            "x":805,
            "y":18
         },{
            "x":640,
            "y":2
         },{
            "x":410,
            "y":4
         },{
            "x":274,
            "y":2
         },{
            "x":189,
            "y":41
         },{
            "x":148,
            "y":146
         },{
            "x":208,
            "y":274
         },{
            "x":220,
            "y":430
         },{
            "x":364,
            "y":395
         },{
            "x":463,
            "y":403
         },{
            "x":572,
            "y":355
         },{
            "x":674,
            "y":399
         },{
            "x":644,
            "y":303
         },{
            "x":756,
            "y":325
         },{
            "x":734,
            "y":251
         },{
            "x":710,
            "y":176
         },{
            "x":672,
            "y":135
         },{
            "x":657,
            "y":67
         },{
            "x":533,
            "y":35
         },{
            "x":373,
            "y":64
         },{
            "x":237,
            "y":105
         },{
            "x":233,
            "y":194
         },{
            "x":275,
            "y":315
         },{
            "x":344,
            "y":257
         },{
            "x":426,
            "y":312
         },{
            "x":519,
            "y":265
         },{
            "x":621,
            "y":230
         },{
            "x":570,
            "y":171
         },{
            "x":516,
            "y":93
         },{
            "x":420,
            "y":122
         },{
            "x":314,
            "y":156
         },{
            "x":434,
            "y":208
         }];
         this.ft1 = new FTextArea();
         addChild(this.ft1);
         this.ft1.multiline = true;
         this.ft1.wordWrap = true;
         this.ft1.width = 333;
         this.ft1.height = 30;
         this.ft1.filters = StaticValue.filter;
         this.ft1.x = 50 - 42;
         this.ft1.y = 480 + 7 + 87;
         this.ft1.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("选择要攻击的城池，点击【进入战场】可以传入该城池") + "</font>";
         this.spr = new Sprite();
         addChild(this.spr);
         this.xuanzhongSpr = new Sprite();
         this.xuanzhongSpr.mouseEnabled = false;
         this.xuanzhongSpr.mouseChildren = false;
         addChild(this.xuanzhongSpr);
         this.jinruBtn = new MainButton();
         this.jinruBtn.label = LanResManager.getLanCommonTextWords("进入战场");
         addChild(this.jinruBtn);
         this.jinruBtn.x = 520 + 280 - 366;
         this.jinruBtn.y = 480 + 90;
         this.jinruBtn.addEventListener(MouseEvent.CLICK,this.onClick1);
         this.jihuoBtn = new MainButton();
         this.jihuoBtn.label = LanResManager.getLanCommonTextWords("激活龙脉");
         addChild(this.jihuoBtn);
         this.jihuoBtn.x = 520 + 280 - 366 + 260;
         this.jihuoBtn.y = 480 + 90;
         this.jihuoBtn.addEventListener(MouseEvent.CLICK,this.onClick1);
         this.shuoming = new FTextArea();
         this.shuoming.multiline = true;
         this.shuoming.filters = StaticValue.filter;
         this.shuoming.width = 100;
         this.shuoming.height = 25;
         this.shuoming.x = 444 - 174 + 45 + 575;
         this.shuoming.y = 480 + 7 + 87;
         addChild(this.shuoming);
         this.shuoming.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a><u>" + LanResManager.getLanCommonTextWords("活动说明") + "</u></a></font>";
         this.shuoming.addEventListener(MouseEvent.CLICK,this.onClick2);
      }
      
      private function onClick2(param1:MouseEvent) : void
      {
         if(this.shuomingpanel == null)
         {
            this.shuomingpanel = new HuangTuBaYeShuoMingPanel();
         }
         this.shuomingpanel.x = (GameConfig.sceneWidth - 510) / 2;
         this.shuomingpanel.y = (GameConfig.sceneHeight - 480) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.shuomingpanel);
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:int = parseInt(param1.currentTarget.name);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               if(this.chengArr == null || this.chengArr.length == 0)
               {
                  return;
               }
               _loc3_ = "";
               _loc3_ += "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("名称：") + this.chengArr[_loc2_].name + "</font><br>";
               if(this.chengArr[_loc2_].jibie == 0)
               {
                  _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("城池级别：皇城") + "</font><br>";
               }
               else if(this.chengArr[_loc2_].jibie == 1)
               {
                  _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("城池级别：1级城池") + "</font><br>";
               }
               else if(this.chengArr[_loc2_].jibie == 2)
               {
                  _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("城池级别：2级城池") + "</font><br>";
               }
               else if(this.chengArr[_loc2_].jibie == 3)
               {
                  _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("城池级别：3级城池") + "</font><br>";
               }
               _loc3_ += "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("平台：") + TVersion.getPingTaiNameById(this.chengArr[_loc2_].pingtai) + "<br></font>";
               _loc3_ += "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("驻守帮派：") + this.chengArr[_loc2_].bangpai + "<br></font>";
               _loc3_ += "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("驻守帮派帮主：") + this.chengArr[_loc2_].bangzhu + "<br></font>";
               _loc3_ += "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("驻守帮派战斗力：") + this.chengArr[_loc2_].zhandouli + "<br></font>";
               _loc3_ += "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("奖励荣誉：【") + this.chengArr[_loc2_].name + LanResManager.getLanCommonTextWords("圣灵】") + "]<br></font>";
               if(this.chengArr[_loc2_].renshu == 0)
               {
                  _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("游戏人数：顺畅") + "<br></font>";
               }
               else if(this.chengArr[_loc2_].renshu == 1)
               {
                  _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("游戏人数：良好") + "<br></font>";
               }
               else if(this.chengArr[_loc2_].renshu == 2)
               {
                  _loc3_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("游戏人数：繁忙") + "<br></font>";
               }
               this.showTip(_loc3_);
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
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 10;
         this.tipCanvas.height = this.tip.height + 10;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.chengchi = parseInt(param1.currentTarget.name);
         while(this.xuanzhongSpr.numChildren > 0)
         {
            this.xuanzhongSpr.removeChildAt(0);
         }
         if(this.chengArr[this.chengchi].jibie == 0)
         {
            this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/cheng0.swf");
         }
         else if(this.chengArr[this.chengchi].jibie == 1)
         {
            this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/cheng3.swf");
         }
         else if(this.chengArr[this.chengchi].jibie == 2)
         {
            this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/cheng2.swf");
         }
         else if(this.chengArr[this.chengchi].jibie == 3)
         {
            this.bg3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/cheng1.swf");
         }
         this.bg3.x = this.xyArr[this.chengchi].x;
         this.bg3.y = this.xyArr[this.chengchi].y;
         this.xuanzhongSpr.addChild(this.bg3);
      }
      
      private function onClick1(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.jinruBtn:
               this.$parent.dispatchEvent(new BaseEvent(HuangTuBaYePanel.UI_HUANGTUBAYE_ZHENGZHANSIFANG_JINRU,"",this.chengArr[this.chengchi].biaoshi));
               break;
            case this.jihuoBtn:
               this.$parent.dispatchEvent(new BaseEvent(HuangTuBaYePanel.UI_HUANGTUBAYE_ZHENGZHANSIFANG_JIHUOLONGMAI,"",this.chengArr[this.chengchi].biaoshi));
         }
      }
      
      public function setinitilizeUI(param1:Array) : void
      {
         this.setData(param1);
      }
      
      private function setData(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         this.chengArr = param1;
         if(this.chengArr != null)
         {
            _loc2_ = 0;
            while(_loc2_ < 51)
            {
               this.shangyiyeButton = new FSimpleButton();
               if(this.chengArr[_loc2_].jibie == 0)
               {
                  this.shangyiyeButton.skin = "huangChengBtn";
               }
               else if(this.chengArr[_loc2_].jibie == 1)
               {
                  this.shangyiyeButton.skin = "chengChiLv3Btn";
               }
               else if(this.chengArr[_loc2_].jibie == 2)
               {
                  this.shangyiyeButton.skin = "chengChiLv2Btn";
               }
               else if(this.chengArr[_loc2_].jibie == 3)
               {
                  this.shangyiyeButton.skin = "chengChiLv1Btn";
               }
               if(_loc2_ == 48 || _loc2_ == 40 || _loc2_ == 42 || _loc2_ == 44 || _loc2_ == 46)
               {
                  this.shangyiyeButton.enabled = false;
               }
               this.shangyiyeButton.name = String(_loc2_);
               this.shangyiyeButton.x = this.xyArr[_loc2_].x;
               this.shangyiyeButton.y = this.xyArr[_loc2_].y;
               this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
               this.shangyiyeButton.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
               this.shangyiyeButton.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
               this.spr.addChild(this.shangyiyeButton);
               this.bangpai = new FTextArea();
               this.spr.addChild(this.bangpai);
               this.bangpai.filters = StaticValue.filter;
               this.bangpai.mouseEnabled = false;
               this.bangpai.x = this.xyArr[_loc2_].x;
               if(_loc2_ == 50)
               {
                  this.bangpai.y = this.xyArr[_loc2_].y - 10;
               }
               else
               {
                  this.bangpai.y = this.xyArr[_loc2_].y;
               }
               this.bangpai.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'> " + this.chengArr[_loc2_].name + "</font>";
               if(this.chengArr[_loc2_].bangpai != "")
               {
                  if(this.chengArr[_loc2_].guishu)
                  {
                     this.bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/huangqi.swf");
                  }
                  else
                  {
                     this.bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/qizhi.swf");
                  }
                  if(_loc2_ == 50)
                  {
                     this.bg2.x = this.xyArr[_loc2_].x + 10 - 15 - 15;
                  }
                  else
                  {
                     this.bg2.x = this.xyArr[_loc2_].x + 10 - 15;
                  }
                  this.bg2.y = this.xyArr[_loc2_].y + 10 + 5;
                  this.spr.addChild(this.bg2);
               }
               _loc2_++;
            }
         }
      }
   }
}

