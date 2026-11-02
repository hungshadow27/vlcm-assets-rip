package com.tgame.shell.view.components.attribute
{
   import flash.display.DisplayObject;
   
   public class DataObject
   {
      
      public var neirong:DisplayObject;
      
      public var biaoqian:DisplayObject;
      
      public var name:String;
      
      public var isShow:Boolean;
      
      public var dengji:int;
      
      public function DataObject(param1:DisplayObject, param2:DisplayObject, param3:String, param4:Boolean = true, param5:int = -1)
      {
         super();
         this.neirong = param1;
         this.biaoqian = param2;
         this.name = param3;
         this.isShow = param4;
         this.dengji = param5;
      }
   }
}

