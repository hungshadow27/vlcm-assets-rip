package com.tgame.moudels.jinchantuoqiao
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.jinchantuoqiao.controller.JinChanTuoQiao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class JinChanTuoQiao_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.jinchantuoqiao.JinChanTuoQiao_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public function JinChanTuoQiao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_JINCHANTUOQIAO,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,JinChanTuoQiao_ApplicationFacade);
      }
      
      public static function getInstance() : JinChanTuoQiao_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new JinChanTuoQiao_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as JinChanTuoQiao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,JinChanTuoQiao_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_JINCHANTUOQIAO:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

