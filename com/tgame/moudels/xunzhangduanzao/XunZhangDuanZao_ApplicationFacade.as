package com.tgame.moudels.xunzhangduanzao
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xunzhangduanzao.controller.XunZhangDuanZao_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XunZhangDuanZao_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xunzhangduanzao.XunZhangDuanZao_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const XUNZHANGDUANZAO:String = "XUNZHANGDUANZAO";
      
      public static const ZUOQI_ZHUANGBEI_DAZAO:String = "ZUOQI_ZHUANGBEI_DAZAO";
      
      public static const PACK_SHOW_SHENGDAN_XUNZHANG_SHENGJI:String = "PACK_SHOW_SHENGDAN_XUNZHANG_SHENGJI";
      
      public static const DUOXUAN_QIANGHUA:String = "DUOXUAN_QIANGHUA";
      
      public static const SHENQI_JINHUA:String = "SHENQI_JINHUA";
      
      public static const SHOW_WUFANGQIANGHUA_PANEL:String = "SHOW_WUFANGQIANGHUA_PANEL";
      
      public function XunZhangDuanZao_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XUNZHANGDUANZAO,PipeConstants.GOODS_CHANGED,PipeConstants.XUNZHANG_DUANZAO,PipeConstants.ZUOQI_ZHUANGBEI_DAZAO,PipeConstants.PACK_SHOW_SHENGDAN_XUNZHANG_SHENGJI,PipeConstants.DUOXUAN_QIANGHUA,PipeConstants.SHENQI_JINHUA,PipeConstants.SHOW_WUFANGQIANGHUA_PANEL],this.handlePipeMessage,XunZhangDuanZao_ApplicationFacade);
      }
      
      public static function getInstance() : XunZhangDuanZao_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XunZhangDuanZao_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XunZhangDuanZao_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XunZhangDuanZao_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:String = param1.name;
         var _loc3_:Object = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_XUNZHANGDUANZAO:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED,_loc3_);
               break;
            case PipeConstants.XUNZHANG_DUANZAO:
               sendNotification(XUNZHANGDUANZAO,_loc3_);
               break;
            case PipeConstants.ZUOQI_ZHUANGBEI_DAZAO:
               sendNotification(ZUOQI_ZHUANGBEI_DAZAO,_loc3_);
               break;
            case PipeConstants.PACK_SHOW_SHENGDAN_XUNZHANG_SHENGJI:
               sendNotification(PACK_SHOW_SHENGDAN_XUNZHANG_SHENGJI,_loc3_);
               break;
            case PipeConstants.DUOXUAN_QIANGHUA:
               sendNotification(DUOXUAN_QIANGHUA,_loc3_);
               break;
            case PipeConstants.SHENQI_JINHUA:
               sendNotification(SHENQI_JINHUA,_loc3_);
               break;
            case PipeConstants.SHOW_WUFANGQIANGHUA_PANEL:
               sendNotification(SHOW_WUFANGQIANGHUA_PANEL,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

