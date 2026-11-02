package com.tgame.moudels.equipPudding
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.equipPudding.controller.EquipPudding_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class EquipPudding_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.equipPudding.EquipPudding_ApplicationFacade";
      
      public static const NEW_ITEM_TO_BACKPACK:String = "NEW_ITEM_TO_BACKPACK";
      
      public static const SHOW_EQUIP_PUDDING_PLANE:String = "SHOW_EQUIP_PUDDING_PLANE";
      
      public static const EQUIP_STONE_SEND_50125:String = "EQUIP_STONE_SEND_50125";
      
      public static const CLICK_EUQIP2BAOSHI:String = "CLICK_EUQIP2BAOSHI";
      
      public static const KUAISU_SHEGNJIE:String = "KUAISU_SHEGNJIE";
      
      public static const ZHUANGBEI_SHENGJIE:String = "ZHUANGBEI_SHENGJIE";
      
      public static const ZHUANGBEI_YANGCHENG:String = "ZHUANGBEI_YANGCHENG";
      
      public static const SHOW_SISHENGSHOUKEWEN_PANEL1:String = "SHOW_SISHENGSHOUKEWEN_PANEL1";
      
      public static const SHOW_ZHUNAGBEICOPE_PANEL:String = "SHOW_ZHUNAGBEICOPE_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function EquipPudding_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_EQUIP_PUDDING,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.NEW_ITEM_TO_BACKPACK,PipeConstants.SHOW_EQUIP_PUDDING_PLANE,PipeConstants.EQUIP_STONE_SEND_50125,PipeConstants.CLICK_EUQIP2BAOSHI,PipeConstants.KUAISU_SHEGNJIE,PipeConstants.ZHUANGBEI_YANGCHENG,PipeConstants.SHOW_SISHENGSHOUKEWEN_PANEL1,PipeConstants.SHOW_ZHUNAGBEICOPE_PANEL],this.handlePipeMessage,EquipPudding_ApplicationFacade);
      }
      
      public static function getInstance() : EquipPudding_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new EquipPudding_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as EquipPudding_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,EquipPudding_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_EQUIP_PUDDING:
               this.startup();
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.STRONG)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
               }
               break;
            case PipeConstants.NEW_ITEM_TO_BACKPACK:
               sendNotification(NEW_ITEM_TO_BACKPACK,_loc2_);
               break;
            case PipeConstants.SHOW_EQUIP_PUDDING_PLANE:
               sendNotification(SHOW_EQUIP_PUDDING_PLANE,_loc2_);
               break;
            case PipeConstants.EQUIP_STONE_SEND_50125:
               sendNotification(EQUIP_STONE_SEND_50125,_loc2_);
               break;
            case PipeConstants.CLICK_EUQIP2BAOSHI:
               sendNotification(CLICK_EUQIP2BAOSHI,_loc2_);
               break;
            case PipeConstants.KUAISU_SHEGNJIE:
               sendNotification(KUAISU_SHEGNJIE,_loc2_);
               break;
            case PipeConstants.ZHUANGBEI_YANGCHENG:
               sendNotification(ZHUANGBEI_YANGCHENG,_loc2_);
               break;
            case PipeConstants.SHOW_SISHENGSHOUKEWEN_PANEL1:
               sendNotification(SHOW_SISHENGSHOUKEWEN_PANEL1);
               break;
            case PipeConstants.SHOW_ZHUNAGBEICOPE_PANEL:
               sendNotification(SHOW_ZHUNAGBEICOPE_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

