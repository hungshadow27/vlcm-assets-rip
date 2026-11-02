package com.tgame.moudels.wishingTree
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.wishingTree.controller.WishingTree_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class WishingTree_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.wishingTree.WishingTree_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_ZHONGXUYUANSHU_PANEL:String = "SHOW_ZHONGXUYUANSHU_PANEL";
      
      public static const PLANTWISHINGTREE:String = "PLANTWISHINGTREE";
      
      public static const XUYUANSHU_WATER:String = "XUYUANSHU_WATER";
      
      public function WishingTree_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_WISHINGTREE,PipeConstants.SHOW_ZHONGXUYUANSHU_PANEL,PipeConstants.PLANTWISHINGTREE,PipeConstants.XUYUANSHU_WATER],this.handlePipeMessage,WishingTree_ApplicationFacade);
      }
      
      public static function getInstance() : WishingTree_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new WishingTree_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as WishingTree_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,WishingTree_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_WISHINGTREE:
               this.startup();
               break;
            case PipeConstants.SHOW_ZHONGXUYUANSHU_PANEL:
               sendNotification(SHOW_ZHONGXUYUANSHU_PANEL);
               break;
            case PipeConstants.PLANTWISHINGTREE:
               sendNotification(PLANTWISHINGTREE,_loc3_);
               break;
            case PipeConstants.XUYUANSHU_WATER:
               sendNotification(XUYUANSHU_WATER,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

