package com.zcp.common.sound
{
   import com.zcp.common.sound.vo.SoundData;
   import com.zcp.manager.RslLoaderManager;
   import com.zcp.manager.SoundManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.media.*;
   import flash.net.URLRequest;
   
   public class SoundThread
   {
      
      private var _soundArr:Array = [];
      
      private var _mute:Boolean = false;
      
      private var _pause:Boolean = false;
      
      private var _volume:Number = 1;
      
      public function SoundThread()
      {
         super();
      }
      
      public function getSoundsNum() : int
      {
         return this._soundArr.length;
      }
      
      public function getVolume() : Number
      {
         return this._volume;
      }
      
      public function setVolume(param1:Number) : void
      {
         var _loc2_:SoundData = null;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(this._volume != param1)
         {
            this._volume = param1;
            for each(_loc2_ in this._soundArr)
            {
               _loc2_.setVolume(this._volume);
            }
         }
      }
      
      public function getMute() : Boolean
      {
         return this._mute;
      }
      
      public function setMute(param1:Boolean) : void
      {
         var _loc2_:SoundData = null;
         if(this._mute != param1)
         {
            this._mute = param1;
            for each(_loc2_ in this._soundArr)
            {
               _loc2_.setMute(this._mute);
            }
         }
      }
      
      public function getPause() : Boolean
      {
         return this._pause;
      }
      
      public function setPause(param1:Boolean) : void
      {
         var _loc2_:SoundData = null;
         if(this._pause != param1)
         {
            this._pause = param1;
            for each(_loc2_ in this._soundArr)
            {
               _loc2_.setPause(this._pause);
            }
         }
      }
      
      public function hasSound(param1:SoundData) : Boolean
      {
         return this._soundArr.indexOf(param1) != -1;
      }
      
      public function removeSound(param1:SoundData) : void
      {
         var _loc2_:SoundData = null;
         for each(_loc2_ in this._soundArr)
         {
            if(_loc2_ == param1)
            {
               _loc2_.removeEventListener(SoundData.LOOP_COMPLETE,this.soundLoopCompleteHandler);
               _loc2_.stopAndDispose();
               this._soundArr.splice(this._soundArr.indexOf(_loc2_),1);
               break;
            }
         }
      }
      
      public function removeAllSounds() : void
      {
         var _loc1_:SoundData = null;
         for each(_loc1_ in this._soundArr)
         {
            _loc1_.removeEventListener(SoundData.LOOP_COMPLETE,this.soundLoopCompleteHandler);
            _loc1_.stopAndDispose();
         }
         this._soundArr = [];
      }
      
      public function playSound(param1:String, param2:Number = 0, param3:int = 0, param4:Number = -1) : SoundData
      {
         var sd:SoundData = null;
         var sound:Sound = null;
         var re1:RegExp = null;
         var re2:RegExp = null;
         var str1True:Boolean = false;
         var str2True:Boolean = false;
         var selfVolume:Number = NaN;
         var nowSoundTransform:SoundTransform = null;
         var channel:SoundChannel = null;
         var $sound:String = param1;
         var $startTime:Number = param2;
         var $loops:int = param3;
         var $selfVolume:Number = param4;
         if(SoundManager.soundCache.has($sound))
         {
            sound = SoundManager.soundCache.get($sound) as Sound;
         }
         else
         {
            sound = RslLoaderManager.getInstance($sound) as Sound;
            if(sound)
            {
               SoundManager.soundCache.push(sound,$sound);
            }
            else
            {
               $sound = $sound.toLowerCase();
               re1 = /^.+.mp3$/;
               re2 = /^.+.wmv$/;
               str1True = re1.test($sound);
               str2True = re2.test($sound);
               if(str1True || str2True)
               {
                  sound = new Sound();
                  sound.addEventListener(Event.COMPLETE,this.soundLoadHandler);
                  sound.addEventListener(IOErrorEvent.IO_ERROR,this.soundLoadHandler);
                  sound.load(new URLRequest($sound));
               }
            }
         }
         if(sound == null)
         {
            return sd;
         }
         try
         {
            selfVolume = $selfVolume >= 0 && $selfVolume <= 1 ? $selfVolume : this._volume;
            nowSoundTransform = new SoundTransform(selfVolume);
            channel = sound.play($startTime,0,nowSoundTransform);
            if(channel != null)
            {
               sd = new SoundData(sound,channel,$loops - 1);
               sd.addEventListener(SoundData.LOOP_COMPLETE,this.soundLoopCompleteHandler);
               this._soundArr.push(sd);
               if(this._mute)
               {
                  sd.setMute(true);
               }
               if(this._mute)
               {
                  sd.setPause(true);
               }
            }
         }
         catch(e:Error)
         {
         }
         return sd;
      }
      
      private function soundLoadHandler(param1:*) : void
      {
         var _loc3_:SoundData = null;
         var _loc2_:Sound = param1.currentTarget;
         switch(param1.type)
         {
            case Event.COMPLETE:
               SoundManager.soundCache.push(_loc2_,_loc2_.url);
               break;
            case IOErrorEvent.IO_ERROR:
               for each(_loc3_ in this._soundArr)
               {
                  if(_loc3_.sound == _loc2_)
                  {
                     _loc3_.removeEventListener(SoundData.LOOP_COMPLETE,this.soundLoopCompleteHandler);
                     _loc3_.stopAndDispose();
                     this._soundArr.splice(this._soundArr.indexOf(_loc3_),1);
                  }
               }
         }
      }
      
      private function soundLoopCompleteHandler(param1:Event) : void
      {
         var _loc3_:SoundData = null;
         var _loc2_:SoundData = param1.currentTarget as SoundData;
         for each(_loc3_ in this._soundArr)
         {
            if(_loc3_ == _loc2_)
            {
               _loc3_.removeEventListener(SoundData.LOOP_COMPLETE,this.soundLoopCompleteHandler);
               _loc3_.stopAndDispose();
               this._soundArr.splice(this._soundArr.indexOf(_loc3_),1);
               break;
            }
         }
      }
   }
}

