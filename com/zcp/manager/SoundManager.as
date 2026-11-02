package com.zcp.manager
{
   import com.zcp.common.cache.Cache;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.sound.SoundThread;
   import com.zcp.common.sound.vo.SoundData;
   import flash.events.Event;
   
   public class SoundManager
   {
      
      public static var soundCache:Cache = CacheManager.creatNewCache("soundCache",50);
      
      private static var _defaultSoundThread:SoundThread = new SoundThread();
      
      private static var _soundThreadArr:Array = [_defaultSoundThread];
      
      public function SoundManager()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function getSoundThreadsNum() : int
      {
         return _soundThreadArr.length;
      }
      
      public static function getSoundsNum() : int
      {
         var _loc2_:SoundThread = null;
         var _loc1_:Number = 0;
         for each(_loc2_ in _soundThreadArr)
         {
            _loc1_ += _loc2_.getSoundsNum();
         }
         return _loc1_;
      }
      
      public static function creatNewSoundThread() : SoundThread
      {
         var _loc1_:SoundThread = _soundThreadArr[_soundThreadArr.length] = new SoundThread();
         ZLog.add("SoundManager.creatNewSoundThread::_soundThreadArr.length:" + getSoundThreadsNum());
         return _loc1_;
      }
      
      public static function playSound(param1:String, param2:Number = 0, param3:int = 0, param4:Number = -1, param5:SoundThread = null) : SoundThread
      {
         var _loc6_:SoundThread = null;
         if(param5 != null)
         {
            _loc6_ = param5;
            if(!hasSoundThread(_loc6_))
            {
               _soundThreadArr.push(_loc6_);
               ZLog.add("SoundManager.playSound::_soundThreadArr.length:" + getSoundThreadsNum());
            }
         }
         else
         {
            _loc6_ = _defaultSoundThread;
         }
         _loc6_.playSound(param1,param2,param3,param4);
         return _loc6_;
      }
      
      public static function setVolume(param1:Number) : void
      {
         var _loc2_:SoundThread = null;
         for each(_loc2_ in _soundThreadArr)
         {
            _loc2_.setVolume(param1);
         }
      }
      
      public static function setMute(param1:Boolean) : void
      {
         var _loc2_:SoundThread = null;
         for each(_loc2_ in _soundThreadArr)
         {
            _loc2_.setMute(param1);
         }
      }
      
      public static function setPause(param1:Boolean) : void
      {
         var _loc2_:SoundThread = null;
         for each(_loc2_ in _soundThreadArr)
         {
            _loc2_.setPause(param1);
         }
      }
      
      public static function getDefaultSoundThread() : SoundThread
      {
         return _defaultSoundThread;
      }
      
      public static function removeAllSoundThreads() : void
      {
         removeAllSounds();
         _soundThreadArr = [];
         ZLog.add("SoundManager.creatNewSoundThread::_soundThreadArr.length:0");
      }
      
      public static function removeAllSounds() : void
      {
         var _loc1_:SoundThread = null;
         for each(_loc1_ in _soundThreadArr)
         {
            _loc1_.removeAllSounds();
         }
      }
      
      public static function removeSoundThread(param1:SoundThread) : void
      {
         var _loc2_:SoundThread = null;
         if(!param1)
         {
            return;
         }
         for each(_loc2_ in _soundThreadArr)
         {
            if(_loc2_ == param1)
            {
               _loc2_.removeAllSounds();
               _soundThreadArr.splice(_soundThreadArr.indexOf(_loc2_),1);
               ZLog.add("SoundManager.creatNewSoundThread::_soundThreadArr.length:" + getSoundThreadsNum());
               break;
            }
         }
      }
      
      public static function removeSound(param1:SoundData) : void
      {
         var _loc2_:SoundThread = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in _soundThreadArr)
         {
            _loc2_.removeSound(param1);
         }
      }
      
      public static function hasSoundThread(param1:SoundThread) : Boolean
      {
         return _soundThreadArr.indexOf(param1) != -1;
      }
      
      public static function hasSound(param1:SoundData) : Boolean
      {
         var _loc2_:SoundThread = null;
         for each(_loc2_ in _soundThreadArr)
         {
            if(_loc2_.hasSound(param1))
            {
               return true;
            }
         }
         return false;
      }
   }
}

