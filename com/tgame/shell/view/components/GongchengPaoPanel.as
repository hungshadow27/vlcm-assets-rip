package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.mainui.smallMap.MapCutline;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.*;
   import flash.utils.Timer;
   
   public class GongchengPaoPanel extends FPanel
   {
      
      public static const UI_AMMOBUYPANEL_MAP_CLICK:String = "UI_AMMOBUYPANEL_MAP_CLICK";
      
      public static const UI_AMMOBUYPANEL_ADDBTN_CLICK:String = "UI_AMMOBUYPANEL_ADDBTN_CLICK";
      
      public static const UI_AMMOBUYPANEL_OKCLICK:String = "UI_AMMOBUYPANEL_OKCLICK";
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var fta6:FTextArea;
      
      private var addBtn:FSimpleButton;
      
      private var imgIco1:DisplayObject;
      
      private var bgImg:DisplayObject;
      
      private var ammobuyPanel:AmmoBuyPanel;
      
      private var myTimer:Timer;
      
      private var Ti:int = 10;
      
      private var mc:MovieClip;
      
      private var numx:int;
      
      private var numy:int;
      
      private var djPd:Boolean;
      
      private var pandanMc:int;
      
      private var line:Bitmap;
      
      private var bg9:F9GridBitmap;
      
      private var bx:FCanvas;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var char:MapCutline;
      
      public function GongchengPaoPanel()
      {
         var tf:TextFormat;
         var img:Bitmap = null;
         super();
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         dragAble = true;
         width = 586;
         height = 462;
         this.titleText = LanResManager.getLanCommonTextWords("炮弹购买");
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
         this.bx = new FCanvas();
         this.bx.skin = "box";
         this.bx.x = 424;
         this.bx.y = 26;
         this.bx.width = 149;
         this.bx.height = 144;
         addChild(this.bx);
         this.bx = new FCanvas();
         this.bx.skin = "box_transparence";
         this.bx.x = 6;
         this.bx.y = 21;
         this.bx.width = 404 + 6;
         this.bx.height = 409;
         addChild(this.bx);
         this.bx = new FCanvas();
         this.bx.skin = "box_transparence";
         this.bx.x = 411 + 4;
         this.bx.y = 21;
         this.bx.width = 164;
         this.bx.height = 330;
         addChild(this.bx);
         this.bx = new FCanvas();
         this.bx.skin = "box";
         this.bx.x = 411 + 4;
         this.bx.y = 349;
         this.bx.width = 164;
         this.bx.height = 80;
         addChild(this.bx);
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         tf = new TextFormat();
         tf.align = "center";
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 200;
            y = 5;
            width = 260;
            height = 45;
            wordWrap = true;
            textColor = 12699076;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("火炮军团");
         }
         addChild(this.fta);
         img = StaticValue.getBitmapByClassName("ui.gongcheng.ammo.frame");
         addChild(img);
         img.x = 424;
         img.y = 23;
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 422;
            y = 177;
            width = 260;
            height = 25;
            wordWrap = true;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("攻城车种类") + "：";
         }
         addChild(this.fta);
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 125;
         this.bg9.height = 20;
         this.bg9.x = 435;
         this.bg9.y = 193;
         addChild(this.bg9);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            x = 445;
            y = 193;
            width = 260;
            height = 25;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 422;
            y = 217;
            width = 260;
            height = 25;
            wordWrap = true;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("攻城车威力") + "：";
         }
         addChild(this.fta);
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 125;
         this.bg9.height = 20;
         this.bg9.x = 435;
         this.bg9.y = 234;
         addChild(this.bg9);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            x = 445;
            y = 235;
            width = 260;
            height = 25;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.fta2);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 422;
            y = 258;
            width = 260;
            height = 25;
            wordWrap = true;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("落点误差范围") + "：";
         }
         addChild(this.fta);
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 69;
         this.bg9.height = 20;
         this.bg9.x = 505;
         this.bg9.y = 258;
         addChild(this.bg9);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            x = 508;
            y = 258;
            width = 60;
            height = 25;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.fta3);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 422;
            y = 280;
            width = 260;
            height = 25;
            wordWrap = true;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("伤害溅射范围") + "：";
         }
         addChild(this.fta);
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 69;
         this.bg9.height = 20;
         this.bg9.x = 505;
         this.bg9.y = 279;
         addChild(this.bg9);
         this.fta4 = new FTextArea();
         with(this.fta4)
         {
            x = 508;
            y = 280;
            width = 60;
            height = 25;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.fta4);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 422;
            y = 304;
            width = 260;
            height = 25;
            wordWrap = true;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("现有炮弹数") + "：";
         }
         addChild(this.fta);
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 120;
         this.bg9.height = 20;
         this.bg9.x = 435;
         this.bg9.y = 321;
         addChild(this.bg9);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            x = 445;
            y = 322;
            width = 260;
            height = 25;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.fta5);
         this.addBtn = new FSimpleButton();
         this.addBtn.skin = "sumButton";
         addChild(this.addBtn);
         this.addBtn.x = 554;
         this.addBtn.y = 323;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.line = new Bitmap();
         this.line = StaticValue.getBitmapByClassName("ui.line");
         this.line.x = 417;
         this.line.y = 348;
         this.line.width = 161;
         addChild(this.line);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 422;
            y = 354;
            width = 155;
            height = 80;
            wordWrap = true;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("鼠标移动到地图上点击后就会该点发炮发炮的10秒_new");
         }
         addChild(this.fta);
         this.fta6 = new FTextArea();
         with(this.fta6)
         {
            x = 100;
            y = 100;
            width = 260;
            height = 25;
            wordWrap = true;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
         }
         addChild(this.fta6);
         this.myTimer = new Timer(1000,1);
         this.myTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.setCountDownFun);
         this.char = new MapCutline(2);
      }
      
      private function setBgImg(param1:String) : void
      {
         if(this.bgImg != null)
         {
            this.bgImg.removeEventListener(MouseEvent.CLICK,this.onClickBgimg);
            this.bgImg.removeEventListener(MouseEvent.MOUSE_OVER,this.showTip);
            this.bgImg.removeEventListener(MouseEvent.MOUSE_OUT,this.showTip);
            this.bgImg.removeEventListener(MouseEvent.MOUSE_MOVE,this.showTip);
            if(this.bgImg.parent != null)
            {
               this.bgImg.parent.removeChild(this.bgImg);
            }
         }
         var _loc2_:String = GameConfig.fileBaseFolder + ResPathManager.MAP_SMALL.replace("$",param1);
         this.bgImg = FLoader.startLoad(_loc2_,400,400);
         this.bgImg.x = 11;
         this.bgImg.y = 26;
         this.bgImg.addEventListener(MouseEvent.CLICK,this.onClickBgimg);
         this.bgImg.addEventListener(MouseEvent.MOUSE_OVER,this.showTip);
         this.bgImg.addEventListener(MouseEvent.MOUSE_OUT,this.showTip);
         addChild(this.bgImg);
         if(this.char.parent)
         {
            this.char.parent.removeChild(this.char);
         }
         addChild(this.char);
         this.char.mouseEnabled = false;
         this.char.x = GameInstance.mainChar.piexl_x * GameInstance.scene.mapConfig.widthScale;
         this.char.y = GameInstance.mainChar.piexl_y * GameInstance.scene.mapConfig.heightScale;
      }
      
      private function onClickBgimg(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.djPd)
         {
            _loc2_ = 1 / GameInstance.scene.mapConfig.widthScale / 25;
            _loc3_ = 1 / GameInstance.scene.mapConfig.heightScale / 25;
            dispatchEvent(new BaseEvent(UI_AMMOBUYPANEL_MAP_CLICK,"",[int(this.bgImg.mouseX * _loc2_),int(this.bgImg.mouseY * _loc3_)]));
         }
      }
      
      private function showTip(param1:MouseEvent) : void
      {
         var _loc2_:Number = 1 / GameInstance.scene.mapConfig.widthScale / 25;
         var _loc3_:Number = 1 / GameInstance.scene.mapConfig.heightScale / 25;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.bgImg.addEventListener(MouseEvent.MOUSE_MOVE,this.showTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.tip.text = int(this.bgImg.mouseX * _loc2_) + "," + int(this.bgImg.mouseY * _loc3_);
               this.bgImg.parent.addChild(this.tipCanvas);
               this.tipCanvas.width = this.tip.width + 4;
               this.tipCanvas.height = this.tip.height + 4;
               this.tipCanvas.x = this.bgImg.mouseX + 15;
               this.tipCanvas.y = this.bgImg.mouseY + 25;
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.bgImg.removeEventListener(MouseEvent.MOUSE_MOVE,this.showTip);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.addBtn:
               dispatchEvent(new BaseEvent(UI_AMMOBUYPANEL_ADDBTN_CLICK));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function setCountDownFun(param1:TimerEvent = null) : void
      {
         if(this.bgImg == null)
         {
            return;
         }
         this.fta6.htmlText = String(this.Ti);
         this.fta6.x = this.numx + this.bgImg.x;
         this.fta6.y = this.numy + this.bgImg.y;
         this.myTimer.start();
         if(this.Ti == 0)
         {
            this.myTimer.stop();
            this.Ti = 10;
         }
         --this.Ti;
      }
      
      public function setInitializeTitle() : void
      {
         this.titleText = LanResManager.getLanCommonTextWords("发射炮弹");
         this.addBtn.visible = false;
      }
      
      public function setInitialize(param1:String, param2:String, param3:String, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:String = null;
         this.setBgImg(param1);
         this.fta1.htmlText = param2;
         this.fta2.htmlText = param3;
         this.fta3.htmlText = param4 + LanResManager.getLanCommonTextWords("格");
         this.fta4.htmlText = param5 + LanResManager.getLanCommonTextWords("格");
         this.fta5.htmlText = String(param6);
         this.djPd = true;
         if(this.imgIco1 != null && this.imgIco1.parent != null)
         {
            this.imgIco1.parent.removeChild(this.imgIco1);
         }
         this.pandanMc = OtherConst.PAODAN_HUOPAO - param7 % 2;
         _loc8_ = GameConfig.fileBaseFolder + "res/ui/huopao/img" + param7 + ".png";
         this.imgIco1 = FLoader.startLoad(_loc8_,144,137);
         this.imgIco1.x = 427;
         this.imgIco1.y = 29;
         addChildAt(this.imgIco1,1);
         this.titleText = LanResManager.getLanCommonTextWords("炮弹购买");
         this.addBtn.visible = true;
      }
      
      public function setPandanInitialize(param1:int, param2:String, param3:int) : void
      {
         var _loc4_:AmmoBuyPanel = new AmmoBuyPanel();
         _loc4_.$parent = this;
         _loc4_.setInitialize(param1,param2,param3);
         POPWindowManager.showWindow(_loc4_);
      }
      
      public function setCountDown(param1:int, param2:int) : void
      {
         this.numx = param1;
         this.numy = param2;
         this.Ti = 10;
         this.setCountDownFun();
      }
      
      public function setPlayMovie(param1:int, param2:int) : void
      {
         var xScale:Number = NaN;
         var yScale:Number = NaN;
         var loadCompleted:Function = null;
         var xx:int = param1;
         var yy:int = param2;
         loadCompleted = function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            mc = _loc2_.content as MovieClip;
            mc.x = xx * xScale + 11 - mc.width / 2;
            mc.y = yy * yScale + 26 - mc.height / 2;
            addChild(mc);
         };
         if(Boolean(this.mc) && this.mc.parent != null)
         {
            this.mc.parent.removeChild(this.mc);
         }
         xScale = 25 * GameInstance.scene.mapConfig.widthScale;
         yScale = 25 * GameInstance.scene.mapConfig.heightScale;
         LoaderManager.lazyLoad(loadCompleted,null,false,GameConfig.fileBaseFolder + "res/data/mc/paodan" + this.pandanMc + ".swf");
      }
      
      public function reset() : void
      {
         this.fta1.htmlText = "";
         this.fta2.htmlText = "";
         this.fta3.htmlText = "";
         this.fta4.htmlText = "";
         this.fta5.htmlText = "";
         this.fta6.htmlText = "";
         this.djPd = false;
         if(this.imgIco1 != null && this.imgIco1.parent != null)
         {
            this.imgIco1.parent.removeChild(this.imgIco1);
         }
      }
   }
}

