package com.tgame.moudels.nitaCyclone
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.nitaCyclone.controller.NitaCyclone_StartUpCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class NitaCyclone_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.nitaCyclone.NitaCyclone_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const BUG_GOODS:String = "BUY_GOODS";
      
      public static const SHOW_GOODS_PANEL:String = "NITA_SHOW_GOODS_PANEL";
      
      public static const UPDATE_SKILL:String = "UPDATE_SKILL";
      
      public static const DANTIAN_DINGJI_JIHUO_SHUXING:String = "DANTIAN_DINGJI_JIHUO_SHUXING";
      
      public function NitaCyclone_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsg(PipeConstants.STARTUP_NitaCyclone,this.handlePipeMessage,NitaCyclone_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.SHOW_GOODS_PANEL,this.handlePipeMessage,NitaCyclone_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.GOODS_CHANGED,this.handlePipeMessage,NitaCyclone_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.UPDATE_SKILL,this.handlePipeMessage,NitaCyclone_ApplicationFacade);
         PipeManager.registerMsg(PipeConstants.DINGJI_JIHUO_SHUXING,this.handlePipeMessage,NitaCyclone_ApplicationFacade);
      }
      
      public static function getInstance() : NitaCyclone_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new NitaCyclone_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as NitaCyclone_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,NitaCyclone_StartUpCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_NitaCyclone:
               this.startup();
               break;
            case PipeConstants.SHOW_GOODS_PANEL:
               sendNotification(SHOW_GOODS_PANEL,_loc2_);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(BUG_GOODS,_loc2_);
               break;
            case PipeConstants.UPDATE_SKILL:
               sendNotification(UPDATE_SKILL,_loc2_);
               break;
            case PipeConstants.DINGJI_JIHUO_SHUXING:
               sendNotification(DANTIAN_DINGJI_JIHUO_SHUXING,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

