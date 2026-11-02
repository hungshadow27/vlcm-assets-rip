package com.tgame.moudels.login.view.compoents.ui
{
   import com.fireice.util.FBitmapDataBufferManager;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.moudels.login.view.compoents.LoginUI;
   import com.zcp.common.handler.HandlerThread;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.common.log.ZLog;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.net.URLRequest;
   import flash.utils.Timer;
   
   public class LoginBackGroundCanvas extends Sprite
   {
      
      public static const IMGPATH:String = "res/ui/login/";
      
      private var imgNameCache:Array;
      
      private var thisThis:Sprite;
      
      private var bgContainer:Sprite;
      
      private var effectContainer:Sprite;
      
      private var masks:Sprite;
      
      private var _m:Matrix;
      
      private var _x:int;
      
      private var bit:Bitmap;
      
      private var bLoaded:Boolean = false;
      
      private var logo:DisplayObject;
      
      private var rollSpeed:int = 0;
      
      private var bFirst:Boolean = true;
      
      private var logo1:DisplayObject;
      
      public function LoginBackGroundCanvas()
      {
         super();
         this.thisThis = this;
         this.imgNameCache = [];
         this.bgContainer = new Sprite();
         addChild(this.bgContainer);
         this.effectContainer = new Sprite();
         addChild(this.effectContainer);
         this.masks = new Sprite();
         addChild(this.masks);
         this.effectContainer.mask = this.masks;
         this._m = new Matrix();
         Tools.currentStage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      public function start2Rollit() : void
      {
         this.onEnterFrame();
      }
      
      public function stop2Rollit() : void
      {
         if(Tools.currentStage.hasEventListener(Event.ENTER_FRAME))
         {
            Tools.currentStage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         this.bgContainer.graphics.clear();
         this.bit = null;
      }
      
      public function loadMap(param1:int = -1) : void
      {
         var _loc3_:LoadData = null;
         var _loc4_:HandlerThread = null;
         var _loc5_:Loader = null;
         this.rollSpeed = param1;
         if(this.bLoaded)
         {
            return;
         }
         var _loc2_:Array = [];
         _loc3_ = this.getLoadData("bgdwjs");
         _loc2_.push(_loc3_);
         if(_loc2_.length > 0)
         {
            _loc4_ = new HandlerThread();
            for each(_loc3_ in _loc2_)
            {
               _loc5_ = _loc3_.userData.loadInfo.loader;
               _loc5_.contentLoaderInfo.addEventListener(Event.COMPLETE,_loc3_.onComplete);
               _loc5_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,_loc3_.onError);
               _loc5_.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,_loc3_.onError);
               _loc4_.push(_loc5_.load,[new URLRequest(_loc3_.url)],10);
            }
         }
      }
      
      private function getLoadData(param1:String, param2:Boolean = true) : LoadData
      {
         var loadData:LoadData = null;
         var filePath:String = null;
         var itemLoadComplete:Function = null;
         var itemLoadError:Function = null;
         var $key:String = param1;
         var autoRolling:Boolean = param2;
         itemLoadComplete = function(param1:Event):void
         {
            if(!bit)
            {
               bLoaded = true;
               bit = param1.target.content;
               _x = bit.width - Tools.currentStage.stageWidth;
               start2Rollit();
            }
         };
         itemLoadError = function(param1:*):void
         {
            ++loadData.userData.loadInfo.retry;
            if(loadData.userData.loadInfo.retry > 3)
            {
               ZLog.add("######尝试加载地图" + filePath + "3次均失败，已经放弃加载");
            }
            else
            {
               loadData.userData.loadInfo.loader.load(new URLRequest(filePath));
            }
         };
         filePath = GameConfig.fileBaseFolder + IMGPATH + $key + ".jpg?3";
         loadData = new LoadData(filePath,itemLoadComplete,null,itemLoadError,"",filePath);
         loadData.userData.loadInfo = {
            "loader":new Loader(),
            "retry":0
         };
         return loadData;
      }
      
      private function onResize(param1:Event = null) : void
      {
         var _loc2_:Graphics = null;
         if(TPreLoader.bFirstShowed)
         {
            _loc2_ = this.bgContainer.graphics;
            _loc2_.clear();
            _loc2_.beginBitmapFill(FBitmapDataBufferManager.getBD("ui.login.bg2.tile"));
            _loc2_.drawRect(0,-200,Tools.currentStage.stageWidth,Tools.currentStage.stageHeight + 200);
            _loc2_.endFill();
            if(!this.logo)
            {
               this.logo = FLoader.startLoad(GameConfig.fileBaseFolder + IMGPATH + "logo.png",1200,768,false);
               this.bgContainer.addChild(this.logo);
            }
            this.logo.x = Tools.currentStage.stageWidth / 2 - this.logo.width / 2;
            this.logo.y = this.bgContainer.y - 35 - 70;
         }
      }
      
      private function onEnterFrame(param1:Event = null) : void
      {
         var speed:Number = NaN;
         var t:Timer = null;
         var $e:Event = param1;
         if(this.bit)
         {
            speed = 30 / Tools.currentStage.frameRate;
            if(this.rollSpeed >= 0)
            {
               speed = this.rollSpeed;
            }
            this.y = (Tools.currentStage.stageHeight - this.bit.bitmapData.height) / 2;
            this._x += speed;
            this._x %= this.bit.bitmapData.width;
            if(this.rollSpeed == 0)
            {
               this._x = LoginUI.bgX;
            }
            this._m.identity();
            this._m.translate(this._x,0);
            if(this.rollSpeed > 0)
            {
               LoginUI.bgX = this._x;
            }
            this.bgContainer.graphics.clear();
            this.bgContainer.graphics.beginBitmapFill(this.bit.bitmapData,this._m);
            this.bgContainer.graphics.drawRect(0,0,Tools.currentStage.stageWidth,this.bit.bitmapData.height);
            this.bgContainer.graphics.endFill();
            if(this.bFirst)
            {
               this.bFirst = false;
               t = new Timer(1500,0);
               t.addEventListener(TimerEvent.TIMER,function():void
               {
                  t.stop();
                  Tools.currentStage.addEventListener(Event.ENTER_FRAME,onEnterFrame);
               });
               t.start();
            }
         }
         if(TPreLoader.bFirstShowed)
         {
            if(Tools.currentStage.hasEventListener(Event.ENTER_FRAME))
            {
               Tools.currentStage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            }
         }
      }
      
      public function stop() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = 0;
         var _loc3_:int = this.effectContainer.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this.effectContainer.getChildAt(_loc2_);
            if(_loc1_ is MovieClip)
            {
               (_loc1_ as MovieClip).stop();
            }
            _loc2_++;
         }
      }
      
      public function play() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = 0;
         var _loc3_:int = this.effectContainer.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this.effectContainer.getChildAt(_loc2_);
            if(_loc1_ is MovieClip)
            {
               (_loc1_ as MovieClip).play();
            }
            _loc2_++;
         }
         if(TPreLoader.bFirstShowed)
         {
            if(Tools.currentStage.hasEventListener(Event.ENTER_FRAME))
            {
               Tools.currentStage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            }
            if(!this.logo)
            {
               this.bgContainer.graphics.clear();
               this.bit = null;
            }
            this.onResize();
         }
      }
      
      public function destory() : void
      {
         var _loc1_:DisplayObject = null;
         while(this.bgContainer.numChildren > 0)
         {
            this.bgContainer.removeChildAt(0);
         }
         while(this.effectContainer.numChildren > 0)
         {
            _loc1_ = this.effectContainer.getChildAt(0);
            if(_loc1_ is MovieClip)
            {
               (_loc1_ as MovieClip).stop();
            }
            this.effectContainer.removeChild(_loc1_);
         }
         this.bit = null;
         if(Tools.currentStage.hasEventListener(Event.ENTER_FRAME))
         {
            Tools.currentStage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
   }
}

