package com.tgame.moudels.zhongQiuJie
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.zhongQiuJie.controller.ZhongQiuJie_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class ZhongQiuJie_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.zhongQiuJie.ZhongQiuJie_ApplicationFacade";
      
      public static const SHOW_ZHONGQIUJIE_PANEL:String = "SHOW_ZHONGQIUJIE_PANEL";
      
      public static const CLICK_ZHONGQIUJIE_ZHUOZI:String = "CLICK_ZHONGQIUJIE_ZHUOZI";
      
      public static const TARGET_FUNCTION_QICHENG:String = "TARGET_FUNCTION_QICHENG";
      
      public static const MAINUI_QUEXIAO_QICHENG:String = "MAINUI_QUEXIAO_QICHENG";
      
      public static const SHOW_YUANXIAOJIE_PANEL:String = "SHOW_YUANXIAOJIE_PANEL";
      
      public static const YUANXIAOJIE_CHOUJIANG:String = "YUANXIAOJIE_CHOUJIANG";
      
      public static const CLICK_DENGMI:String = "CLICK_DENGMI";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const SEND_YN_BOOK:String = "SEND_YN_BOOK";
      
      public static const REQUEST_YN_BOOKRANKPANEL:String = "REQUEST_YN_BOOKRANKPANEL";
      
      public static const REQUEST_YN_BOOK_PAIHANG:String = "REQUEST_YN_BOOK_PAIHANG";
      
      public static const REQUEST_YN_BOOK_GETRANK_GOODS:String = "REQUEST_YN_BOOK_GETRANK_GOODS";
      
      public static const STARTUP:String = "STARTUP";
      
      public function ZhongQiuJie_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.SHOW_ZHONGQIUJIE_PANEL,PipeConstants.CLICK_ZHONGQIUJIE_ZHUOZI,PipeConstants.STARTUP_ZHONGQIUJIE,PipeConstants.TARGET_FUNCTION_QICHENG,PipeConstants.MAINUI_QUEXIAO_QICHENG,PipeConstants.SHOW_YUANXIAOJIE_PANEL,PipeConstants.GOODS_CHANGED,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.CLICK_DENGMI,PipeConstants.SEND_YN_BOOK,PipeConstants.REQUEST_YN_BOOKRANKPANEL,PipeConstants.REQUEST_YN_BOOK_PAIHANG,PipeConstants.REQUEST_YN_BOOK_GETRANK_GOODS],this.handlePipeMessage,ZhongQiuJie_ApplicationFacade);
      }
      
      public static function getInstance() : ZhongQiuJie_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new ZhongQiuJie_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as ZhongQiuJie_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,ZhongQiuJie_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_ZHONGQIUJIE:
               sendNotification(STARTUP);
               break;
            case PipeConstants.SHOW_ZHONGQIUJIE_PANEL:
               sendNotification(SHOW_ZHONGQIUJIE_PANEL,_loc2_);
               break;
            case PipeConstants.CLICK_ZHONGQIUJIE_ZHUOZI:
               sendNotification(CLICK_ZHONGQIUJIE_ZHUOZI,_loc2_);
               break;
            case PipeConstants.TARGET_FUNCTION_QICHENG:
               sendNotification(TARGET_FUNCTION_QICHENG,_loc2_);
               break;
            case PipeConstants.MAINUI_QUEXIAO_QICHENG:
               sendNotification(MAINUI_QUEXIAO_QICHENG,_loc2_);
               break;
            case PipeConstants.SHOW_YUANXIAOJIE_PANEL:
               sendNotification(SHOW_YUANXIAOJIE_PANEL,_loc2_);
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED,_loc2_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.YUANXIAOJIE_CHOUJIANG)
               {
                  sendNotification(YUANXIAOJIE_CHOUJIANG,_loc2_);
               }
               break;
            case PipeConstants.CLICK_DENGMI:
               sendNotification(CLICK_DENGMI,_loc2_ as int);
               break;
            case PipeConstants.SEND_YN_BOOK:
               sendNotification(SEND_YN_BOOK,_loc2_);
               break;
            case PipeConstants.REQUEST_YN_BOOKRANKPANEL:
               sendNotification(REQUEST_YN_BOOKRANKPANEL);
               break;
            case PipeConstants.REQUEST_YN_BOOK_PAIHANG:
               sendNotification(REQUEST_YN_BOOK_PAIHANG,_loc2_);
               break;
            case PipeConstants.REQUEST_YN_BOOK_GETRANK_GOODS:
               sendNotification(REQUEST_YN_BOOK_GETRANK_GOODS,_loc2_);
         }
      }
   }
}

