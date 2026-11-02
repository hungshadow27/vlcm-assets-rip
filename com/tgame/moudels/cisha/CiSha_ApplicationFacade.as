package com.tgame.moudels.cisha
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.cisha.controller.CiSha_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class CiSha_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.cisha.CiSha_ApplicationFacade";
      
      public static const SHOW_FUCHOU_OK_PANEL:String = "SHOW_FUCHOU_OK_PANEL";
      
      public static const SHOW_DIXIAQIANZHUANG_PANEL:String = "SHOW_DIXIAQIANZHUANG_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const CISHA_DIXIAQIANZHUANG:String = "CISHA_DIXIAQIANZHUANG";
      
      public static const CISHA_SHUOMING:String = "CISHA_SHUOMING";
      
      public function CiSha_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_CISHA,PipeConstants.SHOW_FUCHOU_OK_PANEL,PipeConstants.SHOW_DIXIAQIANZHUANG_PANEL,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.SHOW_CISHA_SHUOMING],this.handlePipeMessage,CiSha_ApplicationFacade);
      }
      
      public static function getInstance() : CiSha_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new CiSha_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as CiSha_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,CiSha_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc2_:String = param1.name;
         _loc3_ = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_CISHA:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc4_ = _loc3_ as int;
               if(_loc4_ == NpcFunctionType.CISHA_SHUOMING)
               {
                  sendNotification(CISHA_SHUOMING,0);
               }
               else if(_loc4_ == NpcFunctionType.CISHA_DIXIAQIANZHUANG)
               {
                  sendNotification(SHOW_DIXIAQIANZHUANG_PANEL,_loc3_);
               }
               break;
            case PipeConstants.SHOW_FUCHOU_OK_PANEL:
               sendNotification(SHOW_FUCHOU_OK_PANEL,_loc3_);
               break;
            case PipeConstants.SHOW_CISHA_SHUOMING:
               sendNotification(CISHA_SHUOMING,1);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

