package com.tgame.moudels.menpaiequipchange
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.menpaiequipchange.controller.PartyEquipChange_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class PartyEquipChange_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.menpaiequipchange.PartyEquipChange_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const BAITUOSHANXIA:String = "BAITUOSHANXIA";
      
      public function PartyEquipChange_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_EQUIPMENPAIZHUANGHUAN,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.SHOW_BAITUOSHAN_PANEL],this.handlePipeMessage,PartyEquipChange_ApplicationFacade);
      }
      
      public static function getInstance() : PartyEquipChange_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new PartyEquipChange_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as PartyEquipChange_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,PartyEquipChange_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc2_:String = param1.name;
         _loc3_ = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_EQUIPMENPAIZHUANGHUAN:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc4_ = _loc3_ as int;
               if(_loc4_ == NpcFunctionType.EQUIP_PARTY_CHANGE)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_PARTYEQUIPCHANGE_PANEL);
               }
               break;
            case PipeConstants.SHOW_BAITUOSHAN_PANEL:
               sendNotification(BAITUOSHANXIA);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

