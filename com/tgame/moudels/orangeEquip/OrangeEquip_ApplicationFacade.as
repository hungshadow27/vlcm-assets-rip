package com.tgame.moudels.orangeEquip
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.orangeEquip.controller.OrangeEquip_StartupCommand;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class OrangeEquip_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.orangeEquip.OrangeEquip_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public function OrangeEquip_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_ORANGE_EQUIP,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.GOODS_CHANGED],this.handlePipeMessage,OrangeEquip_ApplicationFacade);
      }
      
      public static function getInstance() : OrangeEquip_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new OrangeEquip_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as OrangeEquip_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,OrangeEquip_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_ORANGE_EQUIP:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.ORANGE_EQUIP && !Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL,1);
               }
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

