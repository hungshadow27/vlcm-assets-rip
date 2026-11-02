package com.tgame.moudels.wuxingzhiren
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.wuxingzhiren.controller.WuXingZhiRen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class WuXingZhiRen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.wuxingzhiren.WuXingZhiRen_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public function WuXingZhiRen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_WUXINGZHIREN],this.handlePipeMessage,WuXingZhiRen_ApplicationFacade);
      }
      
      public static function getInstance() : WuXingZhiRen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new WuXingZhiRen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as WuXingZhiRen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,WuXingZhiRen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_WUXINGZHIREN:
               this.startup();
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

