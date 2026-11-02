package com.tgame.common.vo.character.info
{
   import com.tgame.common.res.combo.ComboResManager;
   
   public class ComboInfo
   {
      
      public var currentLianZhanNum:int;
      
      private var _id:int;
      
      public var time:int;
      
      public var lastTime:int;
      
      public var title:String;
      
      public var count:int;
      
      public function ComboInfo()
      {
         super();
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
         var _loc2_:XML = ComboResManager.getComboXML(this._id);
         this.time = Number(_loc2_.@time) * 1000;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function getTime() : int
      {
         return this.time;
      }
   }
}

