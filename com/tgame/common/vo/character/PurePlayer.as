package com.tgame.common.vo.character
{
   import com.tgame.common.vo.character.info.data.SpouseData;
   
   public class PurePlayer extends Player
   {
      
      public var id:int;
      
      public var name:String;
      
      public var title:String;
      
      public var map:String = "";
      
      public var mx:int;
      
      public var my:int;
      
      public var isSameMap:Boolean;
      
      public var favor:int;
      
      public var hate:int;
      
      public var specialAct:int;
      
      public var lineserver:int = 0;
      
      public var isDeath:Boolean = false;
      
      public var isOnMount:Boolean = false;
      
      private var _spouseData:SpouseData;
      
      public var liantiLevel:int;
      
      public var liantiPercent:int;
      
      public var zhiYe:int = 0;
      
      public function PurePlayer()
      {
         super(null);
      }
      
      public function get spouseData() : SpouseData
      {
         if(this._spouseData == null)
         {
            this._spouseData = new SpouseData();
         }
         return this._spouseData;
      }
   }
}

