package com.tgame.moudels.mount
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.mount.controller.Mount_StartupCommand;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Mount_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.char.Mount_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const UP_DOWN_HORSE:String = "UP_DOWN_HORSE";
      
      public static const CATCH_HORSE:String = "CATCH_HORSE";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const JIAOHUAN_MOSHOU:String = "JIAOHUAN_MOSHOU";
      
      public static const SHOW_SHOUYUAN_SKILL:String = "SHOW_SHOUYUAN_SKILL";
      
      public static const SHOW_YUEGUANGBAOHE_PANEL:String = "SHOW_YUEGUANGBAOHE_PANEL";
      
      public static const SHOW_XUESHOUTUIBIAN_PANEL:String = "SHOW_XUESHOUTUIBIAN_PANEL";
      
      public static const SHOW_FENGLEISHOU_PANEL:String = "SHOW_FENGLEISHOU_PANEL";
      
      public static const SHOW_DIANFENGSHOU_PANEL:String = "SHOW_DIANFENGSHOU_PANEL";
      
      public function Mount_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_MOUNT,PipeConstants.UP_DOWN_HORSE,PipeConstants.CATCH_HORSE,PipeConstants.GOODS_CHANGED,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.SHOW_SHOUYUAN_SKILL,PipeConstants.SHOW_YUEGUANGBAOHE_PANEL,PipeConstants.SHOW_XUESHOUTUIBIAN_PANEL,PipeConstants.SHOW_DIANFENGSHOU_PANEL],this.handlePipeMessage,Mount_ApplicationFacade);
      }
      
      public static function getInstance() : Mount_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Mount_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Mount_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Mount_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_MOUNT:
               this.startup();
               break;
            case PipeConstants.UP_DOWN_HORSE:
               sendNotification(UP_DOWN_HORSE);
               break;
            case PipeConstants.CATCH_HORSE:
               sendNotification(CATCH_HORSE,_loc2_);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.CHANGE_SUPER_MOUNT)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_CHANGE_SUPER_MOUNT);
               }
               else if(_loc3_ == NpcFunctionType.FENGLEISHOU_DUIHUAN && !Fun.isVisible(GameInstance.uiInstance.fengLeiShouPanel))
               {
                  sendNotification(SHOW_FENGLEISHOU_PANEL,_loc2_);
               }
               break;
            case PipeConstants.SHOW_SHOUYUAN_SKILL:
               sendNotification(SHOW_SHOUYUAN_SKILL,_loc2_);
               break;
            case PipeConstants.SHOW_YUEGUANGBAOHE_PANEL:
               sendNotification(SHOW_YUEGUANGBAOHE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_XUESHOUTUIBIAN_PANEL:
               sendNotification(SHOW_XUESHOUTUIBIAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DIANFENGSHOU_PANEL:
               sendNotification(SHOW_DIANFENGSHOU_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

