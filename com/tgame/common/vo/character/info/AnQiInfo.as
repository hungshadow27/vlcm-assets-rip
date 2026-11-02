package com.tgame.common.vo.character.info
{
   import com.tgame.common.res.anqi.AnQiRes;
   import com.tgame.common.res.anqi.AnqiResManager;
   
   public class AnQiInfo
   {
      
      public var ap:Number;
      
      public var have:int;
      
      public var anqiID:int = 1;
      
      public var shulian:int;
      
      public var xiulian:int;
      
      public var xiulianMax:int;
      
      public var zhufu:int;
      
      public var isOpen:int;
      
      private var _anqiInfoArray:Array;
      
      public var isActiveAnqi:int;
      
      public var isKf:Boolean;
      
      public var isNowKf:Boolean;
      
      public var skillId:int;
      
      public var tangMenMiJi:Boolean;
      
      public var zhongJiAnqi:Boolean;
      
      public function AnQiInfo()
      {
         super();
      }
      
      public function get anqiInfoArray() : Array
      {
         if(!this._anqiInfoArray)
         {
            this.setAnqiArray();
         }
         return this._anqiInfoArray;
      }
      
      public function setAnqiArray() : void
      {
         this._anqiInfoArray = AnqiResManager.getAnqiArray();
      }
      
      public function getCurrentAnqiRes() : AnQiRes
      {
         return AnqiResManager.getAnQiRes(this.anqiID);
      }
      
      public function getNextAnqiRes() : AnQiRes
      {
         return AnqiResManager.getNextAnqiRes(this.anqiID);
      }
   }
}

