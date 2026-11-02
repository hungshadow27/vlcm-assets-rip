package com.tgame.manager
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.greensock.TweenLite;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.Player;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.vo.move.MoveCallBack;
   import com.zcp.manager.LoaderManager;
   import com.zcp.manager.RslLoaderManager;
   import com.zcp.manager.TimerManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   
   public class FightManager
   {
      
      private static var _blindTD:TimerData;
      
      private static var _blindBP:Bitmap;
      
      private static var _zijinhuluTD:TimerData;
      
      private static var _zijinhuluBP:Bitmap;
      
      private static var _qlblindTD:TimerData;
      
      private static var _qlblindBP:Bitmap;
      
      private static var _darkenBP:Bitmap;
      
      private static var _darkenSpr:Sprite;
      
      private static var _shenzhuaTD:TimerData;
      
      private static var _shenzhuaMC:MovieClip;
      
      private static var autoAttackTimerData:TimerData;
      
      private static var _miwuTD:TimerData;
      
      private static var _miwuBP:Bitmap;
      
      private static var _xueDaoTD:TimerData;
      
      private static var _xueDaoMC:MovieClip;
      
      private static var _ziQiTD:TimerData;
      
      private static var _ziQiBP:Bitmap;
      
      private static var _lvblindTD:TimerData;
      
      private static var _lvblindBP:Bitmap;
      
      private static var _shisanjianMC:MovieClip;
      
      private static var _xiaglongaoyiMC:MovieClip;
      
      public static var enableScreenShake:Boolean = true;
      
      private static var _screenShaking:Boolean = false;
      
      public function FightManager()
      {
         super();
      }
      
      public static function be_beatBack(param1:SceneCharacter, param2:Point, param3:Number, param4:MoveCallBack = null) : void
      {
         param1.lineTo(param2,param3,false,param4);
      }
      
      public static function be_beatBack_toPiexl(param1:SceneCharacter, param2:Point, param3:Number, param4:Function = null) : void
      {
         param1.lineToPiexl(param2,param3,param4);
      }
      
      public static function be_beatBack_curve_toPiexl(param1:SceneCharacter, param2:Point, param3:int, param4:int, param5:Function = null) : void
      {
         param1.curveToPiexl(param2,param3,param4,param5);
      }
      
      public static function be_fixed(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var _loc3_:BaseCharacter = param1.data as BaseCharacter;
         if(_loc3_ == null)
         {
            return;
         }
         if(param2)
         {
            _loc3_.isFixed = false;
         }
         else
         {
            param1.stopMove();
            _loc3_.isFixed = true;
         }
      }
      
      public static function be_stop(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var _loc3_:BaseCharacter = param1.data as BaseCharacter;
         if(_loc3_ == null)
         {
            return;
         }
         if(param2)
         {
            _loc3_.isStop = false;
         }
         else
         {
            param1.stopMove();
            _loc3_.isStop = true;
         }
      }
      
      public static function be_soft(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var _loc3_:BaseCharacter = param1.data as BaseCharacter;
         if(_loc3_ == null)
         {
            return;
         }
         if(param2)
         {
            _loc3_.isSoft = false;
         }
         else
         {
            _loc3_.isSoft = true;
         }
      }
      
      public static function be_inDrink(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var _loc3_:BaseCharacter = param1.data as BaseCharacter;
         if(_loc3_ == null)
         {
            return;
         }
         if(param2)
         {
            _loc3_.isInDrink = false;
         }
         else
         {
            _loc3_.isInDrink = true;
            if(param1.isMainChar())
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("移动方向混乱中"));
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("移动方向混乱中"));
               if(param1.getStatus() == CharStatusType.WALK && param1.moveData != null && param1.moveData.walk_targetP != null)
               {
                  param1.moveData.walk_targetP = ZMath.getRotPoint(param1.moveData.walk_targetP,new Point(param1.tile_x,param1.tile_y),180);
                  param1.reviseTileXY(param1.tile_x,param1.tile_y);
               }
            }
         }
      }
      
      public static function be_sleep(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var _loc3_:BaseCharacter = param1.data as BaseCharacter;
         if(_loc3_ == null)
         {
            return;
         }
         if(param2)
         {
            _loc3_.isSleep = false;
         }
         else
         {
            param1.stopMove();
            _loc3_.isSleep = true;
         }
      }
      
      public static function be_blind(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var removeBlind:Function = null;
         var $sc:SceneCharacter = param1;
         var $relieve:Boolean = param2;
         var addBlind:Function = function():void
         {
            var onUpdate:Function;
            var blindBP:BitmapData = null;
            var t:int = 0;
            var t1:int = 0;
            var t2:int = 0;
            if(_blindBP == null)
            {
               blindBP = RslLoaderManager.getInstance("ui.blind",10,10);
               if(blindBP != null)
               {
                  _blindBP = new Bitmap(blindBP,"auto",true);
               }
            }
            if(_blindBP != null)
            {
               onUpdate = function(param1:Number):void
               {
                  if(param1 <= t1)
                  {
                     return;
                  }
                  if(_blindBP != null)
                  {
                     _blindBP.alpha = 1 - (param1 - t1) / t2;
                  }
               };
               if(_blindBP.parent != GameInstance.uiInstance.bloodContainer)
               {
                  _blindBP.x = 0;
                  _blindBP.y = 0;
                  _blindBP.width = GameConfig.sceneWidth;
                  _blindBP.height = GameConfig.sceneHeight;
                  GameInstance.uiInstance.bloodContainer.addChildAt(_blindBP,0);
               }
               _blindBP.alpha = 1;
               if(_blindTD != null)
               {
                  TimerManager.deleteTimer(_blindTD);
                  _blindTD = null;
               }
               t = 30;
               t1 = t * 0.9;
               t2 = t * 0.1;
               _blindTD = TimerManager.createExactTimer(t,0,t,onUpdate,removeBlind);
            }
         };
         removeBlind = function():void
         {
            if(_blindTD != null)
            {
               TimerManager.deleteTimer(_blindTD);
               _blindTD = null;
            }
            if(_blindBP != null && _blindBP.parent != null)
            {
               _blindBP.parent.removeChild(_blindBP);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         if($relieve)
         {
            bc.isBlind = false;
            removeBlind();
         }
         else
         {
            bc.isBlind = true;
            addBlind();
         }
      }
      
      public static function be_ZiJinHuLu(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var removeBlind:Function = null;
         var $sc:SceneCharacter = param1;
         var $relieve:Boolean = param2;
         var addBlind:Function = function():void
         {
            var onUpdate:Function;
            var blindBP:BitmapData = null;
            var t:int = 0;
            var t1:int = 0;
            var t2:int = 0;
            if(_zijinhuluBP == null)
            {
               blindBP = RslLoaderManager.getInstance("ui.blind",10,10);
               if(blindBP != null)
               {
                  _zijinhuluBP = new Bitmap(blindBP,"auto",true);
               }
            }
            if(_zijinhuluBP != null)
            {
               onUpdate = function(param1:Number):void
               {
                  if(param1 <= t1)
                  {
                     return;
                  }
                  if(_zijinhuluBP != null)
                  {
                     _zijinhuluBP.alpha = 1 - (param1 - t1) / t2;
                  }
               };
               if(_zijinhuluBP.parent != GameInstance.uiInstance.bloodContainer)
               {
                  _zijinhuluBP.x = -500;
                  _zijinhuluBP.y = -500;
                  _zijinhuluBP.width = GameConfig.sceneWidth + 1000;
                  _zijinhuluBP.height = GameConfig.sceneHeight + 1000;
                  GameInstance.uiInstance.bloodContainer.addChildAt(_zijinhuluBP,0);
               }
               _zijinhuluBP.alpha = 1;
               if(_zijinhuluTD != null)
               {
                  TimerManager.deleteTimer(_zijinhuluTD);
                  _zijinhuluTD = null;
               }
               t = 30;
               t1 = t * 0.9;
               t2 = t * 0.1;
               _zijinhuluTD = TimerManager.createExactTimer(t,0,t,onUpdate,removeBlind);
            }
         };
         removeBlind = function():void
         {
            if(_zijinhuluTD != null)
            {
               TimerManager.deleteTimer(_zijinhuluTD);
               _zijinhuluTD = null;
            }
            if(_zijinhuluBP != null && _zijinhuluBP.parent != null)
            {
               _zijinhuluBP.parent.removeChild(_zijinhuluBP);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         if($relieve)
         {
            bc.isBlind = false;
            removeBlind();
         }
         else
         {
            bc.isBlind = true;
            addBlind();
         }
      }
      
      public static function be_qlblind(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var removeQlBlind:Function = null;
         var $sc:SceneCharacter = param1;
         var $relieve:Boolean = param2;
         var addQlBlind:Function = function():void
         {
            var onUpdateBlind:Function;
            var qlblindBP:BitmapData = null;
            var t:int = 0;
            var t1:int = 0;
            var t2:int = 0;
            if(_qlblindBP == null)
            {
               qlblindBP = RslLoaderManager.getInstance("ui.qinglongmo",10,10);
               if(qlblindBP != null)
               {
                  _qlblindBP = new Bitmap(qlblindBP,"auto",true);
               }
            }
            if(_qlblindBP != null)
            {
               onUpdateBlind = function(param1:Number):void
               {
                  if(param1 <= t1)
                  {
                     return;
                  }
                  if(_qlblindBP != null)
                  {
                     _qlblindBP.alpha = 1 - (param1 - t1) / t2;
                  }
               };
               if(_qlblindBP.parent != GameInstance.uiInstance.bloodContainer)
               {
                  _qlblindBP.x = 0;
                  _qlblindBP.y = 0;
                  _qlblindBP.width = GameConfig.sceneWidth;
                  _qlblindBP.height = GameConfig.sceneHeight;
                  GameInstance.uiInstance.bloodContainer.addChildAt(_qlblindBP,0);
               }
               _qlblindBP.alpha = 1;
               if(_qlblindTD != null)
               {
                  TimerManager.deleteTimer(_qlblindTD);
                  _qlblindTD = null;
               }
               t = 30;
               t1 = t * 0.9;
               t2 = t * 0.1;
               _qlblindTD = TimerManager.createExactTimer(t,0,t,onUpdateBlind,removeQlBlind);
            }
         };
         removeQlBlind = function():void
         {
            if(_qlblindTD != null)
            {
               TimerManager.deleteTimer(_qlblindTD);
               _qlblindTD = null;
            }
            if(_qlblindBP != null && _qlblindBP.parent != null)
            {
               _qlblindBP.parent.removeChild(_qlblindBP);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         if($relieve)
         {
            bc.isBlind = false;
            removeQlBlind();
         }
         else
         {
            bc.isBlind = true;
            addQlBlind();
         }
      }
      
      public static function be_darken(param1:SceneCharacter, param2:Boolean = false, param3:String = "ui.yellow") : void
      {
         var $sc:SceneCharacter = param1;
         var $relieve:Boolean = param2;
         var $bmdClass:String = param3;
         var addDarken:Function = function():void
         {
            var _loc1_:BitmapData = null;
            if($bmdClass == null)
            {
               return;
            }
            if(_darkenBP == null)
            {
               _loc1_ = RslLoaderManager.getInstance($bmdClass,10,10);
               if(_loc1_ != null)
               {
                  _darkenBP = new Bitmap(_loc1_,"auto",true);
               }
            }
            if(_darkenBP != null)
            {
               if(_darkenBP.parent != GameInstance.uiInstance.bloodContainer)
               {
                  _darkenBP.x = 0;
                  _darkenBP.y = 0;
                  _darkenBP.width = GameConfig.sceneWidth;
                  _darkenBP.height = GameConfig.sceneHeight;
                  GameInstance.uiInstance.bloodContainer.addChildAt(_darkenBP,0);
               }
               _darkenBP.alpha = 1;
            }
         };
         var removeDarken:Function = function():void
         {
            if(_darkenBP != null && _darkenBP.parent != null)
            {
               _darkenBP.parent.removeChild(_darkenBP);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         if($relieve)
         {
            bc.isDarken = false;
            removeDarken();
         }
         else
         {
            bc.isDarken = true;
            addDarken();
         }
      }
      
      public static function be_blackWhite(param1:SceneCharacter, param2:Boolean = false, param3:String = "ui.yellow", param4:Boolean = false) : void
      {
         var play2:Function = null;
         var removeDarken:Function = null;
         var $sc:SceneCharacter = param1;
         var $relieve:Boolean = param2;
         var $bmdClass:String = param3;
         var isXidushidai:Boolean = param4;
         var addDarken:Function = function():void
         {
            var _loc1_:Array = null;
            if(_darkenSpr == null)
            {
               _loc1_ = [new ColorMatrixFilter([0.3086,0.6094,0.082,0,-50,0.3086,0.6094,0.082,0,-50,0.3086,0.6094,0.082,0,-50,0,0,0,1,0])];
               _darkenSpr = new Sprite();
               _darkenSpr.graphics.clear();
               if(isXidushidai)
               {
                  _darkenSpr.graphics.beginFill(0,1);
               }
               else
               {
                  _darkenSpr.graphics.beginFill(6052956,0.5);
               }
               _darkenSpr.graphics.drawRect(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
               _darkenSpr.filters = _loc1_;
            }
            if(_darkenSpr != null)
            {
               if(_darkenSpr.parent != GameInstance.uiInstance.bloodContainer)
               {
                  _darkenSpr.x = 0;
                  _darkenSpr.y = 0;
                  GameInstance.uiInstance.bloodContainer.addChildAt(_darkenSpr,0);
               }
               _darkenSpr.alpha = 0;
               if(isXidushidai)
               {
                  TweenLite.to(_darkenSpr,5,{
                     "alpha":1,
                     "onComplete":play2
                  });
               }
               else
               {
                  TweenLite.to(_darkenSpr,2,{
                     "alpha":1,
                     "onComplete":play2
                  });
               }
            }
         };
         play2 = function():void
         {
            if(isXidushidai)
            {
               TweenLite.to(_darkenSpr,5,{
                  "alpha":0,
                  "onComplete":removeDarken
               });
            }
            else
            {
               TweenLite.to(_darkenSpr,2,{
                  "alpha":0,
                  "onComplete":removeDarken
               });
            }
         };
         removeDarken = function():void
         {
            if(_darkenSpr != null && _darkenSpr.parent != null)
            {
               _darkenSpr.parent.removeChild(_darkenSpr);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         if($relieve)
         {
            removeDarken();
         }
         else
         {
            addDarken();
         }
      }
      
      public static function be_jiuYinShenZhua(param1:SceneCharacter, param2:int, param3:Boolean = false) : void
      {
         var loadUrl:String = null;
         var removeShenzhuaSWF:Function = null;
         var $sc:SceneCharacter = param1;
         var $time:int = param2;
         var $relieve:Boolean = param3;
         var addShenzhuSWF:Function = function():void
         {
            var loadComplete:Function;
            if(_shenzhuaMC)
            {
               showSwf();
            }
            else
            {
               loadComplete = function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl)
                  {
                     return;
                  }
                  _shenzhuaMC = _loc2_.content as MovieClip;
                  showSwf();
               };
               LoaderManager.lazyLoad(loadComplete,null,false,loadUrl);
            }
         };
         var showSwf:Function = function():void
         {
            if(Boolean(_shenzhuaMC) && Boolean(_shenzhuaMC.parent != null) && _shenzhuaMC.parent == GameInstance.uiInstance.bloodContainer)
            {
               _shenzhuaMC.stop();
               _shenzhuaMC.parent.removeChild(_shenzhuaMC);
            }
            if(_shenzhuaMC)
            {
               _shenzhuaMC.x = (GameConfig.sceneWidth - 500) * 0.5;
               _shenzhuaMC.y = (GameConfig.sceneHeight - 350) * 0.5;
               _shenzhuaMC.type = OtherConst.JIUYINSHENZHUA_TYPE;
               GameInstance.uiInstance.bloodContainer.addChild(_shenzhuaMC);
               _shenzhuaMC.gotoAndPlay(1);
               initTimer();
            }
         };
         var initTimer:Function = function():void
         {
            var t:Number;
            var t1:Number = NaN;
            var t2:Number = NaN;
            var onUpdate:Function = null;
            onUpdate = function(param1:Number):void
            {
               if(param1 <= t1)
               {
                  return;
               }
               if(_shenzhuaMC != null)
               {
                  _shenzhuaMC.alpha = 1 - (param1 - t1) / t2;
               }
            };
            if(_shenzhuaTD != null)
            {
               TimerManager.deleteTimer(_shenzhuaTD);
               _shenzhuaTD = null;
            }
            t = $time * 0.001;
            t1 = t * 0.9;
            t2 = t * 0.1;
            _shenzhuaTD = TimerManager.createExactTimer(t,0,t,onUpdate,removeShenzhuaSWF);
         };
         removeShenzhuaSWF = function():void
         {
            if(_shenzhuaTD != null)
            {
               TimerManager.deleteTimer(_shenzhuaTD);
               _shenzhuaTD = null;
            }
            if(_shenzhuaMC != null && _shenzhuaMC.parent != null)
            {
               _shenzhuaMC.gotoAndStop(1);
               _shenzhuaMC.alpha = 1;
               _shenzhuaMC.parent.removeChild(_shenzhuaMC);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/jiuyinzhenjing/shenzhua.swf";
         if($relieve)
         {
            bc.isJiuyinshenzhua = false;
            removeShenzhuaSWF();
         }
         else
         {
            bc.isJiuyinshenzhua = true;
            addShenzhuSWF();
         }
      }
      
      public static function isMainCharCanMove() : Boolean
      {
         if(GameInstance.mainChar.getStatus() != CharStatusType.DEATH && !GameInstance.mainCharData.attributeInfo.isDeath() && !(GameInstance.mainCharData as Player).isFixed && !(GameInstance.mainCharData as Player).isSleep)
         {
            return true;
         }
         return false;
      }
      
      public static function isMainCharCanHit() : Boolean
      {
         if(GameInstance.mainChar.getStatus() != CharStatusType.DEATH && !GameInstance.mainCharData.attributeInfo.isDeath() && !(GameInstance.mainCharData as Player).isFixed && !(GameInstance.mainCharData as Player).isSleep)
         {
            return true;
         }
         return false;
      }
      
      public static function screen_shake(param1:Number = 0.4, param2:Number = 50, param3:Function = null) : void
      {
         var originalX:Number;
         var dobj:DisplayObject = null;
         var originalY:Number = NaN;
         var onUpdate:Function = null;
         var onComplete:Function = null;
         var $time:Number = param1;
         var $intensity:Number = param2;
         var compelte:Function = param3;
         onUpdate = function(param1:Number):void
         {
            dobj.y = originalY + (Math.random() - 0.5) * $intensity;
         };
         onComplete = function():void
         {
            dobj.y = originalY;
            _screenShaking = false;
            if(compelte != null)
            {
               compelte.apply();
            }
         };
         if(!enableScreenShake)
         {
            return;
         }
         if(_screenShaking)
         {
            return;
         }
         _screenShaking = true;
         dobj = GameInstance.app.sceneContainer;
         originalX = dobj.x;
         originalY = dobj.y;
         TimerManager.createOneOffExactTimer($time,0,1,onUpdate,onComplete);
      }
      
      public static function checkAutoAttack() : void
      {
         var lockOnChar:SceneCharacter = null;
         lockOnChar = GameInstance.lockOnChar;
         if((KeyboardManager.shift_down || KeyboardManager.ctrl_down) && GameInstance.lockOnChar != null && (lockOnChar.type == SceneCharacterType.PLAYER || lockOnChar.type == SceneCharacterType.MONSTER))
         {
            clearAutoAttack();
            autoAttackTimerData = TimerManager.createTimer(500,1,function():void
            {
               clearAutoAttack();
               if(lockOnChar == GameInstance.lockOnChar && lockOnChar.usable)
               {
                  PipeManager.sendMsg(PipeConstants.HIT_CHAR,[GameInstance.lockOnChar,true,true]);
               }
            });
         }
      }
      
      public static function clearAutoAttack() : void
      {
         if(autoAttackTimerData != null)
         {
            TimerManager.deleteTimer(autoAttackTimerData);
            autoAttackTimerData = null;
         }
      }
      
      public static function be_miwu(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var removemiwu:Function = null;
         var $sc:SceneCharacter = param1;
         var $relieve:Boolean = param2;
         var addmiwu:Function = function():void
         {
            var onUpdateBlind:Function;
            var miwuBP:BitmapData = null;
            var t:int = 0;
            var t1:int = 0;
            var t2:int = 0;
            if(_miwuBP == null)
            {
               miwuBP = RslLoaderManager.getInstance("ui.miwu",10,10);
               if(miwuBP != null)
               {
                  _miwuBP = new Bitmap(miwuBP,"auto",true);
               }
            }
            if(_miwuBP != null)
            {
               onUpdateBlind = function(param1:Number):void
               {
                  if(param1 <= t1)
                  {
                     return;
                  }
                  if(_miwuBP != null)
                  {
                     _miwuBP.alpha = 1 - (param1 - t1) / t2;
                  }
               };
               if(_miwuBP.parent != GameInstance.uiInstance.bloodContainer)
               {
                  _miwuBP.x = 0;
                  _miwuBP.y = 0;
                  _miwuBP.width = GameConfig.sceneWidth;
                  _miwuBP.height = GameConfig.sceneHeight;
                  GameInstance.uiInstance.bloodContainer.addChildAt(_miwuBP,0);
               }
               _miwuBP.alpha = 1;
               if(_miwuTD != null)
               {
                  TimerManager.deleteTimer(_miwuTD);
                  _miwuTD = null;
               }
               t = 30;
               t1 = t * 0.9;
               t2 = t * 0.1;
               _miwuTD = TimerManager.createExactTimer(t,0,t,onUpdateBlind,removemiwu);
            }
         };
         removemiwu = function():void
         {
            if(_miwuTD != null)
            {
               TimerManager.deleteTimer(_miwuTD);
               _miwuTD = null;
            }
            if(_miwuBP != null && _miwuBP.parent != null)
            {
               _miwuBP.parent.removeChild(_miwuBP);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         if($relieve)
         {
            bc.isBlind = false;
            removemiwu();
         }
         else
         {
            bc.isBlind = true;
            addmiwu();
         }
      }
      
      public static function be_xueDao(param1:SceneCharacter, param2:int, param3:Boolean = false) : void
      {
         var loadUrl:String = null;
         var removeXueDaoSWF:Function = null;
         var $sc:SceneCharacter = param1;
         var $time:int = param2;
         var $relieve:Boolean = param3;
         var addXueDaoSWF:Function = function():void
         {
            var loadComplete:Function;
            if(_xueDaoMC)
            {
               showSwf();
            }
            else
            {
               loadComplete = function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl)
                  {
                     return;
                  }
                  _xueDaoMC = _loc2_.content as MovieClip;
                  showSwf();
               };
               LoaderManager.lazyLoad(loadComplete,null,false,loadUrl);
            }
         };
         var showSwf:Function = function():void
         {
            if(Boolean(_xueDaoMC) && Boolean(_xueDaoMC.parent != null) && _xueDaoMC.parent == GameInstance.uiInstance.bloodContainer)
            {
               _xueDaoMC.stop();
               _xueDaoMC.parent.removeChild(_xueDaoMC);
            }
            if(_xueDaoMC)
            {
               _xueDaoMC.x = (GameConfig.sceneWidth - 750) * 0.5;
               _xueDaoMC.y = (GameConfig.sceneHeight - 750) * 0.5;
               _xueDaoMC.type = OtherConst.XUEDAO_MC_TYPE;
               GameInstance.uiInstance.bloodContainer.addChild(_xueDaoMC);
               _xueDaoMC.gotoAndPlay(1);
               initTimer();
            }
         };
         var initTimer:Function = function():void
         {
            var t:Number;
            var t1:Number = NaN;
            var t2:Number = NaN;
            var onUpdate:Function = null;
            onUpdate = function(param1:Number):void
            {
               if(param1 <= t1)
               {
                  return;
               }
               if(_xueDaoMC != null)
               {
                  _xueDaoMC.alpha = 1 - (param1 - t1) / t2;
               }
            };
            if(_xueDaoTD != null)
            {
               TimerManager.deleteTimer(_xueDaoTD);
               _xueDaoTD = null;
            }
            t = $time * 0.001;
            t1 = t * 0.9;
            t2 = t * 0.1;
            _xueDaoTD = TimerManager.createExactTimer(t,0,t,onUpdate,removeXueDaoSWF);
         };
         removeXueDaoSWF = function():void
         {
            if(_xueDaoTD != null)
            {
               TimerManager.deleteTimer(_xueDaoTD);
               _xueDaoTD = null;
            }
            if(_xueDaoMC != null && _xueDaoMC.parent != null)
            {
               _xueDaoMC.gotoAndStop(1);
               _xueDaoMC.alpha = 1;
               _xueDaoMC.parent.removeChild(_xueDaoMC);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/texiao/xuedao.swf";
         if($relieve)
         {
            bc.isXueDao = false;
            removeXueDaoSWF();
         }
         else
         {
            bc.isXueDao = true;
            addXueDaoSWF();
         }
      }
      
      public static function be_ZiQi(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var removeZiQi:Function = null;
         var $sc:SceneCharacter = param1;
         var $relieve:Boolean = param2;
         var addZiQi:Function = function():void
         {
            var onUpdateBlind:Function;
            var ziQiBP:BitmapData = null;
            var t:int = 0;
            var t1:int = 0;
            var t2:int = 0;
            if(_ziQiBP == null)
            {
               ziQiBP = RslLoaderManager.getInstance("ui.ziqi",10,10);
               if(ziQiBP != null)
               {
                  _ziQiBP = new Bitmap(ziQiBP,"auto",true);
               }
            }
            if(_ziQiBP != null)
            {
               onUpdateBlind = function(param1:Number):void
               {
                  if(param1 <= t1)
                  {
                     return;
                  }
                  if(_ziQiBP != null)
                  {
                     _ziQiBP.alpha = 1 - (param1 - t1) / t2;
                  }
               };
               if(_ziQiBP.parent != GameInstance.uiInstance.bloodContainer)
               {
                  _ziQiBP.x = 0;
                  _ziQiBP.y = 0;
                  _ziQiBP.width = GameConfig.sceneWidth;
                  _ziQiBP.height = GameConfig.sceneHeight;
                  GameInstance.uiInstance.bloodContainer.addChildAt(_ziQiBP,0);
               }
               _ziQiBP.alpha = 1;
               if(_ziQiTD != null)
               {
                  TimerManager.deleteTimer(_ziQiTD);
                  _ziQiTD = null;
               }
               t = 30;
               t1 = t * 0.9;
               t2 = t * 0.1;
               _ziQiTD = TimerManager.createExactTimer(t,0,t,onUpdateBlind,removeZiQi);
            }
         };
         removeZiQi = function():void
         {
            if(_ziQiTD != null)
            {
               TimerManager.deleteTimer(_ziQiTD);
               _ziQiTD = null;
            }
            if(_ziQiBP != null && _ziQiBP.parent != null)
            {
               _ziQiBP.parent.removeChild(_ziQiBP);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         if($relieve)
         {
            removeZiQi();
         }
         else
         {
            addZiQi();
         }
      }
      
      public static function be_Muzhiren(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var removeQlBlind:Function = null;
         var $sc:SceneCharacter = param1;
         var $relieve:Boolean = param2;
         var addQlBlind:Function = function():void
         {
            var onUpdateBlind:Function;
            var lvblindBP:BitmapData = null;
            var t:int = 0;
            var t1:int = 0;
            var t2:int = 0;
            if(_lvblindBP == null)
            {
               lvblindBP = RslLoaderManager.getInstance("ui.lv",10,10);
               if(lvblindBP != null)
               {
                  _lvblindBP = new Bitmap(lvblindBP,"auto",true);
               }
            }
            if(_lvblindBP != null)
            {
               onUpdateBlind = function(param1:Number):void
               {
                  if(param1 <= t1)
                  {
                     return;
                  }
                  if(_lvblindBP != null)
                  {
                     _lvblindBP.alpha = 1 - (param1 - t1) / t2;
                  }
               };
               if(_lvblindBP.parent != GameInstance.uiInstance.bloodContainer)
               {
                  _lvblindBP.x = 0;
                  _lvblindBP.y = 0;
                  _lvblindBP.width = GameConfig.sceneWidth;
                  _lvblindBP.height = GameConfig.sceneHeight;
                  GameInstance.uiInstance.bloodContainer.addChildAt(_lvblindBP,0);
               }
               _lvblindBP.alpha = 1;
               if(_lvblindTD != null)
               {
                  TimerManager.deleteTimer(_lvblindTD);
                  _lvblindTD = null;
               }
               t = 30;
               t1 = t * 0.9;
               t2 = t * 0.1;
               _lvblindTD = TimerManager.createExactTimer(t,0,t,onUpdateBlind,removeQlBlind);
            }
         };
         removeQlBlind = function():void
         {
            if(_lvblindTD != null)
            {
               TimerManager.deleteTimer(_lvblindTD);
               _lvblindTD = null;
            }
            if(_lvblindBP != null && _lvblindBP.parent != null)
            {
               _lvblindBP.parent.removeChild(_lvblindBP);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         if($relieve)
         {
            bc.isBlind = false;
            removeQlBlind();
         }
         else
         {
            bc.isBlind = true;
            addQlBlind();
         }
      }
      
      public static function be_duoMingShiSanJian(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var loadUrl:String = null;
         var onTime:Function = null;
         var $sc:SceneCharacter = param1;
         var $relieve:Boolean = param2;
         var addShisanjianSWF:Function = function():void
         {
            var loadComplete:Function;
            if(_shisanjianMC)
            {
               showSwf();
            }
            else
            {
               loadComplete = function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl)
                  {
                     return;
                  }
                  _shisanjianMC = _loc2_.content as MovieClip;
                  showSwf();
               };
               LoaderManager.lazyLoad(loadComplete,null,false,loadUrl);
            }
         };
         var showSwf:Function = function():void
         {
            if(Boolean(_shisanjianMC) && Boolean(_shisanjianMC.parent != null) && _shisanjianMC.parent == GameInstance.uiInstance.bloodContainer)
            {
               _shisanjianMC.stop();
               _shisanjianMC.parent.removeChild(_shisanjianMC);
            }
            if(_shisanjianMC)
            {
               _shisanjianMC.x = (GameConfig.sceneWidth - 750) * 0.5;
               _shisanjianMC.y = (GameConfig.sceneHeight - 750) * 0.5;
               _shisanjianMC.type = OtherConst.DUOMINGSHISANJIAN_MC_TYPE;
               GameInstance.uiInstance.bloodContainer.addChild(_shisanjianMC);
               _shisanjianMC.gotoAndPlay(1);
               _shisanjianMC.addEventListener(Event.ENTER_FRAME,onTime);
            }
         };
         onTime = function(param1:Event):void
         {
            if(param1.target.currentFrame == param1.target.totalFrames)
            {
               FightManager.screen_shake(0.8,100);
               removeShisanjianSWF();
            }
         };
         var removeShisanjianSWF:Function = function():void
         {
            if(_shisanjianMC != null && _shisanjianMC.parent != null)
            {
               _shisanjianMC.gotoAndStop(1);
               _shisanjianMC.alpha = 1;
               _shisanjianMC.parent.removeChild(_shisanjianMC);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/duomingshisanjian/kandao.swf";
         if($relieve)
         {
            bc.isDuoMingShiSanJian = false;
            removeShisanjianSWF();
         }
         else
         {
            bc.isDuoMingShiSanJian = true;
            addShisanjianSWF();
         }
      }
      
      public static function be_xiangLongAoYi(param1:SceneCharacter, param2:Boolean = false) : void
      {
         var loadUrl:String = null;
         var onTime:Function = null;
         var $sc:SceneCharacter = param1;
         var $relieve:Boolean = param2;
         var addXiangLongAoYiSWF:Function = function():void
         {
            var loadComplete:Function;
            if(_xiaglongaoyiMC)
            {
               showSwf();
            }
            else
            {
               loadComplete = function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  if(_loc2_.url.url != loadUrl)
                  {
                     return;
                  }
                  _xiaglongaoyiMC = _loc2_.content as MovieClip;
                  showSwf();
               };
               LoaderManager.lazyLoad(loadComplete,null,false,loadUrl);
            }
         };
         var showSwf:Function = function():void
         {
            if(Boolean(_xiaglongaoyiMC) && Boolean(_xiaglongaoyiMC.parent != null) && _xiaglongaoyiMC.parent == GameInstance.uiInstance.bloodContainer)
            {
               _xiaglongaoyiMC.stop();
               _xiaglongaoyiMC.parent.removeChild(_xiaglongaoyiMC);
            }
            if(_xiaglongaoyiMC)
            {
               _xiaglongaoyiMC.x = (GameConfig.sceneWidth - 750) * 0.5;
               _xiaglongaoyiMC.y = (GameConfig.sceneHeight - 750) * 0.5;
               _xiaglongaoyiMC.type = OtherConst.DUOMINGSHISANJIAN_MC_TYPE;
               GameInstance.uiInstance.bloodContainer.addChild(_xiaglongaoyiMC);
               _xiaglongaoyiMC.gotoAndPlay(1);
               _xiaglongaoyiMC.addEventListener(Event.ENTER_FRAME,onTime);
            }
         };
         onTime = function(param1:Event):void
         {
            if(param1.target.currentFrame == param1.target.totalFrames)
            {
               FightManager.screen_shake(0.8,100);
               removeXiangLongAoYiSWF();
            }
         };
         var removeXiangLongAoYiSWF:Function = function():void
         {
            if(_xiaglongaoyiMC != null && _xiaglongaoyiMC.parent != null)
            {
               _xiaglongaoyiMC.gotoAndStop(1);
               _xiaglongaoyiMC.alpha = 1;
               _xiaglongaoyiMC.parent.removeChild(_xiaglongaoyiMC);
            }
         };
         var bc:BaseCharacter = $sc.data as BaseCharacter;
         if(bc == null)
         {
            return;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/texiao/xianglongaoyi.swf";
         if($relieve)
         {
            bc.isXiangLongAoYi = false;
            removeXiangLongAoYiSWF();
         }
         else
         {
            bc.isXiangLongAoYi = true;
            addXiangLongAoYiSWF();
         }
      }
   }
}

