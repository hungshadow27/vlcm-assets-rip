package com.tgame.moudels.menpaijuexue
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.menpaijuexue.controller.MenPaiJueXue_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class MenPaiJueXue_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.menpaijuexue.MenPaiJueXue_ApplicationFacade";
      
      public static const SHOW_MENPAIJUEXUE_PANEL:String = "SHOW_MENPAIJUEXUE_PANEL";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SHOW_CAISHENXUNBAO_PANEL:String = "SHOW_CAISHENXUNBAO_PANEL";
      
      public static const SHOW_ZHIZUONANGUAPAI_PANEL:String = "SHOW_ZHIZUONANGUAPAI_PANEL";
      
      public static const CLICK_XUEREN:String = "CLICK_XUEREN";
      
      public static const CLICK_BAOHE:String = "CLICK_BAOHE";
      
      public static const SHOW_CHUNJIE_PANEL:String = "SHOW_CHUNJIE_PANEL";
      
      public static const SHOW_LANTERNFESTIVAL_PANEL:String = "SHOW_LANTERNFESTIVAL_PANEL";
      
      public static const CLICK_DENGMI:String = "CLICK_DENGMI";
      
      public static const UI_MENPAIJUEXUE_SKILL_DRAG:String = "UI_MENPAIJUEXUE_SKILL_DRAG";
      
      public static const STARTUP:String = "STARTUP";
      
      public function MenPaiJueXue_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.SHOW_MENPAIJUEXUE_PANEL,PipeConstants.STARTUP_MENPAIJUEXUE,PipeConstants.UI_MENPAIJUEXUE_SKILL_DRAG],this.handlePipeMessage,MenPaiJueXue_ApplicationFacade);
      }
      
      public static function getInstance() : MenPaiJueXue_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new MenPaiJueXue_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as MenPaiJueXue_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,MenPaiJueXue_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_MENPAIJUEXUE:
               sendNotification(STARTUP);
               break;
            case PipeConstants.SHOW_MENPAIJUEXUE_PANEL:
               sendNotification(SHOW_MENPAIJUEXUE_PANEL,_loc2_);
               break;
            case PipeConstants.UI_MENPAIJUEXUE_SKILL_DRAG:
               sendNotification(UI_MENPAIJUEXUE_SKILL_DRAG,_loc2_);
         }
      }
   }
}

