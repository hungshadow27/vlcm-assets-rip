package com.tgame.manager
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.zcp.common.sound.SoundThread;
   import com.zcp.common.sound.vo.SoundData;
   import com.zcp.manager.RslLoaderManager;
   import com.zcp.manager.SoundManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class TSoundManager
   {
      
      private static var _bgSound:SoundData;
      
      private static var _walkSound:SoundData;
      
      private static var _oldIsOnMount:Boolean;
      
      private static var _heartSound:SoundData;
      
      private static var _bloodBP:Bitmap;
      
      private static const MAX_SOUND_DIS:Number = 500;
      
      public static const MAX_HEART_PER:Number = 0.25;
      
      private static var _bgSoundThread:SoundThread = SoundManager.creatNewSoundThread();
      
      private static var _shortSoundThread:SoundThread = SoundManager.creatNewSoundThread();
      
      private static var _panelSoundArr:Array = [];
      
      private static const MAX_SHORT_NUM:int = 32 - 3 - 1;
      
      private static var _isAddListener:Boolean = false;
      
      public function TSoundManager()
      {
         super();
      }
      
      public static function init() : void
      {
         _bgSoundThread.setVolume(0.5);
         _shortSoundThread.setVolume(1);
      }
      
      public static function stopAllSound() : void
      {
         stopBgSound();
         stopWalkSound();
         stopHeartSound();
      }
      
      public static function setBgSoundMute(param1:Boolean) : void
      {
         _bgSoundThread.setMute(param1);
      }
      
      public static function getBgSoundMute() : Boolean
      {
         return _bgSoundThread.getMute();
      }
      
      public static function setShortSoundMute(param1:Boolean) : void
      {
         _shortSoundThread.setMute(param1);
      }
      
      public static function getShortSoundMute() : Boolean
      {
         return _shortSoundThread.getMute();
      }
      
      public static function playBgSound() : void
      {
         var _loc1_:String = null;
         stopBgSound();
         if(GameConfig.wantEnterMapRes.bgSoundID > 0)
         {
            _loc1_ = ResPathManager.getBgSoundPath(GameConfig.wantEnterMapRes.bgSoundID);
            if(_loc1_ != "")
            {
               _bgSound = _bgSoundThread.playSound(_loc1_,0,int.MAX_VALUE);
            }
         }
      }
      
      public static function stopBgSound() : void
      {
         if(_bgSound != null)
         {
            _bgSoundThread.removeSound(_bgSound);
            _bgSound = null;
         }
      }
      
      public static function playDengluSound() : void
      {
         stopBgSound();
         var _loc1_:String = ResPathManager.getBgSoundPath(3319);
         if(_loc1_ != "")
         {
            _bgSound = _bgSoundThread.playSound(_loc1_,0,int.MAX_VALUE);
         }
      }
      
      public static function playShortSound(param1:int) : void
      {
         if(SoundManager.getSoundsNum() >= MAX_SHORT_NUM)
         {
            return;
         }
         var _loc2_:String = ResPathManager.getSoundClassName(param1);
         _shortSoundThread.playSound(_loc2_);
      }
      
      public static function playShortSound_useDis(param1:int, param2:Number = 0) : void
      {
         var _loc5_:Number = NaN;
         if(SoundManager.getSoundsNum() >= MAX_SHORT_NUM)
         {
            return;
         }
         var _loc3_:Number = _shortSoundThread.getVolume();
         if(param2 > 0)
         {
            _loc5_ = Math.max(MAX_SOUND_DIS - param2,0);
            _loc3_ = _loc3_ * _loc5_ / MAX_SOUND_DIS;
         }
         var _loc4_:String = ResPathManager.getSoundClassName(param1);
         _shortSoundThread.playSound(_loc4_,0,0,_loc3_);
      }
      
      public static function playWalkSound(param1:Boolean) : void
      {
         if(_oldIsOnMount == param1)
         {
            if(_walkSound != null)
            {
               return;
            }
         }
         else
         {
            if(_walkSound != null)
            {
               stopWalkSound();
            }
            _oldIsOnMount = param1;
         }
         var _loc2_:int = param1 ? ResPathManager.SOUND_MAINCHAR_WALK_ONMOUNT : ResPathManager.SOUND_MAINCHAR_WALK;
         var _loc3_:String = ResPathManager.getSoundClassName(_loc2_);
         _walkSound = _shortSoundThread.playSound(_loc3_,0,int.MAX_VALUE);
      }
      
      public static function stopWalkSound() : void
      {
         if(_walkSound != null)
         {
            _shortSoundThread.removeSound(_walkSound);
            _walkSound = null;
         }
      }
      
      public static function playHeartSound(param1:Number) : void
      {
         var _loc2_:String = null;
         var _loc3_:BitmapData = null;
         if(isNaN(param1))
         {
            return;
         }
         if(param1 == 0)
         {
            stopHeartSound();
            return;
         }
         if(_heartSound == null)
         {
            _loc2_ = ResPathManager.getSoundClassName(ResPathManager.SOUND_MAINCHAR_HEART);
            _heartSound = _shortSoundThread.playSound(_loc2_,0,int.MAX_VALUE);
         }
         if(_bloodBP == null)
         {
            _loc3_ = RslLoaderManager.getInstance("ui.blood",10,10);
            if(_loc3_ != null)
            {
               _bloodBP = new Bitmap(_loc3_,"auto",true);
            }
         }
         if(_bloodBP != null)
         {
            _bloodBP.alpha = (MAX_HEART_PER - param1) / MAX_HEART_PER + 0.2;
            if(_bloodBP.parent != GameInstance.uiInstance.bloodContainer)
            {
               _bloodBP.x = 0;
               _bloodBP.y = 0;
               _bloodBP.width = GameConfig.sceneWidth;
               _bloodBP.height = GameConfig.sceneHeight;
               GameInstance.uiInstance.bloodContainer.addChild(_bloodBP);
            }
         }
      }
      
      public static function stopHeartSound() : void
      {
         if(_heartSound != null)
         {
            _shortSoundThread.removeSound(_heartSound);
            _heartSound = null;
         }
         if(_bloodBP != null && _bloodBP.parent != null)
         {
            _bloodBP.parent.removeChild(_bloodBP);
         }
      }
      
      public static function addPanelCloseSound(param1:DisplayObject) : void
      {
         if(_panelSoundArr.indexOf(param1) != -1)
         {
            return;
         }
         _panelSoundArr.push(param1);
         if(_isAddListener)
         {
            return;
         }
         param1.addEventListener(Event.REMOVED_FROM_STAGE,removeSound);
         _isAddListener = false;
      }
      
      private static function removeSound(param1:Event) : void
      {
         var _loc2_:DisplayObject = param1.currentTarget as DisplayObject;
         var _loc3_:int = _panelSoundArr.indexOf(_loc2_);
         if(_loc3_ != -1)
         {
            _panelSoundArr.splice(_loc3_,1);
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_CLOSE);
            return;
         }
      }
   }
}

