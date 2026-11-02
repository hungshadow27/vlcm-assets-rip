package com.tgame.manager
{
   import com.zcp.common.log.ZLog;
   import org.puremvc.as3.multicore.interfaces.IFacade;
   
   public class FacadeManager
   {
      
      public function FacadeManager()
      {
         super();
      }
      
      public static function startupFacade(param1:String, param2:* = null) : void
      {
         ZLog.add("启动模块：" + param1);
         var _loc3_:IFacade = FacadeManager.getFacade(param1);
         if(_loc3_ == null)
         {
            throw new Error("模块" + param1 + "不存在");
         }
         PipeManager.sendMsg(param1,param2);
      }
      
      public static function killFacade(param1:String) : void
      {
         ZLog.add("移除模块：" + param1);
         var _loc2_:IFacade = FacadeManager.getFacade(param1);
         if(_loc2_ != null)
         {
            (_loc2_ as Object).dispose();
         }
      }
      
      public static function getFacade(param1:String, param2:Class = null) : IFacade
      {
         return TempFacade.getFacade(param1,param2);
      }
      
      public static function hasFacade(param1:String) : Boolean
      {
         return TempFacade.hasFacade(param1);
      }
   }
}

import com.zcp.manager.RslLoaderManager;
import org.puremvc.as3.multicore.interfaces.IFacade;
import org.puremvc.as3.multicore.patterns.facade.Facade;

class TempFacade extends Facade
{
   
   public function TempFacade(param1:String)
   {
      super(param1);
   }
   
   public static function getFacade(param1:String, param2:Class = null) : IFacade
   {
      if(instanceMap[param1] == null)
      {
         instanceMap[param1] = param2 != null ? new param2(param1) : RslLoaderManager.getInstance(param1,param1);
      }
      return instanceMap[param1];
   }
   
   public static function hasFacade(param1:String) : Boolean
   {
      return instanceMap[param1] != null;
   }
}
