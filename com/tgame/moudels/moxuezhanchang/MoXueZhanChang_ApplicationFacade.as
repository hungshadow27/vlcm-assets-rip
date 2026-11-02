package com.tgame.moudels.moxuezhanchang
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.moxuezhanchang.controller.MoXueZhanChang_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class MoXueZhanChang_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.moxuezhanchang.MoXueZhanChang_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GET_MOXUEZHANCHANG_PANEL:String = "GET_MOXUEZHANCHANG_PANEL";
      
      public static const GET_FULIHUODONG_PANEL:String = "GET_FULIHUODONG_PANEL";
      
      public function MoXueZhanChang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_MOXUEZHANCHANG,PipeConstants.GET_MOXUEZHANCHANG_PANEL,PipeConstants.GET_FULIHUODONG_PANEL],this.handlePipeMessage,MoXueZhanChang_ApplicationFacade);
      }
      
      public static function getInstance() : MoXueZhanChang_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new MoXueZhanChang_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as MoXueZhanChang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,MoXueZhanChang_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_MOXUEZHANCHANG:
               this.startup();
               break;
            case PipeConstants.GET_MOXUEZHANCHANG_PANEL:
               sendNotification(GET_MOXUEZHANCHANG_PANEL);
               break;
            case PipeConstants.GET_FULIHUODONG_PANEL:
               sendNotification(GET_FULIHUODONG_PANEL);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

