package com.zcp.common.sound.vo
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class SoundData extends EventDispatcher
   {
      
      public static const LOOP_COMPLETE:String = "SoundData.LOOP_COMPLETE";
      
      public var sound:Sound;
      
      private var _channel:SoundChannel;
      
      private var _leftLoops:int;
      
      private var _mute:Boolean = false;
      
      private var _pause:Boolean = false;
      
      private var _volume:Number = 1;
      
      public function SoundData(param1:Sound, param2:SoundChannel, param3:int = 0)
      {
         super();
         this.sound = param1;
         this._channel = param2;
         this._leftLoops = param3;
         this._volume = this._channel.soundTransform.volume;
         this._channel.addEventListener(Event.SOUND_COMPLETE,this.soundCompleteHandler);
      }
      
      public function getVolume() : Number
      {
         return this._volume;
      }
      
      public function setVolume(param1:Number) : void
      {
         this._volume = param1;
         this._channel.soundTransform = new SoundTransform(this._volume);
      }
      
      public function getMute() : Boolean
      {
         return this._mute;
      }
      
      public function setMute(param1:Boolean) : void
      {
         this._mute = param1;
         if(this._mute)
         {
            this._channel.soundTransform = new SoundTransform(0);
         }
         else
         {
            this.setVolume(this.getVolume());
         }
      }
      
      public function getPause() : Boolean
      {
         return this._pause;
      }
      
      public function setPause(param1:Boolean) : void
      {
         var _loc2_:Number = NaN;
         this._pause = param1;
         if(this._pause)
         {
            _loc2_ = this._channel.position;
            this._channel.stop();
         }
         else
         {
            this._channel.removeEventListener(Event.SOUND_COMPLETE,this.soundCompleteHandler);
            this._channel = this.sound.play(this._channel.position,0,this._channel.soundTransform);
            this._channel.addEventListener(Event.SOUND_COMPLETE,this.soundCompleteHandler);
         }
      }
      
      private function soundCompleteHandler(param1:Event) : void
      {
         this._channel.removeEventListener(Event.SOUND_COMPLETE,this.soundCompleteHandler);
         if(this._leftLoops > 0)
         {
            --this._leftLoops;
            this._channel = this.sound.play(0,0,this._channel.soundTransform);
            this._channel.addEventListener(Event.SOUND_COMPLETE,this.soundCompleteHandler);
         }
         else
         {
            this.dispatchEvent(new Event(LOOP_COMPLETE));
         }
      }
      
      public function stopAndDispose() : void
      {
         this._channel.removeEventListener(Event.SOUND_COMPLETE,this.soundCompleteHandler);
         this._channel.stop();
         this._leftLoops = 0;
      }
   }
}

