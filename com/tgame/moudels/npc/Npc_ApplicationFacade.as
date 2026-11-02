package com.tgame.moudels.npc
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.npc.controller.Npc_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Npc_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.npc.Npc_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const UPDATE_AND_SHOW_NPC_DIALOG_PLANE:String = "UPDATE_AND_SHOW_NPC_DIALOG_PLANE";
      
      public static const NPC_REQ_FUNCTION:String = "NPC_REQ_FUNCTION";
      
      public static const TASK_UPDATE_NPC:String = "TASK_UPDATE_NPC";
      
      public static const FENGZHENGJIEDUIHUAN_CLICK:String = "FENGZHENGJIEDUIHUAN_CLICK";
      
      public static const SEND_RENAME:String = "SEND_RENAME";
      
      public static const SEND_NPCID:String = "SEND_NPCID";
      
      public static const SEND_YUENANAOJIANHECHENG:String = "SEND_YUENANAOJIANHECHENG";
      
      public static const SEND_YUENANGOODDELETE:String = "SEND_YUENANGOODDELETE";
      
      public static const YN_WUPINFENJIE:String = "YN_WUPINFENJIE";
      
      public static const YN_REQUEST_JINXIANG:String = "YN_REQUEST_JINXIANG";
      
      public static const YN_REQUEST_MUYUHU_START:String = "YN_REQUEST_MUYUHU_START";
      
      public static const YN_REQUEST_YUENAN2015ZHONGQIU:String = "YN_REQUEST_YUENAN2015ZHONGQIU";
      
      public static const YN_SHOW_CHRISTMAS_2015:String = "YN_SHOW_CHRISTMAS_2015";
      
      public static const YN_REQUEST_BAOSHU_START:String = "YN_REQUEST_BAOSHU_START";
      
      public static const SEND_53095:String = "SEND_53095";
      
      public static const SEND_83205:String = "SEND_83205";
      
      public static const SEND_53099:String = "SEND_53099";
      
      public static const SEND_82241:String = "SEND_82241";
      
      public static const YN_CHONGZHIPANEL:String = "YN_CHONGZHIPANEL";
      
      public static const SHOW_YNQIANGHUAZHISHEN_PANEL:String = "SHOW_YNQIANGHUAZHISHEN_PANEL";
      
      public static const SHOW_YNXINNIANZHUFUPANEL:String = "SHOW_YNXINNIANZHUFUPANEL";
      
      public static const SHOW_YN2016TIANDENG:String = "SHOW_YN2016TIANDENG";
      
      public static const SHOW_YN2016SHIERDIZHI:String = "SHOW_YN2016SHIERDIZHI";
      
      public static const SHOW_YNSHANXIAQIJIAN:String = "SHOW_YNSHANXIAQIJIAN";
      
      public static const SHOW_YNLUOHANHUTI:String = "SHOW_YNLUOHANHUTI";
      
      public static const SHOW_YNSHOUYIN:String = "SHOW_YNSHOUYIN";
      
      public static const SHOW_QIZIQUANZHENJIAO:String = "SHOW_QIZIQUANZHENJIAO";
      
      public static const SHOW_2016XIUWEIWUXUE:String = "SHOW_2016XIUWEIWUXUE";
      
      public static const SHOW_YN2016LIUMAIJIANPLANE:String = "SHOW_YN2016LIUMAIJIANPLANE";
      
      public static const SHOW_ZHENTIANSHENQIPLANE:String = "SHOW_ZHENTIANSHENQIPLANE";
      
      public static const SHOW_YN2016WANGZHEZHANQI:String = "SHOW_YN2016WANGZHEZHANQI";
      
      public static const SHOW_YNNVQUANHUODONG:String = "SHOW_YNNVQUANHUODONG";
      
      public static const SHOW_YNWULINSHENQIPANEL:String = "SHOW_YNWULINSHENQIPANEL";
      
      public static const SHOW_YNJUEDINGSHENBINGPANEL:String = "SHOW_YNJUEDINGSHENBINGPANEL";
      
      public static const SHOW_YNHUTISHANGYIPANEL:String = "SHOW_YNHUTISHANGYIPANEL";
      
      public static const SHOW_YNWUSHUANGPUPANEL:String = "SHOW_YNWUSHUANGPUPANEL";
      
      public static const SHOW_YNSHISANJIANHUN:String = "SHOW_YNSHISANJIANHUN";
      
      public static const SHOW_WANGZHEZHUANGBEI:String = "SHOW_WANGZHEZHUANGBEI";
      
      public static const SHOW_HUAZHUANGLIBAO_PANEL:String = "SHOW_HUAZHUANGLIBAO_PANEL";
      
      public static const SHOW_CHIBANGLIBAO_PANEL:String = "SHOW_CHIBANGLIBAO_PANEL";
      
      public function Npc_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_NPC,PipeConstants.UPDATE_AND_SHOW_NPC_DIALOG_PLANE,PipeConstants.TASK_UPDATE_NPC,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.FENGZHENGJIEDUIHUAN_CLICK,PipeConstants.SEND_RENAME,PipeConstants.SEND_NPCID,PipeConstants.SEND_YUENANAOJIANHECHENG,PipeConstants.SEND_YUENANGOODDELETE,PipeConstants.SEND_53095,PipeConstants.SEND_83205,PipeConstants.SEND_53099,PipeConstants.SEND_82241,PipeConstants.YN_WUPINFENJIE,PipeConstants.YN_REQUEST_JINXIANG,PipeConstants.YN_REQUEST_MUYUHU_START,PipeConstants.YN_REQUEST_BAOSHU_START,PipeConstants.YN_REQUEST_YUENAN2015ZHONGQIU,PipeConstants.YN_CHONGZHIPANEL,PipeConstants.YN_SHOW_CHRISTMAS_2015,PipeConstants.SHOW_YNQIANGHUAZHISHEN_PANEL,PipeConstants.SHOW_YNXINNIANZHUFUPANEL,PipeConstants.SHOW_YN2016TIANDENG,PipeConstants.SHOW_YN2016SHIERDIZHI,PipeConstants.SHOW_YNSHANXIAQIJIAN,PipeConstants.SHOW_YNLUOHANHUTI,PipeConstants.SHOW_YNSHOUYIN,PipeConstants.SHOW_YN2016QIZIQUANZHENJIAO,PipeConstants.SHOW_YN2016XIUWEIWUXUE
         ,PipeConstants.SHOW_YN2016LIUMAIJIANPLANE,PipeConstants.SHOW_ZHENTIANSHENQIPLANE,PipeConstants.SHOW_HUAZHUANGLIBAO_PANEL,PipeConstants.SHOW_CHIBANGLIBAO_PANEL,PipeConstants.SHOW_YN2016WANGZHEZHANQI,PipeConstants.SHOW_YNNVQUANHUODONG,PipeConstants.SHOW_YNWULINSHENQIPANEL,PipeConstants.SHOW_YNJUEDINGSHENBINGPANEL,PipeConstants.SHOW_YNHUTISHANGYIPANEL,PipeConstants.SHOW_YNWUSHUANGPUPANEL,PipeConstants.SHOW_YNSHISANJIANHUN,PipeConstants.SHOW_WANGZHEZHUANGBEI],this.handlePipeMessage,Npc_ApplicationFacade);
      }
      
      public static function getInstance() : Npc_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Npc_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Npc_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Npc_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_NPC:
               this.startup();
               break;
            case PipeConstants.UPDATE_AND_SHOW_NPC_DIALOG_PLANE:
               sendNotification(UPDATE_AND_SHOW_NPC_DIALOG_PLANE,_loc2_);
               break;
            case PipeConstants.TASK_UPDATE_NPC:
               sendNotification(TASK_UPDATE_NPC,_loc2_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               sendNotification(NPC_REQ_FUNCTION,_loc2_);
               break;
            case PipeConstants.FENGZHENGJIEDUIHUAN_CLICK:
               sendNotification(FENGZHENGJIEDUIHUAN_CLICK,_loc2_);
               break;
            case PipeConstants.SEND_RENAME:
               sendNotification(SEND_RENAME,_loc2_);
               break;
            case PipeConstants.SEND_NPCID:
               sendNotification(SEND_NPCID,_loc2_);
               break;
            case PipeConstants.SEND_YUENANAOJIANHECHENG:
               sendNotification(SEND_YUENANAOJIANHECHENG,_loc2_);
               break;
            case PipeConstants.SEND_YUENANGOODDELETE:
               sendNotification(SEND_YUENANGOODDELETE,_loc2_);
               break;
            case PipeConstants.SEND_53095:
               sendNotification(SEND_53095,_loc2_);
               break;
            case PipeConstants.SEND_83205:
               sendNotification(SEND_83205,_loc2_);
               break;
            case PipeConstants.YN_WUPINFENJIE:
               sendNotification(YN_WUPINFENJIE,_loc2_);
               break;
            case PipeConstants.YN_REQUEST_JINXIANG:
               sendNotification(YN_REQUEST_JINXIANG,_loc2_);
               break;
            case PipeConstants.YN_REQUEST_MUYUHU_START:
               sendNotification(YN_REQUEST_MUYUHU_START,_loc2_);
               break;
            case PipeConstants.YN_REQUEST_BAOSHU_START:
               sendNotification(YN_REQUEST_BAOSHU_START,_loc2_);
               break;
            case PipeConstants.YN_REQUEST_YUENAN2015ZHONGQIU:
               sendNotification(YN_REQUEST_YUENAN2015ZHONGQIU,_loc2_);
               break;
            case PipeConstants.YN_CHONGZHIPANEL:
               sendNotification(YN_CHONGZHIPANEL,_loc2_);
               break;
            case PipeConstants.YN_SHOW_CHRISTMAS_2015:
               sendNotification(YN_SHOW_CHRISTMAS_2015,_loc2_);
               break;
            case PipeConstants.SHOW_YNQIANGHUAZHISHEN_PANEL:
               sendNotification(SHOW_YNQIANGHUAZHISHEN_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YNXINNIANZHUFUPANEL:
               sendNotification(SHOW_YNXINNIANZHUFUPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016TIANDENG:
               sendNotification(SHOW_YN2016TIANDENG,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016SHIERDIZHI:
               sendNotification(SHOW_YN2016SHIERDIZHI,_loc2_);
               break;
            case PipeConstants.SHOW_YNSHANXIAQIJIAN:
               sendNotification(SHOW_YNSHANXIAQIJIAN,_loc2_);
               break;
            case PipeConstants.SHOW_YNSHOUYIN:
               sendNotification(SHOW_YNSHOUYIN,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016QIZIQUANZHENJIAO:
               sendNotification(SHOW_QIZIQUANZHENJIAO,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016XIUWEIWUXUE:
               sendNotification(SHOW_2016XIUWEIWUXUE,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016LIUMAIJIANPLANE:
               sendNotification(SHOW_YN2016LIUMAIJIANPLANE,_loc2_);
               break;
            case PipeConstants.SHOW_ZHENTIANSHENQIPLANE:
               sendNotification(SHOW_ZHENTIANSHENQIPLANE,_loc2_);
               break;
            case PipeConstants.SHOW_YN2016WANGZHEZHANQI:
               sendNotification(SHOW_YN2016WANGZHEZHANQI,_loc2_);
               break;
            case PipeConstants.SHOW_YNLUOHANHUTI:
               sendNotification(SHOW_YNLUOHANHUTI,_loc2_);
               break;
            case PipeConstants.SHOW_YNNVQUANHUODONG:
               sendNotification(SHOW_YNNVQUANHUODONG,_loc2_);
               break;
            case PipeConstants.SHOW_YNWULINSHENQIPANEL:
               sendNotification(SHOW_YNWULINSHENQIPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YNHUTISHANGYIPANEL:
               sendNotification(SHOW_YNHUTISHANGYIPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YNJUEDINGSHENBINGPANEL:
               sendNotification(SHOW_YNJUEDINGSHENBINGPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YNSHISANJIANHUN:
               sendNotification(SHOW_YNSHISANJIANHUN,_loc2_);
               break;
            case PipeConstants.SHOW_YNWUSHUANGPUPANEL:
               sendNotification(SHOW_YNWUSHUANGPUPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_WANGZHEZHUANGBEI:
               sendNotification(SHOW_WANGZHEZHUANGBEI,_loc2_);
               break;
            case PipeConstants.SHOW_HUAZHUANGLIBAO_PANEL:
               sendNotification(SHOW_HUAZHUANGLIBAO_PANEL,_loc2_);
               break;
            case PipeConstants.SHOW_CHIBANGLIBAO_PANEL:
               sendNotification(SHOW_CHIBANGLIBAO_PANEL,_loc2_);
               break;
            case PipeConstants.SEND_53099:
               sendNotification(SEND_53099,_loc2_);
               break;
            case PipeConstants.SEND_82241:
               sendNotification(SEND_82241,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

