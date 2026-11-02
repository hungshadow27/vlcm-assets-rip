package com.tgame.moudels.beiDouQiXingZhen
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.beiDouQiXingZhen.controller.BeiDouQiXingZhen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class BeiDouQiXingZhen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.beiDouQiXingZhen.BeiDouQiXingZhen_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function BeiDouQiXingZhen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.START_BEIDOUQIXINGZHEN],this.handlerPipeMessage,BeiDouQiXingZhen_ApplicationFacade);
      }
      
      public static function getInstance() : BeiDouQiXingZhen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new BeiDouQiXingZhen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as BeiDouQiXingZhen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,BeiDouQiXingZhen_StartupCommand);
      }
      
      public function handlerPipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         switch(_loc2_)
         {
            case PipeConstants.START_BEIDOUQIXINGZHEN:
               sendNotification(STARTUP);
         }
      }
   }
}

