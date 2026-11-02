package com.tgame.moudels.qingdieshuangren
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.qingdieshuangren.controller.QingDieShuangRen_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class QingDieShuangRen_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.qingdieshuangren.QingDieShuangRen_ApplicationFacade";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const ZHANLI_200ZHUANGBEI:String = "ZHANLI_200ZHUANGBEI";
      
      public function QingDieShuangRen_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_QINGDIESHUANGREN,PipeConstants.GOODS_CHANGED,PipeConstants.ZHANLI_200ZHUANGBEI],this.handlePipeMessage,QingDieShuangRen_ApplicationFacade);
      }
      
      public static function getInstance() : QingDieShuangRen_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new QingDieShuangRen_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as QingDieShuangRen_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,QingDieShuangRen_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_QINGDIESHUANGREN:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.ZHANLI_200ZHUANGBEI:
               sendNotification(ZHANLI_200ZHUANGBEI,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

