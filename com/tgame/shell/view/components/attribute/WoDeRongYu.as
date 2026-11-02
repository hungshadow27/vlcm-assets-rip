package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import gs.TweenMax;
   
   public class WoDeRongYu extends Sprite
   {
      
      private static var MAX_LEVEL:int = 5;
      
      private static var IMAGE_SPAN:int = 2;
      
      private static var IMAGE_X_UNSCALED:int = 101;
      
      private static var IMAGE_Y_UNSCALED:int = 145;
      
      private static var IMAGE_SCALE_X:Number = 1.53;
      
      private static var IMAGE_SCALE_Y:Number = 1.53;
      
      public var _$parent:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var guanzhuButton:SecondButton;
      
      private var shenglingBtn:SecondButton;
      
      private var shenglingshuoming:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var longyuandian:FTextArea;
      
      private var jihuocount:FTextArea;
      
      private var barBg:Bitmap;
      
      private var barBar:ColorBar;
      
      private var gongImg:DisplayObject;
      
      private var gongImgObj:Object;
      
      private var selectedQuan:MovieClip;
      
      private var container:Sprite;
      
      private var containerMask:Sprite;
      
      private var bg:DisplayObject;
      
      private var nowlook:int = 1;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var biaoshi:int = 1;
      
      private var jilu:int = 1;
      
      private var arrr:Array;
      
      private var isMainChar:Boolean = true;
      
      private var buchang:FTextArea;
      
      private var buchangnum:int;
      
      public function WoDeRongYu()
      {
         var i:int;
         var s:Sprite = null;
         this.gongImgObj = {};
         this.selectedQuan = new MovieClip();
         this.arrr = [];
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 2;
         this.fc1.width = 483;
         this.fc1.height = 365;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/wdrys.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/wdryx.swf");
         this.bg.x = 2;
         this.bg.y = 2 + 181;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/shengling.swf");
         this.bg.x = 18;
         this.bg.y = 2 + 181 + 16;
         addChild(this.bg);
         this.jihuocount = new FTextArea();
         addChild(this.jihuocount);
         this.jihuocount.multiline = true;
         this.jihuocount.autoSize = TextFieldAutoSize.LEFT;
         this.jihuocount.x = 325;
         this.jihuocount.y = 8;
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 333;
         this.miaoshu.height = 130;
         this.miaoshu.x = 160 - 10;
         this.miaoshu.y = 210 - 11;
         this.longyuandian = new FTextArea();
         addChild(this.longyuandian);
         this.longyuandian.multiline = true;
         this.longyuandian.wordWrap = true;
         this.longyuandian.width = 333;
         this.longyuandian.height = 130;
         this.longyuandian.x = 160 - 10;
         this.longyuandian.y = 210 - 11 + 70 - 6;
         this.buchang = new FTextArea();
         addChild(this.buchang);
         this.buchang.multiline = true;
         this.buchang.autoSize = TextFieldAutoSize.LEFT;
         this.buchang.x = 419;
         this.buchang.y = 334;
         this.barBg = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg);
         this.barBg.x = 50 + 100;
         this.barBg.width = 310;
         this.barBg.y = 238 + 25 + 50;
         this.barBar = new ColorBar(5,290,5);
         addChild(this.barBar);
         this.barBar.x = 50 + 4 + 100 + 5;
         this.barBar.y = 238 + 3 + 25 + 50;
         this.barBar.setValue(3,3);
         this.container = new Sprite();
         this.container.x = 241;
         this.container.y = 89;
         addChild(this.container);
         this.containerMask = new Sprite();
         addChild(this.containerMask);
         this.containerMask.graphics.beginFill(0);
         this.containerMask.graphics.drawRect(0,15,385 + 55,212);
         this.containerMask.graphics.endFill();
         this.container.mask = this.containerMask;
         i = 1;
         while(i <= MAX_LEVEL)
         {
            if(this.gongImgObj[i] == null)
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/shengling.swf",IMAGE_X_UNSCALED,IMAGE_Y_UNSCALED);
               s = new Sprite();
               this.gongImg.x = -this.gongImg.width / 2;
               this.gongImg.y = -this.gongImg.height / 2;
               s.addChild(this.gongImg);
               this.gongImgObj[i] = s;
               if(i == 1 || i > 2)
               {
                  s.x = 0;
                  s.filters = Tools.blackWhiteFilter;
               }
               else
               {
                  s.x = IMAGE_X_UNSCALED + IMAGE_SPAN;
                  s.filters = Tools.blackWhiteFilter;
               }
               this.container.addChild(s);
            }
            i++;
         }
         if(this.container.contains(this.gongImgObj[1]))
         {
            this.container.setChildIndex(this.gongImgObj[1],this.container.numChildren - 1);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            selectedQuan = _loc2_.content as MovieClip;
            selectedQuan.x = -gongImg.width / 2;
            selectedQuan.y = -gongImg.height / 2;
            container.addChild(selectedQuan);
            if(container.contains(selectedQuan))
            {
               container.setChildIndex(selectedQuan,container.numChildren - 2);
            }
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/shenglingxuanzhong.swf");
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "QiShangQuanPreviousButton";
         addChild(this.previousButton);
         this.previousButton.x = 10;
         this.previousButton.y = 105 + 200 - 230;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "QiShangQuanNextButton";
         addChild(this.nextButton);
         this.nextButton.x = 370 + 85;
         this.nextButton.y = 105 + 200 - 230;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.guanzhuButton = new SecondButton();
         this.guanzhuButton.label = LanResManager.getLanCommonTextWords("灌注龙元");
         addChild(this.guanzhuButton);
         this.guanzhuButton.x = 200;
         this.guanzhuButton.y = 330;
         this.guanzhuButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.guanzhuButton.addEventListener(MouseEvent.MOUSE_OVER,this.onFt1Tip);
         this.guanzhuButton.addEventListener(MouseEvent.MOUSE_OUT,this.onFt1Tip);
         this.shenglingshuoming = new FTextArea();
         this.shenglingshuoming.multiline = true;
         this.shenglingshuoming.filters = StaticValue.filter;
         this.shenglingshuoming.width = 100;
         this.shenglingshuoming.height = 25;
         this.shenglingshuoming.x = 325;
         this.shenglingshuoming.y = 333;
         addChild(this.shenglingshuoming);
         this.shenglingshuoming.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a><u>" + LanResManager.getLanCommonTextWords("查看圣令说明") + "</u></a></font>";
         this.shenglingshuoming.addEventListener(MouseEvent.MOUSE_OVER,this.onFt2Tip);
         this.shenglingshuoming.addEventListener(MouseEvent.MOUSE_OUT,this.onFt2Tip);
         this.arrr = new Array();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WODERONGYU_FANYE_CLICK,"",this.biaoshi - 1));
               --this.nowlook;
               if(this.nowlook == 0)
               {
                  this.nowlook = MAX_LEVEL;
               }
               this.setPicWithAnimation(this.nowlook);
               break;
            case this.nextButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WODERONGYU_FANYE_CLICK,"",this.biaoshi + 1));
               this.nowlook += 1;
               if(this.nowlook == MAX_LEVEL + 1)
               {
                  this.nowlook = 1;
               }
               this.setPicWithAnimation(this.nowlook);
               break;
            case this.guanzhuButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WODERONGYU_GUANZHU_CLICK,"",this.biaoshi));
         }
      }
      
      private function onFt1Tip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.guanzhuButton.addEventListener(MouseEvent.MOUSE_MOVE,this.onFt1Tip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("【灌注龙元】可以将当前龙元点全部注入") + "</font>" + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.guanzhuButton.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFt1Tip);
         }
      }
      
      private function onFt2Tip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.shenglingshuoming.addEventListener(MouseEvent.MOUSE_MOVE,this.onFt2Tip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每一个城池都有一个专属【圣令】，初始等级为0级") + "<br>" + LanResManager.getLanCommonTextWords("使用【龙元点】可以提升【圣令】等级，其等级影响着可获得帅印附加属性的多少") + "<br>" + LanResManager.getLanCommonTextWords("【龙元点】来自于【龙元精粹】，参加【皇途霸业】的勇士才有机会获得该物品") + "<br>" + LanResManager.getLanCommonTextWords("摧毁【龙脉】的玩家将在活动结束后通过【跨服包裹】领取【龙元精粹】奖励") + "</font>" + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.shenglingshuoming.removeEventListener(MouseEvent.MOUSE_MOVE,this.onFt2Tip);
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
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
      }
      
      public function setinitilizeUI(param1:Object, param2:Array) : void
      {
         this.setShengling(param1);
         this.setZhiHui(param2);
         this.jilu = this.nowlook;
         this.setPicWithAnimation(this.jilu);
         this.arrr = param2;
      }
      
      public function setinitilizeUIlongyuandian(param1:int) : void
      {
         this.longyuandian.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙元点：") + param1 + "<br><br>" + LanResManager.getLanCommonTextWords("当前升级进度：") + "</font>";
      }
      
      private function setShengling(param1:Object) : void
      {
         this.biaoshi = param1.biaoshi;
         this.jihuocount.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前激活圣令数量：") + param1.shenglingnum + "/51</font>";
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("名称：") + param1.name + LanResManager.getLanCommonTextWords("圣令") + "<br><br>" + LanResManager.getLanCommonTextWords("当前等级：") + param1.dengji + "<br>" + LanResManager.getLanCommonTextWords("可以享受该城帅印附加属性：") + param1.jiacheng / 100 + "%<br></font>";
         this.longyuandian.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙元点：") + param1.longyuandian + "<br><br>" + LanResManager.getLanCommonTextWords("当前升级进度：") + "</font>";
         if(param1.dangqian > param1.zuida)
         {
            this.barBar.setValue(param1.zuida,param1.zuida);
         }
         else
         {
            this.barBar.setValue(param1.dangqian,param1.zuida);
         }
      }
      
      private function setZhiHui(param1:Array) : void
      {
         this.arrr = param1;
      }
      
      private function setPicWithAnimation(param1:int) : void
      {
         var f:DisplayObject;
         var intL:int = 0;
         var intLL:int = 0;
         var intR:int = 0;
         var intRR:int = 0;
         var i:int = 0;
         var l:DisplayObject = null;
         var r:DisplayObject = null;
         var fultureLevel:int = param1;
         this.nowlook = fultureLevel;
         f = this.gongImgObj[fultureLevel] as DisplayObject;
         if(fultureLevel >= 1)
         {
            if(this.container.contains(f))
            {
               this.container.setChildIndex(f,this.container.numChildren - 1);
            }
            f.visible = true;
            TweenMax.to(f,0.2,{
               "scaleX":1,
               "scaleY":1,
               "x":0,
               "onUpdate":function():void
               {
                  TweenMax.to(selectedQuan,0.1,{"alpha":0});
               },
               "onUpdateParams":[this.container],
               "onComplete":function():void
               {
                  if(container.contains(selectedQuan))
                  {
                     container.setChildIndex(selectedQuan,container.numChildren - 2);
                  }
                  TweenMax.to(selectedQuan,1,{"alpha":1});
               }
            });
            if(this.arrr[2])
            {
               f.filters = [];
            }
            else
            {
               f.filters = Tools.blackWhiteFilter;
            }
            intL = fultureLevel - 1 == 0 ? MAX_LEVEL : int(fultureLevel - 1);
            intLL = intL - 1 == 0 ? MAX_LEVEL : int(intL - 1);
            intR = fultureLevel + 1 == MAX_LEVEL + 1 ? 1 : int(fultureLevel + 1);
            intRR = intR + 1 == MAX_LEVEL + 1 ? 1 : int(intR + 1);
            i = 1;
            while(i <= MAX_LEVEL)
            {
               if(i != fultureLevel && i != intL && i != intR && i != intLL && i != intRR)
               {
                  this.gongImgObj[i].visible = false;
                  this.gongImgObj[i].x = 0;
               }
               i++;
            }
            if(intL >= 0)
            {
               l = this.gongImgObj[intL] as DisplayObject;
               l.visible = true;
               if(this.container.contains(l))
               {
                  this.container.setChildIndex(l,this.container.numChildren - 3);
               }
               TweenMax.to(l,0.2,{
                  "scaleX":0.8,
                  "scaleY":0.8,
                  "x":-(IMAGE_X_UNSCALED + IMAGE_SPAN)
               });
               if(this.arrr[1])
               {
                  l.filters = [];
               }
               else
               {
                  l.filters = Tools.blackWhiteFilter;
               }
            }
            if(intLL >= 0)
            {
               l = this.gongImgObj[intLL] as DisplayObject;
               l.visible = true;
               if(this.container.contains(l))
               {
                  this.container.setChildIndex(l,this.container.numChildren - 5);
               }
               TweenMax.to(l,0.2,{
                  "scaleX":0.6,
                  "scaleY":0.6,
                  "x":-1.5 * (IMAGE_X_UNSCALED + IMAGE_SPAN + 10)
               });
               if(this.arrr[0])
               {
                  l.filters = [];
               }
               else
               {
                  l.filters = Tools.blackWhiteFilter;
               }
            }
            if(intR > 0)
            {
               r = this.gongImgObj[intR] as DisplayObject;
               r.visible = true;
               if(this.container.contains(r))
               {
                  this.container.setChildIndex(r,this.container.numChildren - 4);
               }
               TweenMax.to(r,0.2,{
                  "scaleX":0.8,
                  "scaleY":0.8,
                  "x":IMAGE_X_UNSCALED + IMAGE_SPAN
               });
               if(this.arrr[3])
               {
                  r.filters = [];
               }
               else
               {
                  r.filters = Tools.blackWhiteFilter;
               }
            }
            if(intRR > 0)
            {
               r = this.gongImgObj[intRR] as DisplayObject;
               r.visible = true;
               if(this.container.contains(r))
               {
                  this.container.setChildIndex(r,this.container.numChildren - 1);
               }
               TweenMax.to(r,0.2,{
                  "scaleX":0.6,
                  "scaleY":0.6,
                  "x":1.5 * (IMAGE_X_UNSCALED + IMAGE_SPAN + 10)
               });
               if(this.arrr[4])
               {
                  r.filters = [];
               }
               else
               {
                  r.filters = Tools.blackWhiteFilter;
               }
            }
         }
      }
      
      public function setEnableFun(param1:Boolean) : void
      {
         this.previousButton.enabled = param1;
         this.nextButton.enabled = param1;
         this.guanzhuButton.enabled = param1;
         this.isMainChar = param1;
         this.initBuchang();
      }
      
      private function initBuchang() : void
      {
         if(this.isMainChar)
         {
            this.buchang.visible = GameState.dictMainStatus[726790];
            this.buchangnum = GameState.dictMainStatus[726790];
         }
         else
         {
            this.buchang.visible = GameState.dictTargetStatus[726790];
            this.buchangnum = GameState.dictTargetStatus[726790];
         }
         this.buchang.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "" + this.buchangnum + "</font>";
      }
   }
}

