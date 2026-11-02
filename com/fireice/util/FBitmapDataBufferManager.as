package com.fireice.util
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   
   public class FBitmapDataBufferManager
   {
      
      private static var BDs:Dictionary;
      
      private static var bitmaps:Vector.<Bitmap>;
      
      public function FBitmapDataBufferManager()
      {
         super();
         throw new Error("Tools类不能实例化!");
      }
      
      public static function getBD(param1:String) : BitmapData
      {
         var $class:Class = null;
         var value:String = param1;
         if(!BDs)
         {
            BDs = new Dictionary();
         }
         if(BDs[value] != undefined)
         {
            return BDs[value];
         }
         try
         {
            $class = getDefinitionByName(value) as Class;
            BDs[value] = new $class(10,10) as BitmapData;
         }
         catch(e:Error)
         {
            trace(value + "导出类不存在");
            return null;
         }
         return BDs[value];
      }
      
      public static function delBD(param1:String) : void
      {
         if(BDs[param1] != undefined)
         {
            (BDs[param1] as BitmapData).dispose();
            BDs[param1] = undefined;
            delete BDs[param1];
         }
      }
      
      public static function destory() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in BDs)
         {
            (BDs[_loc1_] as BitmapData).dispose();
            BDs[_loc1_] = undefined;
            delete BDs[_loc1_];
         }
      }
      
      public static function AddDynamicManageImage(param1:Bitmap) : void
      {
         if(param1.name.indexOf("instance") == 0 || param1.name == "" || param1.name == null)
         {
            trace("BitmapdataCachManager：加入位图管理器的位图没有设置类名或者类名设置不正确!");
            return;
         }
         if(!bitmaps)
         {
            bitmaps = new Vector.<Bitmap>();
         }
         bitmaps.push(param1);
         param1.addEventListener(Event.ADDED_TO_STAGE,create);
         param1.addEventListener(Event.REMOVED_FROM_STAGE,dispose);
      }
      
      public static function RemoveDynamicManageImage(param1:Bitmap) : void
      {
         if(bitmaps.indexOf(param1) == -1)
         {
            return;
         }
         bitmaps.splice(bitmaps.indexOf(param1),1);
         param1.removeEventListener(Event.ADDED_TO_STAGE,create);
         param1.removeEventListener(Event.REMOVED_FROM_STAGE,dispose);
      }
      
      private static function dispose(param1:Event) : void
      {
         var _loc2_:Bitmap = param1.target as Bitmap;
         _loc2_.bitmapData.dispose();
         _loc2_.bitmapData = null;
      }
      
      private static function create(param1:Event) : void
      {
         var _loc3_:Class = null;
         var _loc2_:Bitmap = param1.target as Bitmap;
         _loc3_ = getDefinitionByName(_loc2_.name) as Class;
         _loc2_.bitmapData = new _loc3_(5,5) as BitmapData;
      }
   }
}

