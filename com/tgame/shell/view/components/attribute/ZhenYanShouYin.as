package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class ZhenYanShouYin extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var bg:DisplayObject;
      
      private var bgSpr:Sprite;
      
      private var bgObj:DisplayObject;
      
      private var previousButton:FSimpleButton;
      
      private var ftName:FTextArea;
      
      private var nextButton:FSimpleButton;
      
      private var cbar:ColorBar;
      
      private var btnLingwu:SecondButton;
      
      private var btnAuto:SecondButton;
      
      private var check:FCheckBox;
      
      private var ft:FTextArea;
      
      private var ftValue:FTextArea;
      
      private var skillItem:ItemFace;
      
      private var skillspr:Sprite;
      
      private var skillbit:Bitmap;
      
      private var type:int = 0;
      
      private var now:int = 0;
      
      public var maxGrade:int = 9;
      
      public var minGrade:int = 1;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var skillArr:Array = [];
      
      private var xingyunzhiNum:int;
      
      private var yanhuaMc:MovieClip;
      
      private var ar:Array = [];
      
      private var jinengTB:DisplayObject;
      
      public function ZhenYanShouYin()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var barBg1:Bitmap;
         var bit:Bitmap;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhenyanshouyin/zysy_bg.swf");
         this.bg.x = 0;
         this.bg.y = 0;
         addChild(this.bg);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tipCanvas.width = 420;
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 5;
            width = 435;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            wordWrap = true;
         }
         this.tipCanvas.addChild(this.tip);
         this.bgSpr = new Sprite();
         this.bgSpr.x = 0;
         this.bgSpr.y = 0;
         addChild(this.bgSpr);
         this.bgObj = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhenyanshouyin/1.swf");
         this.bgObj.x = 1;
         this.bgObj.y = 1;
         this.bgSpr.addChild(this.bgObj);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 80;
         this.previousButton.y = 178;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ftName = new FTextArea();
         this.ftName.x = 100;
         this.ftName.y = 178;
         this.ftName.htmlText = LanResManager.getLanCommonTextWords("临");
         this.ftName.background = true;
         this.ftName.backgroundColor = 1186072;
         this.ftName.width = 24;
         this.ftName.height = 16;
         this.ftName.textColor = StaticValue.WHITE;
         addChild(this.ftName);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = this.ftName.x + 20;
         this.nextButton.y = 178;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         barBg1 = StaticValue.getBitmapByClassName("ui.xiuwei.exp.bg");
         addChild(barBg1);
         barBg1.x = 3;
         barBg1.y = 204;
         this.cbar = new ColorBar(5,348,8);
         this.cbar.x = 26;
         this.cbar.y = 214;
         addChild(this.cbar);
         this.check = new FCheckBox();
         this.check.textColor = StaticValue.WHITE;
         this.check.text = LanResManager.getLanCommonTextWords("真言直升丹");
         this.check.x = 310;
         this.check.y = 293;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.check);
         ToolTips.createToolTips(this.check,this,function(param1:*, param2:MouseEvent):String
         {
            var _loc3_:String = "";
            _loc3_ += "<textformat leading=\'6\'>";
            _loc3_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("勾选使用真言直升丹，可以直接提升真言手印一层") + "</font>";
            return _loc3_ + "</textformat>";
         });
         this.ft = new FTextArea();
         this.ft.width = 180;
         this.ft.height = 120;
         this.ft.x = 10;
         this.ft.y = 240;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>    " + LanResManager.getLanCommonTextWords("九字真言，乃密宗无上神功，相传人的身体有许多的奥秘和潜力，而通过修炼密宗九字真言可以最大的激发人体的潜力，让身体与宇宙沟通达到天人合一的境界，无可匹敌。") + "</font></textformat>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.width = 100;
         this.ft.x = 185;
         this.ft.y = 233;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("属性加成：") + "</font>";
         addChild(this.ft);
         this.ftValue = new FTextArea();
         this.ftValue.height = 100;
         this.ftValue.width = 125;
         this.ftValue.wordWrap = true;
         this.ftValue.x = 185;
         this.ftValue.y = 250;
         this.ftValue.htmlText = LanResManager.getLanCommonTextWords("攻击：100") + "<br>";
         addChild(this.ftValue);
         this.ft = new FTextArea();
         this.ft.width = 100;
         this.ft.height = 25;
         this.ft.x = 330;
         this.ft.y = 233;
         this.ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能：") + "</font>";
         addChild(this.ft);
         bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         bit.x = 340;
         bit.y = 253;
         addChild(bit);
         this.jinengTB = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhenyanshouyin/jineng.swf");
         this.jinengTB.x = 340 + 2;
         this.jinengTB.y = 253 + 2;
         addChild(this.jinengTB);
         this.skillspr = new Sprite();
         with(this.skillspr.graphics)
         {
            beginFill(65535,0);
            drawRect(0,0,35,35);
            endFill();
         }
         this.skillspr.x = 340;
         this.skillspr.y = 253;
         addChild(this.skillspr);
         this.skillspr.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         this.skillspr.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
         this.btnLingwu = new SecondButton();
         this.btnLingwu.x = 330;
         this.btnLingwu.y = 313;
         this.btnLingwu.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnLingwu);
         this.btnLingwu.label = LanResManager.getLanCommonTextWords("修炼真言");
         this.btnAuto = new SecondButton();
         this.btnAuto.x = 330;
         this.btnAuto.y = 338;
         this.btnAuto.label = LanResManager.getLanCommonTextWords("自动修炼");
         addChild(this.btnAuto);
         this.btnAuto.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               if(this.skillArr.length <= 0)
               {
                  return;
               }
               _loc2_ = "";
               _loc4_ = 0;
               while(_loc4_ < this.skillArr.length)
               {
                  _loc5_ = new Goods(int(this.skillArr[_loc4_].skillID));
                  _loc6_ = "";
                  _loc7_ = "";
                  if(int(this.skillArr[_loc4_].skillBO) == 1)
                  {
                     _loc6_ = StaticValue.BLUE_HTML;
                     _loc7_ = StaticValue.RED_HTML;
                  }
                  else
                  {
                     _loc6_ = _loc7_ = "#5c5c5c";
                  }
                  _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>   " + this.skillArr[_loc4_].skillName + "</font><font color=\'" + _loc6_ + "\'>     " + _loc5_.res.name + "     </font><font color=\'" + _loc7_ + "\'>" + this.skillArr[_loc4_].skillDesc + "</font><br>";
                  _loc4_++;
               }
               _loc2_ = _loc2_.substr(0,_loc2_.length - 4);
               _loc3_ = "<textformat>";
               _loc3_ += _loc2_;
               _loc3_ += "</textformat>";
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
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 5;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 12;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         switch(param1.target)
         {
            case this.btnAuto:
               _loc2_ = false;
               if(this.btnAuto.label == LanResManager.getLanCommonTextWords("自动修炼"))
               {
                  _loc2_ = true;
               }
               else
               {
                  _loc2_ = false;
               }
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHENYANSHOUYIN_ZIDONGTISHENG_CLICK,"",_loc2_));
               break;
            case this.btnLingwu:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHENYANSHOUYIN_KAISHITISHENG_CLICK,"",this.type));
               break;
            case this.previousButton:
               this.check.selectState = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHENYANSHOUYIN_PRE_NEXT_CLICK,"",this.now - 1));
               break;
            case this.nextButton:
               this.check.selectState = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHENYANSHOUYIN_PRE_NEXT_CLICK,"",this.now + 1));
               break;
            case this.check:
               this.type = this.check.selectState == true ? 1 : 0;
               this.btnAuto.enabled = this.type == 1 ? false : true;
         }
      }
      
      private function setPreNextBtn(param1:int) : void
      {
         if(param1 == this.minGrade)
         {
            this.previousButton.enabled = false;
            this.nextButton.enabled = true;
         }
         if(param1 == this.maxGrade)
         {
            this.previousButton.enabled = true;
            this.nextButton.enabled = false;
         }
         if(param1 > this.minGrade && param1 < this.maxGrade)
         {
            this.previousButton.enabled = true;
            this.nextButton.enabled = true;
         }
      }
      
      public function setData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Array) : void
      {
         this.now = param1;
         this.skillArr = param11;
         while(this.bgSpr.numChildren > 0)
         {
            this.bgSpr.removeChildAt(0);
         }
         this.bgObj = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/zhenyanshouyin/" + param1 + ".swf");
         this.bgObj.x = 1;
         this.bgObj.y = 1;
         this.bgSpr.addChild(this.bgObj);
         if(param1 == param3 + 1)
         {
            this.btnLingwu.enabled = true;
            this.btnAuto.enabled = true;
            this.check.enabled = true;
            this.btnLingwu.label = LanResManager.getLanCommonTextWords("修炼真言");
         }
         else if(param1 <= param3)
         {
            this.btnLingwu.enabled = false;
            this.btnAuto.enabled = false;
            this.check.enabled = false;
            this.btnLingwu.label = LanResManager.getLanCommonTextWords("已修炼");
            param4 = param5;
         }
         else
         {
            this.btnLingwu.enabled = false;
            this.btnAuto.enabled = false;
            this.check.enabled = false;
            this.btnLingwu.label = LanResManager.getLanCommonTextWords("未修炼");
         }
         if(param3 == this.maxGrade)
         {
            this.btnLingwu.enabled = false;
            this.btnAuto.enabled = false;
            this.check.enabled = false;
         }
         this.cbar.setValue(param4,param5);
         this.ftValue.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击： ") + param6 + "<br>" + LanResManager.getLanCommonTextWords("防御： ") + param7 + "<br>" + LanResManager.getLanCommonTextWords("血量： ") + param8 + "<br>" + LanResManager.getLanCommonTextWords("暴击： ") + param9 + "<br>" + LanResManager.getLanCommonTextWords("闪避： ") + param10 + "</font></textformat>";
         this.ftName.htmlText = param2;
         this.setPreNextBtn(param1);
      }
      
      public function setAutoBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.btnAuto.label = LanResManager.getLanCommonTextWords("自动修炼");
         }
         else
         {
            this.btnAuto.label = LanResManager.getLanCommonTextWords("停止修炼");
         }
         this.check.enabled = param1;
      }
      
      public function setEnableFun() : void
      {
         this.btnAuto.enabled = false;
         this.btnLingwu.enabled = false;
         this.check.enabled = false;
      }
      
      public function setExp(param1:int, param2:int, param3:int) : void
      {
         this.cbar.setValue(param1,param2);
         if(param3 != 0)
         {
            this.xingyunzhiNum = param3;
            this.aa();
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
            x = 155;
            y = 185;
            textColor = StaticValue.YELLOW;
            width = 132;
            htmlText = LanResManager.getLanCommonTextWords("经验值+") + String(xingyunzhiNum);
         }
         if(this.xingyunzhiNum > 0)
         {
            addChild(ftaw);
         }
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
      
      public function bofangYanhua() : void
      {
         var loadUrl:String;
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.stop();
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/xiuwei/yanhua.swf";
         if(this.ar[0] == null)
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               yanhuaMc = _loc2_.content as MovieClip;
               ar[0] = yanhuaMc;
               yanhuaMc.x = -55;
               yanhuaMc.y = 156;
               addChild(yanhuaMc);
            },null,false,loadUrl);
         }
         else
         {
            this.yanhuaMc = this.ar[0];
            this.yanhuaMc.x = -55;
            this.yanhuaMc.y = 156;
            this.yanhuaMc.play();
            addChild(this.yanhuaMc);
         }
      }
   }
}

