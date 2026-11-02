package com.tgame.manager
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.zcp.common.higheffect.lizi.LiziXuanwoBox;
   import com.zcp.common.higheffect.snow.SnowBox;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.Fun;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarFaceData;
   import com.zcp.manager.LoaderManager;
   import com.zcp.manager.RslLoaderManager;
   import com.zcp.manager.TimerManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.filters.BlurFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.setTimeout;
   
   public class HighEffectManager
   {
      
      private static var _ghostTD:TimerData;
      
      private static var _snowTD:TimerData;
      
      private static var _snowBox:SnowBox;
      
      private static var _fenFlowerTD:TimerData;
      
      private static var _fenFlowerBox:SnowBox;
      
      private static var _yuanbaoTD:TimerData;
      
      private static var _yuanbaoBox:SnowBox;
      
      private static var _shitouTD:TimerData;
      
      private static var _shitouBox:SnowBox;
      
      private static var _liziXuanwoBox:LiziXuanwoBox;
      
      private static var flower_kuang:MovieClip;
      
      private static var flower_kuang_arr:Array;
      
      private static var yanHuaEffectContainer:MovieClip;
      
      private static var timeDelete:int;
      
      private static var liPao_kuang:MovieClip;
      
      private static var liPao_kuang_arr1:Array;
      
      private static var liPao_kuang_arr2:Array;
      
      private static var _xiaxueTD:TimerData;
      
      private static var _xiaxueBox:SnowBox;
      
      private static var _ghostList:Array = [];
      
      private static var _snowIndex:int = 0;
      
      private static var _fenFlowerIndex:int = 0;
      
      private static var _yuanbaoIndex:int = 0;
      
      private static var _shitouIndex:int = 0;
      
      private static var dely:int = 20;
      
      private static var _xiaxueIndex:int = 0;
      
      public function HighEffectManager()
      {
         super();
      }
      
      public static function setShowArea(param1:Rectangle) : void
      {
         if(_snowBox != null)
         {
            _snowBox.setShowArea(param1);
         }
         if(_xiaxueBox != null)
         {
            _xiaxueBox.setShowArea(param1);
         }
         if(_liziXuanwoBox != null)
         {
            _liziXuanwoBox.setShowArea(param1);
         }
         if(_fenFlowerBox != null)
         {
            _fenFlowerBox.setShowArea(param1);
         }
      }
      
      public static function stopAndClearAll() : void
      {
         clearAllGhost();
         snow_stop(true,true);
         liziXuanwo_stop(true);
         fenFlower_stop(true);
      }
      
      public static function addGhost(param1:Array, param2:Boolean = false) : void
      {
         var _loc3_:Array = null;
         var _loc4_:AvatarFaceData = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc14_:Bitmap = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         if(param1.length == 0)
         {
            return;
         }
         var _loc5_:int = int(param1.length);
         var _loc6_:* = int(_loc5_ - 1);
         while(_loc6_ >= 0)
         {
            _loc4_ = param1[_loc6_];
            if(param2)
            {
               if(_loc4_.type != AvatarPartType.BODY && _loc4_.type != AvatarPartType.WEAPON && _loc4_.type != AvatarPartType.MOUNT || _loc4_.cutRect.isEmpty())
               {
                  param1.splice(_loc6_,1);
               }
            }
            else if(_loc4_.type != AvatarPartType.BODY || _loc4_.cutRect.isEmpty())
            {
               param1.splice(_loc6_,1);
            }
            _loc6_--;
         }
         var _loc7_:int = int.MAX_VALUE;
         var _loc8_:int = int.MAX_VALUE;
         var _loc9_:int = -int.MAX_VALUE;
         var _loc10_:int = -int.MAX_VALUE;
         for each(_loc4_ in param1)
         {
            if(_loc7_ > _loc4_.cutRect.left)
            {
               _loc7_ = _loc4_.cutRect.left;
            }
            if(_loc8_ > _loc4_.cutRect.top)
            {
               _loc8_ = _loc4_.cutRect.top;
            }
            if(_loc9_ < _loc4_.cutRect.right)
            {
               _loc9_ = _loc4_.cutRect.right;
            }
            if(_loc10_ < _loc4_.cutRect.bottom)
            {
               _loc10_ = _loc4_.cutRect.bottom;
            }
         }
         _loc11_ = _loc9_ - _loc7_;
         _loc12_ = _loc10_ - _loc8_;
         if(_loc11_ <= 0 || _loc11_ > 2880)
         {
            return;
         }
         if(_loc12_ <= 0 || _loc12_ > 2880)
         {
            return;
         }
         var _loc13_:BitmapData = new BitmapData(_loc11_,_loc12_,true,0);
         for each(_loc4_ in param1)
         {
            _loc15_ = _loc4_.sourcePoint.x;
            _loc16_ = _loc4_.sourcePoint.y;
            _loc17_ = _loc4_.cutRect.width;
            _loc18_ = _loc4_.cutRect.height;
            _loc19_ = _loc4_.cutRect.x - _loc7_;
            _loc20_ = _loc4_.cutRect.y - _loc8_;
            _loc13_.copyPixels(_loc4_.sourceBitmapData,new Rectangle(_loc15_,_loc16_,_loc17_,_loc18_),new Point(_loc19_,_loc20_),null,null,true);
         }
         _loc14_ = new Bitmap();
         _loc14_.name = "4";
         _loc14_.bitmapData = _loc13_;
         _loc14_.x = _loc7_;
         _loc14_.y = _loc8_;
         GameInstance.scene.customLayer.addChildAt(_loc14_,0);
         _ghostList.push(_loc14_);
         if(!_ghostTD)
         {
            _ghostTD = TimerManager.createTimer(40,0,updateGhost);
         }
      }
      
      private static function clearAllGhost() : void
      {
         var _loc1_:Bitmap = null;
         for each(_loc1_ in _ghostList)
         {
            if(_loc1_.parent != null)
            {
               _loc1_.parent.removeChild(_loc1_);
            }
         }
         _ghostList.length = 0;
         if(_ghostTD != null)
         {
            TimerManager.deleteTimer(_ghostTD);
            _ghostTD = null;
         }
      }
      
      private static function updateGhost() : void
      {
         var _loc3_:Bitmap = null;
         var _loc1_:int = int(_ghostList.length);
         var _loc2_:* = int(_loc1_ - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = _ghostList[_loc2_];
            if(_loc3_.name == "0")
            {
               _ghostList.splice(_loc2_,1);
               if(_loc3_.parent != null)
               {
                  _loc3_.parent.removeChild(_loc3_);
               }
               if(_ghostList.length == 0)
               {
                  if(_ghostTD != null)
                  {
                     TimerManager.deleteTimer(_ghostTD);
                     _ghostTD = null;
                  }
               }
            }
            else
            {
               _loc3_.name = String(Number(_loc3_.name) - 1);
               _loc3_.bitmapData.colorTransform(_loc3_.bitmapData.rect,new ColorTransform(1,1,1,0.68));
               _loc3_.bitmapData.applyFilter(_loc3_.bitmapData,_loc3_.bitmapData.rect,new Point(),new BlurFilter(2,2,1));
            }
            _loc2_--;
         }
      }
      
      public static function get snow_isRunning() : Boolean
      {
         return _snowBox != null && _snowBox.isRunning;
      }
      
      public static function snow_start(param1:int = 0, param2:Boolean = false) : void
      {
         var thisSnowIndex:int = 0;
         var loadComplete:Function = null;
         var $time:int = param1;
         var $clear:Boolean = param2;
         loadComplete = function():void
         {
            var flowerBDList:Array;
            var flowerClassName:String = null;
            var bd:BitmapData = null;
            if(thisSnowIndex != _snowIndex)
            {
               return;
            }
            flowerBDList = [];
            for each(flowerClassName in ResPathManager.highEffect_flower_list)
            {
               bd = RslLoaderManager.getInstance(flowerClassName,10,10);
               if(bd != null)
               {
                  flowerBDList.push(bd);
               }
            }
            if(_snowBox == null)
            {
               _snowBox = new SnowBox(new Rectangle(-GameInstance.scene.x,-GameInstance.scene.y,GameInstance.scene.sceneConfig.width,GameInstance.scene.sceneConfig.height),flowerBDList,false);
               _snowBox.addEventListener(SnowBox.SNOW_COMPLETE,function(param1:Event):void
               {
                  if(_snowBox.parent != null)
                  {
                     _snowBox.parent.removeChild(_snowBox);
                  }
               });
            }
            _snowBox.start($clear);
            GameInstance.scene.customLayer.addChild(_snowBox);
            if($time > 0)
            {
               _snowTD = TimerManager.createTimer($time * 1000,1,snow_stop);
            }
         };
         snow_stop();
         ++_snowIndex;
         thisSnowIndex = _snowIndex;
         RslLoaderManager.lazyLoad(loadComplete,GameConfig.decode,ResPathManager.highEffect_flower_path);
      }
      
      public static function snow_stop(param1:Boolean = false, param2:Boolean = false) : void
      {
         ++_snowIndex;
         if(_snowBox != null)
         {
            _snowBox.stop(param1,param2);
         }
         if(_snowTD != null)
         {
            TimerManager.deleteTimer(_snowTD);
            _snowTD = null;
         }
      }
      
      public static function get fenFlower_isRunning() : Boolean
      {
         return _fenFlowerBox != null && _fenFlowerBox.isRunning;
      }
      
      public static function fenFlower_start(param1:int = 0, param2:Boolean = false) : void
      {
         var thisFenFlowerIndex:int = 0;
         var loadComplete:Function = null;
         var $time:int = param1;
         var $clear:Boolean = param2;
         loadComplete = function():void
         {
            var flowerBDList:Array;
            var flowerClassName:String = null;
            var bd:BitmapData = null;
            if(thisFenFlowerIndex != _fenFlowerIndex)
            {
               return;
            }
            flowerBDList = [];
            for each(flowerClassName in ResPathManager.highEffect_fenFlower_list)
            {
               bd = RslLoaderManager.getInstance(flowerClassName,10,10);
               if(bd != null)
               {
                  flowerBDList.push(bd);
               }
            }
            if(_fenFlowerBox == null)
            {
               _fenFlowerBox = new SnowBox(new Rectangle(-GameInstance.scene.x,-GameInstance.scene.y,GameInstance.scene.sceneConfig.width,GameInstance.scene.sceneConfig.height),flowerBDList,false);
               _fenFlowerBox.addEventListener(SnowBox.SNOW_COMPLETE,function(param1:Event):void
               {
                  if(_fenFlowerBox.parent != null)
                  {
                     _fenFlowerBox.parent.removeChild(_fenFlowerBox);
                  }
                  clear_Flower_kuang();
               });
            }
            _fenFlowerBox.start($clear);
            GameInstance.scene.customLayer.addChild(_fenFlowerBox);
            if($time > 0)
            {
               _fenFlowerTD = TimerManager.createTimer($time * 1000,1,fenFlower_stop);
            }
         };
         fenFlower_stop();
         ++_fenFlowerIndex;
         thisFenFlowerIndex = _fenFlowerIndex;
         RslLoaderManager.lazyLoad(loadComplete,GameConfig.decode,ResPathManager.highEffect_fenFlower_path);
      }
      
      public static function fenFlower_stop(param1:Boolean = false, param2:Boolean = false) : void
      {
         ++_fenFlowerIndex;
         if(_fenFlowerBox != null)
         {
            _fenFlowerBox.stop(param1,param2);
         }
         if(_fenFlowerTD != null)
         {
            TimerManager.deleteTimer(_fenFlowerTD);
            _fenFlowerTD = null;
         }
      }
      
      public static function yuanbao_start(param1:int = 0, param2:Boolean = false) : void
      {
         var thisSnowIndex:int = 0;
         var loadComplete:Function = null;
         var $time:int = param1;
         var $clear:Boolean = param2;
         loadComplete = function():void
         {
            var yuanbaoBDList:Array;
            var yuanbaoClassName:String = null;
            var bd:BitmapData = null;
            if(thisSnowIndex != _yuanbaoIndex)
            {
               return;
            }
            yuanbaoBDList = [];
            for each(yuanbaoClassName in ResPathManager.highEffect_yuanbao_list)
            {
               bd = RslLoaderManager.getInstance(yuanbaoClassName,10,10);
               if(bd != null)
               {
                  yuanbaoBDList.push(bd);
               }
            }
            if(_yuanbaoBox == null)
            {
               _yuanbaoBox = new SnowBox(new Rectangle(-GameInstance.scene.x,-GameInstance.scene.y,GameInstance.scene.sceneConfig.width,GameInstance.scene.sceneConfig.height),yuanbaoBDList,false);
               _yuanbaoBox.setStepY(5,15);
               _yuanbaoBox.addEventListener(SnowBox.SNOW_COMPLETE,function(param1:Event):void
               {
                  if(_yuanbaoBox.parent != null)
                  {
                     _yuanbaoBox.parent.removeChild(_yuanbaoBox);
                  }
               });
            }
            _yuanbaoBox.start($clear);
            GameInstance.scene.customLayer.addChild(_yuanbaoBox);
            if($time > 0)
            {
               _yuanbaoTD = TimerManager.createTimer($time * 1000,1,yuanbao_stop);
            }
         };
         yuanbao_stop();
         ++_yuanbaoIndex;
         thisSnowIndex = _yuanbaoIndex;
         RslLoaderManager.lazyLoad(loadComplete,GameConfig.decode,ResPathManager.highEffect_yuanbao_path);
      }
      
      public static function yuanbao_stop(param1:Boolean = false, param2:Boolean = false) : void
      {
         ++_yuanbaoIndex;
         if(_yuanbaoBox != null)
         {
            _yuanbaoBox.stop(param1,param2);
         }
         if(_yuanbaoTD != null)
         {
            TimerManager.deleteTimer(_yuanbaoTD);
            _yuanbaoTD = null;
         }
      }
      
      public static function shitou_start(param1:int = 0, param2:Boolean = false) : void
      {
         var thisSnowIndex:int = 0;
         var loadComplete:Function = null;
         var $time:int = param1;
         var $clear:Boolean = param2;
         loadComplete = function():void
         {
            var shitouBDList:Array;
            var shitouClassName:String = null;
            var bd:BitmapData = null;
            if(thisSnowIndex != _shitouIndex)
            {
               return;
            }
            shitouBDList = [];
            for each(shitouClassName in ResPathManager.highEffect_shitou_list)
            {
               bd = RslLoaderManager.getInstance(shitouClassName,10,10);
               if(bd != null)
               {
                  shitouBDList.push(bd);
               }
            }
            if(_shitouBox == null)
            {
               _shitouBox = new SnowBox(new Rectangle(-GameInstance.scene.x,-GameInstance.scene.y,GameInstance.scene.sceneConfig.width,GameInstance.scene.sceneConfig.height),shitouBDList,false);
               _shitouBox.setStepY(30,40);
               _shitouBox.addEventListener(SnowBox.SNOW_COMPLETE,function(param1:Event):void
               {
                  if(_shitouBox.parent != null)
                  {
                     _shitouBox.parent.removeChild(_shitouBox);
                  }
               });
            }
            _shitouBox.start($clear);
            GameInstance.scene.customLayer.addChild(_shitouBox);
            if($time > 0)
            {
               _shitouTD = TimerManager.createTimer($time * 1000,1,shitou_stop);
            }
         };
         shitou_stop();
         ++_shitouIndex;
         thisSnowIndex = _shitouIndex;
         RslLoaderManager.lazyLoad(loadComplete,GameConfig.decode,ResPathManager.highEffect_shitou_path);
      }
      
      public static function shitou_stop(param1:Boolean = false, param2:Boolean = false) : void
      {
         ++_shitouIndex;
         if(_shitouBox != null)
         {
            _shitouBox.stop(param1,param2);
         }
         if(_shitouTD != null)
         {
            TimerManager.deleteTimer(_shitouTD);
            _shitouTD = null;
         }
      }
      
      public static function get liziXuanwo_isRunning() : Boolean
      {
         return _liziXuanwoBox != null && _liziXuanwoBox.isRunning;
      }
      
      public static function lixiXuanwo_start() : void
      {
         if(_liziXuanwoBox == null)
         {
            _liziXuanwoBox = new LiziXuanwoBox(new Rectangle(-GameInstance.scene.x,-GameInstance.scene.y,GameInstance.scene.sceneConfig.width,GameInstance.scene.sceneConfig.height),new Point(GameInstance.mainChar.piexl_x,GameInstance.mainChar.piexl_y),1000,1000 * Math.cos(45 * Math.PI / 180),150,80,false);
            _liziXuanwoBox.mouseChildren = _liziXuanwoBox.mouseEnabled = false;
            _liziXuanwoBox.alpha = 0.6;
         }
         _liziXuanwoBox.setShowArea(new Rectangle(-GameInstance.scene.x,-GameInstance.scene.y,GameInstance.scene.sceneConfig.width,GameInstance.scene.sceneConfig.height));
         _liziXuanwoBox.start();
         GameInstance.scene.customLayer.addChild(_liziXuanwoBox);
      }
      
      public static function liziXuanwo_stop(param1:Boolean = false) : void
      {
         if(_liziXuanwoBox != null)
         {
            if(_liziXuanwoBox.parent)
            {
               _liziXuanwoBox.parent.removeChild(_liziXuanwoBox);
            }
            _liziXuanwoBox.stop(param1);
            _liziXuanwoBox = null;
         }
      }
      
      public static function showFlower_kuang() : void
      {
         var loadComplete:Function;
         var s:String = null;
         var draw:Function = function():void
         {
            var _loc4_:int = 0;
            var _loc7_:int = 0;
            var _loc8_:Bitmap = null;
            var _loc9_:Bitmap = null;
            var _loc10_:Bitmap = null;
            var _loc11_:Bitmap = null;
            var _loc1_:int = GameInstance.stage.stageHeight / 32;
            var _loc2_:int = 0;
            var _loc3_:int = 0;
            _loc4_ = 0;
            while(_loc4_ < _loc1_)
            {
               if(_loc8_)
               {
                  _loc2_ = _loc8_.y + _loc8_.height - 15;
               }
               if(_loc9_)
               {
                  _loc3_ = _loc9_.y + _loc9_.height - 15;
               }
               _loc7_ = ZMath.getRandomNumber(0,2);
               _loc8_ = new Bitmap((flower_kuang_arr[_loc7_] as Bitmap).bitmapData);
               if(_loc8_)
               {
                  _loc8_.x = -10;
                  _loc8_.y = _loc2_;
               }
               _loc9_ = new Bitmap((flower_kuang_arr[_loc7_] as Bitmap).bitmapData);
               if(_loc9_)
               {
                  _loc9_.x = GameInstance.stage.stageWidth - _loc9_.width + 10;
                  _loc9_.y = _loc3_;
               }
               flower_kuang.addChild(_loc8_);
               flower_kuang.addChild(_loc9_);
               _loc4_++;
            }
            _loc1_ = GameInstance.stage.stageWidth / 37;
            var _loc5_:int = 0;
            var _loc6_:int = 0;
            _loc4_ = 0;
            while(_loc4_ < _loc1_)
            {
               if(_loc10_)
               {
                  _loc5_ = _loc10_.x + _loc10_.width - 20;
               }
               if(_loc11_)
               {
                  _loc6_ = _loc11_.x + _loc11_.width - 20;
               }
               _loc7_ = ZMath.getRandomNumber(0,2);
               _loc10_ = new Bitmap((flower_kuang_arr[_loc7_] as Bitmap).bitmapData);
               if(_loc10_)
               {
                  _loc10_.x = _loc5_;
                  _loc10_.y = -10;
               }
               _loc11_ = new Bitmap((flower_kuang_arr[_loc7_] as Bitmap).bitmapData);
               if(_loc11_)
               {
                  _loc11_.x = _loc6_;
                  _loc11_.y = GameInstance.stage.stageHeight - _loc11_.height + 10;
               }
               flower_kuang.addChild(_loc10_);
               flower_kuang.addChild(_loc11_);
               _loc4_++;
            }
         };
         clear_Flower_kuang();
         flower_kuang_arr = [];
         flower_kuang = new MovieClip();
         flower_kuang.type = OtherConst.HUAKUANG_TYPE;
         GameInstance.uiInstance.bloodContainer.addChild(flower_kuang);
         for each(s in ResPathManager.flowerKuang_path)
         {
            loadComplete = function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               var _loc3_:* = _loc2_.content;
               var _loc4_:Bitmap = _loc3_ as Bitmap;
               if(_loc4_)
               {
                  flower_kuang_arr.push(_loc4_);
                  if(flower_kuang_arr.length == 3)
                  {
                     draw();
                  }
               }
            };
            LoaderManager.lazyLoad(loadComplete,null,false,s);
         }
      }
      
      private static function clear_Flower_kuang() : void
      {
         if(flower_kuang)
         {
            Fun.clearChildren(flower_kuang,true);
            if(flower_kuang.parent)
            {
               flower_kuang.parent.removeChild(flower_kuang);
            }
            flower_kuang = null;
         }
      }
      
      public static function doubleFlyStatus(param1:Boolean) : void
      {
         GameInstance.mainChar.visible = !param1;
         GameInstance.mainChar.showContainer.visible = !param1;
         GameState.isDoubleFlyStatus = param1;
         GameInstance.app.sceneContainer.mouseEnabled = GameInstance.app.sceneContainer.mouseChildren = !param1;
         KeyboardManager.enable = !param1;
         GameInstance.uiInstance.mainUI.setMainUIType(param1);
      }
      
      public static function set2016YanHuaEffect(param1:int) : void
      {
         if(!yanHuaEffectContainer)
         {
            yanHuaEffectContainer = new MovieClip();
         }
         GameInstance.uiInstance.bloodContainer.addChild(yanHuaEffectContainer);
         if(timeDelete < param1 * (1000 / dely) && timeDelete != 0)
         {
            timeDelete = param1 * (1000 / dely);
         }
         else
         {
            timeDelete = param1 * (1000 / dely);
            setTimeout(setTimeoutHandler,dely);
         }
      }
      
      private static function setTimeoutHandler() : void
      {
         var index:int = Math.ceil(ZMath.getRandomNumber(1,9));
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var yanHuaMC:MovieClip = null;
            var onEnterFrame:Function = null;
            var $e:Event = param1;
            onEnterFrame = function(param1:Event):void
            {
               if(yanHuaMC)
               {
                  if(yanHuaMC.currentFrame == yanHuaMC.totalFrames)
                  {
                     yanHuaMC.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
                     yanHuaMC.parent.removeChild(yanHuaMC);
                     yanHuaMC = null;
                  }
               }
            };
            var loadingItem:LoadingItem = $e.target as LoadingItem;
            yanHuaMC = loadingItem.content as MovieClip;
            yanHuaMC.x = Math.ceil(ZMath.getRandomNumber(125,GameInstance.stage.stageWidth - 125));
            yanHuaMC.y = Math.ceil(ZMath.getRandomNumber(120,GameInstance.stage.stageHeight - 120));
            yanHuaMC.gotoAndPlay(1);
            yanHuaEffectContainer.addChild(yanHuaMC);
            yanHuaMC.addEventListener(Event.ENTER_FRAME,onEnterFrame);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/effect/yanhua/" + index + ".swf");
         --timeDelete;
         if(timeDelete > 0)
         {
            setTimeout(setTimeoutHandler,dely);
         }
         else if(timeDelete <= 0)
         {
            clear_LiPao_kuang();
         }
      }
      
      public static function showLiPao_kuang() : void
      {
         var loadComplete1:Function;
         var loadComplete2:Function;
         var s:String = null;
         var draw:Function = function(param1:int):void
         {
            var _loc2_:int = 0;
            var _loc3_:int = 0;
            var _loc4_:int = 0;
            var _loc5_:int = 0;
            var _loc6_:int = 0;
            var _loc7_:Bitmap = null;
            var _loc8_:Bitmap = null;
            var _loc9_:int = 0;
            var _loc10_:int = 0;
            var _loc11_:Bitmap = null;
            var _loc12_:Bitmap = null;
            if(param1 == 1)
            {
               _loc2_ = GameInstance.stage.stageHeight / 15;
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 0;
               while(_loc5_ < _loc2_)
               {
                  if(_loc7_)
                  {
                     _loc3_ = _loc7_.y + _loc7_.height - 35;
                  }
                  if(_loc8_)
                  {
                     _loc4_ = _loc8_.y + _loc8_.height - 35;
                  }
                  _loc6_ = 0;
                  _loc7_ = new Bitmap((liPao_kuang_arr1[_loc6_] as Bitmap).bitmapData);
                  if(_loc7_)
                  {
                     _loc7_.x = 0;
                     _loc7_.y = _loc3_;
                  }
                  _loc8_ = new Bitmap((liPao_kuang_arr1[_loc6_] as Bitmap).bitmapData);
                  if(_loc8_)
                  {
                     _loc8_.x = GameInstance.stage.stageWidth - _loc8_.width + 15;
                     _loc8_.y = _loc4_;
                  }
                  liPao_kuang.addChild(_loc7_);
                  liPao_kuang.addChild(_loc8_);
                  _loc5_++;
               }
            }
            else
            {
               _loc2_ = GameInstance.stage.stageWidth / 20;
               _loc9_ = 0;
               _loc10_ = 0;
               _loc5_ = 0;
               while(_loc5_ < _loc2_)
               {
                  if(_loc11_)
                  {
                     _loc9_ = _loc11_.x + _loc11_.width - 35;
                  }
                  if(_loc12_)
                  {
                     _loc10_ = _loc12_.x + _loc12_.width - 35;
                  }
                  _loc6_ = ZMath.getRandomNumber(0,1);
                  _loc11_ = new Bitmap((liPao_kuang_arr2[_loc6_] as Bitmap).bitmapData);
                  if(_loc11_)
                  {
                     _loc11_.x = _loc9_;
                     _loc11_.y = -10;
                  }
                  _loc12_ = new Bitmap((liPao_kuang_arr2[_loc6_] as Bitmap).bitmapData);
                  if(_loc12_)
                  {
                     _loc12_.x = _loc10_;
                     _loc12_.y = GameInstance.stage.stageHeight - _loc12_.height + 35;
                  }
                  liPao_kuang.addChild(_loc11_);
                  liPao_kuang.addChild(_loc12_);
                  _loc5_++;
               }
            }
         };
         clear_LiPao_kuang();
         liPao_kuang_arr1 = [];
         liPao_kuang_arr2 = [];
         liPao_kuang = new MovieClip();
         liPao_kuang.type = OtherConst.LIPAO_TYPE;
         GameInstance.uiInstance.bloodContainer.addChild(liPao_kuang);
         for each(s in ResPathManager.liPaoKuang_path(1))
         {
            loadComplete1 = function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               var _loc3_:* = _loc2_.content;
               var _loc4_:Bitmap = _loc3_ as Bitmap;
               if(_loc4_)
               {
                  liPao_kuang_arr1.push(_loc4_);
                  if(liPao_kuang_arr1.length == 1)
                  {
                     draw(1);
                  }
               }
            };
            LoaderManager.lazyLoad(loadComplete1,null,false,s);
         }
         for each(s in ResPathManager.liPaoKuang_path(2))
         {
            loadComplete2 = function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               var _loc3_:* = _loc2_.content;
               var _loc4_:Bitmap = _loc3_ as Bitmap;
               if(_loc4_)
               {
                  liPao_kuang_arr2.push(_loc4_);
                  if(liPao_kuang_arr2.length == 2)
                  {
                     draw(2);
                  }
               }
            };
            LoaderManager.lazyLoad(loadComplete2,null,false,s);
         }
      }
      
      public static function clear_LiPao_kuang() : void
      {
         if(liPao_kuang)
         {
            Fun.clearChildren(liPao_kuang,true);
            if(liPao_kuang.parent)
            {
               liPao_kuang.parent.removeChild(liPao_kuang);
            }
            liPao_kuang = null;
         }
      }
      
      public static function get xiaxue_isRunning() : Boolean
      {
         return _xiaxueBox != null && _xiaxueBox.isRunning;
      }
      
      public static function xiaxue_start(param1:int = 0, param2:Boolean = false) : void
      {
         var thisXiaxueIndex:int = 0;
         var loadComplete:Function = null;
         var $time:int = param1;
         var $clear:Boolean = param2;
         loadComplete = function():void
         {
            var flowerBDList:Array;
            var flowerClassName:String = null;
            var bd:BitmapData = null;
            if(thisXiaxueIndex != _xiaxueIndex)
            {
               return;
            }
            flowerBDList = [];
            for each(flowerClassName in ResPathManager.highEffect_xuehua_list)
            {
               bd = RslLoaderManager.getInstance(flowerClassName,10,10);
               if(bd != null)
               {
                  flowerBDList.push(bd);
               }
            }
            if(_xiaxueBox == null)
            {
               _xiaxueBox = new SnowBox(new Rectangle(-GameInstance.scene.x,-GameInstance.scene.y,GameInstance.scene.sceneConfig.width,GameInstance.scene.sceneConfig.height),flowerBDList,false);
               _xiaxueBox.addEventListener(SnowBox.SNOW_COMPLETE,function(param1:Event):void
               {
                  if(_xiaxueBox.parent != null)
                  {
                     _xiaxueBox.parent.removeChild(_xiaxueBox);
                  }
               });
            }
            _xiaxueBox.start($clear);
            GameInstance.scene.customLayer.addChild(_xiaxueBox);
            if($time > 0)
            {
               _xiaxueTD = TimerManager.createTimer($time * 1000,1,xiaxue_stop);
            }
         };
         xiaxue_stop();
         ++_xiaxueIndex;
         thisXiaxueIndex = _xiaxueIndex;
         RslLoaderManager.lazyLoad(loadComplete,GameConfig.decode,ResPathManager.highEffect_xuehua_path);
      }
      
      public static function xiaxue_stop(param1:Boolean = false, param2:Boolean = false) : void
      {
         ++_xiaxueIndex;
         if(_xiaxueBox != null)
         {
            _xiaxueBox.stop(param1,param2);
         }
         if(_xiaxueTD != null)
         {
            TimerManager.deleteTimer(_xiaxueTD);
            _xiaxueTD = null;
         }
      }
   }
}

