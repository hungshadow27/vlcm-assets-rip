package com.tgame.manager
{
   import com.zcp.common.handler.helper.HandlerHelper;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.utils.Dictionary;
   
   public class UIEventsRegisterManager
   {
      
      private static var _uiRegisterDict:Dictionary = new Dictionary();
      
      private static var _uiRemovedDict:Dictionary = new Dictionary();
      
      public function UIEventsRegisterManager()
      {
         super();
      }
      
      public static function registerUI(param1:DisplayObject, param2:Class) : void
      {
         var $dobj:DisplayObject = param1;
         var $Class:Class = param2;
         $dobj.addEventListener(Event.ADDED_TO_STAGE,function(param1:Event):void
         {
            registerUIEvent($Class);
         },false,int.MAX_VALUE);
         $dobj.addEventListener(Event.REMOVED_FROM_STAGE,function(param1:Event):void
         {
            removedUIEvent($Class);
         },false,-int.MAX_VALUE);
      }
      
      public static function addUIRegisterEvent(param1:Class, param2:Function) : void
      {
         if(_uiRegisterDict[param1] != null)
         {
            _uiRegisterDict[param1].push(param2);
         }
         else
         {
            _uiRegisterDict[param1] = [param2];
         }
      }
      
      public static function addUIRemovedEvent(param1:Class, param2:Function) : void
      {
         if(_uiRemovedDict[param1] != null)
         {
            _uiRemovedDict[param1].push(param2);
         }
         else
         {
            _uiRemovedDict[param1] = [param2];
         }
      }
      
      private static function registerUIEvent(param1:Class) : void
      {
         var _loc3_:Function = null;
         var _loc2_:Array = _uiRegisterDict[param1] as Array;
         if(_loc2_ != null)
         {
            for each(_loc3_ in _loc2_)
            {
               HandlerHelper.execute(_loc3_);
            }
         }
      }
      
      private static function removedUIEvent(param1:Class) : void
      {
         var _loc3_:Function = null;
         var _loc2_:Array = _uiRemovedDict[param1] as Array;
         if(_loc2_ != null)
         {
            for each(_loc3_ in _loc2_)
            {
               HandlerHelper.execute(_loc3_);
            }
         }
      }
   }
}

