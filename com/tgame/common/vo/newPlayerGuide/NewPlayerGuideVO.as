package com.tgame.common.vo.newPlayerGuide
{
   public class NewPlayerGuideVO
   {
      
      private var isComplete:Boolean = false;
      
      private var count:int = 0;
      
      private var id:int = 0;
      
      private var content:String = "";
      
      private var toolTipCloseFun:Function = null;
      
      private var isShowing:Boolean = false;
      
      public function NewPlayerGuideVO(param1:Boolean = false, param2:int = 0, param3:int = 0, param4:String = "")
      {
         super();
         this.count = param2;
         this.isComplete = param1;
         this.id = param3;
         this.content = param4;
      }
      
      public function set setID(param1:int) : void
      {
         this.id = param1;
      }
      
      public function set setCount(param1:int) : void
      {
         this.count = param1;
      }
      
      public function set setIsComplete(param1:Boolean) : void
      {
         this.isComplete = param1;
      }
      
      public function set setContent(param1:String) : void
      {
         this.content = param1;
      }
      
      public function set setIsShowing(param1:Boolean) : void
      {
         this.isShowing = param1;
      }
      
      public function set setToolTipCloseFun(param1:Function) : void
      {
         this.toolTipCloseFun = param1;
      }
      
      public function get getContent() : String
      {
         return this.content;
      }
      
      public function get getID() : int
      {
         return this.id;
      }
      
      public function get getCount() : int
      {
         return this.count;
      }
      
      public function get getIsShowing() : Boolean
      {
         return this.isShowing;
      }
      
      public function get getIsComplete() : Boolean
      {
         return this.isComplete;
      }
      
      public function runToolTipCloseFun() : void
      {
         if(this.toolTipCloseFun != null)
         {
            this.toolTipCloseFun();
            this.toolTipCloseFun = null;
         }
      }
   }
}

