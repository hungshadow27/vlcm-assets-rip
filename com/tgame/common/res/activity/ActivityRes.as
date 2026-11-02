package com.tgame.common.res.activity
{
   public class ActivityRes
   {
      
      private var _acceptNpc:int;
      
      public var id:int;
      
      public var name:String;
      
      public var des:String;
      
      public var fromTime:String;
      
      public var toTime:String;
      
      public var beginNpc:int;
      
      public var minLevel:int;
      
      public var minTeamPlayerNum:int;
      
      public var prizeAttr:String;
      
      public var prizeArr:Array;
      
      public function ActivityRes()
      {
         super();
         this.fromTime = "";
         this.toTime = "";
         this.beginNpc = 0;
         this.minLevel = 0;
         this.minTeamPlayerNum = 0;
         this.prizeAttr = "";
         this.prizeArr = [];
      }
      
      public function get acceptNpc() : int
      {
         if(this._acceptNpc == 0)
         {
            this._acceptNpc = this.beginNpc;
         }
         return this._acceptNpc;
      }
   }
}

