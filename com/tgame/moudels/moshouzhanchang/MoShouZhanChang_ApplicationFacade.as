package com.tgame.moudels.moshouzhanchang
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.moshouzhanchang.controller.MoShouZhanChang_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class MoShouZhanChang_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.moshouzhanchang.MoShouZhanChang_ApplicationFacade";
      
      public static const SHOW_MOSHOUZHANCHANG_PANEL:String = "SHOW_MOSHOUZHANCHANG_PANEL";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SHOW_CAISHENXUNBAO_PANEL:String = "SHOW_CAISHENXUNBAO_PANEL";
      
      public static const SHOW_ZHIZUONANGUAPAI_PANEL:String = "SHOW_ZHIZUONANGUAPAI_PANEL";
      
      public static const CLICK_XUEREN:String = "CLICK_XUEREN";
      
      public static const CLICK_BAOHE:String = "CLICK_BAOHE";
      
      public static const SHOW_CHUNJIE_PANEL:String = "SHOW_CHUNJIE_PANEL";
      
      public static const SHOW_LANTERNFESTIVAL_PANEL:String = "SHOW_LANTERNFESTIVAL_PANEL";
      
      public static const CLICK_DENGMI:String = "CLICK_DENGMI";
      
      public static const GET_MOSHOUZHANCHANG_PANEL:String = "GET_MOSHOUZHANCHANG_PANEL";
      
      public static const MOSHOUZHANCHANG_FUHUO_CLICK:String = "MOSHOUZHANCHANG_FUHUO_CLICK";
      
      public static const SHOW_PILIANGUSE_PANEL:String = "SHOW_PILIANGUSE_PANEL";
      
      public static const SHOW_DUANLIAN_PANEL:String = "SHOW_DUANLIAN_PANEL";
      
      public static const SHOW_NPCDUIHUAXUNHUA_PANEL:String = "SHOW_NPCDUIHUAXUNHUA_PANEL";
      
      public static const SHOW_SHENGDANZHIZHAN_PANEL:String = "SHOW_SHENGDANZHIZHAN_PANEL";
      
      public static const STARTUP:String = "STARTUP";
      
      public function MoShouZhanChang_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_MOSHOUZHANCHANG,PipeConstants.GET_MOSHOUZHANCHANG_PANEL,PipeConstants.MOSHOUZHANCHANG_FUHUO_CLICK,PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_PILIANGUSE_PANEL,PipeConstants.SHOW_DUANLIAN_PANEL,PipeConstants.SHOW_NPCDUIHUAXUNHUA_PANEL,PipeConstants.SHOW_SHENGDANZHIZHAN_PANEL],this.handlePipeMessage,MoShouZhanChang_ApplicationFacade);
      }
      
      public static function getInstance() : MoShouZhanChang_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new MoShouZhanChang_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as MoShouZhanChang_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,MoShouZhanChang_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_MOSHOUZHANCHANG:
               sendNotification(STARTUP);
               break;
            case PipeConstants.GET_MOSHOUZHANCHANG_PANEL:
               sendNotification(GET_MOSHOUZHANCHANG_PANEL,_loc2_);
               break;
            case PipeConstants.MOSHOUZHANCHANG_FUHUO_CLICK:
               sendNotification(MOSHOUZHANCHANG_FUHUO_CLICK,_loc2_);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED,_loc2_);
               break;
            case PipeConstants.SHOW_PILIANGUSE_PANEL:
               sendNotification(SHOW_PILIANGUSE_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_DUANLIAN_PANEL:
               sendNotification(SHOW_DUANLIAN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_NPCDUIHUAXUNHUA_PANEL:
               sendNotification(SHOW_NPCDUIHUAXUNHUA_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_SHENGDANZHIZHAN_PANEL:
               sendNotification(SHOW_SHENGDANZHIZHAN_PANEL,_loc2_);
         }
      }
   }
}

