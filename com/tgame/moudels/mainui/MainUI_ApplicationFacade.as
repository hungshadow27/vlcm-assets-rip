package com.tgame.moudels.mainui
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.mainui.controller.MainUI_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class MainUI_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.char.MainUI_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const INIT_MINI_MAP:String = "InitMiniMap";
      
      public static const SET_SMALL_MAP_STATIC_DATA:String = "UPDATA_SMALL_MAP";
      
      public static const REF_MAINCHAR_HEAD:String = "REF_MAINCHAR_HEAD";
      
      public static const REF_LOCKEDCHAR_HEAD:String = "REF_LOCKEDCHAR_HEAD";
      
      public static const TASK_UPDATE_ALL_NPC_STATUS:String = "TASK_UPDATE_ALL_NPC_STATUS";
      
      public static const UPDATA_MOUNT_SKILL:String = "UPDATA_MOUNT_SKILL";
      
      public static const CHANGE_LINE:String = "CHANGE_LINE";
      
      public static const RANK_CHONGBAI_BISHI_DATA:String = "RANK_CHONGBAI_BISHI_DATA";
      
      public static const SHOW_MAP:String = "SHOW_MAP";
      
      public static const CHANGE_CHAT_SIZE:String = "CHANGE_CHAT_SIZE";
      
      public static const SHOW_BOSS_REFURBISH_PANEL:String = "SHOW_BOSS_REFURBISH_PANEL";
      
      public static const SHOW_CONQUER_TARGET_PANEL:String = "SHOW_CONQUER_TARGET_PANEL";
      
      public static const SHOW_WAIT_TODO_PANEL:String = "SHOW_WAIT_TODO_PANEL";
      
      public static const SET_SMALL_MAP_BANGQI:String = "SET_SMALL_MAP_BANGQI";
      
      public static const SET_SMALL_MAP_SHENLONGZHIREN:String = "SET_SMALL_MAP_SHENLONGZHIREN";
      
      public static const SET_SMALL_MAP_NB_ZHUANGBEI:String = "SET_SMALL_MAP_NB_ZHUANGBEI";
      
      public static const SET_SMALL_MAP_XIUQIU:String = "SET_SMALL_MAP_XIUQIU";
      
      public static const SET_SMALL_MAP_NB_ZHUANGBEI3V3:String = "SET_SMALL_MAP_NB_ZHUANGBEI3V3";
      
      public static const KUA_FU_RANK_DATA_RECEIVED:String = "KUA_FU_RANK_DATA_RECEIVED";
      
      public static const NPC_REQ_FUNCTION:String = "NPC_REQ_FUNCTION";
      
      public static const BIWUDAHU_ZHUWEI:String = "BIWUDAHU_ZHUWEI";
      
      public static const UPDATE_BAOSHI_TIME:String = "UPDATE_BAOSHI_TIME";
      
      public static const JIAN_SELECT:String = "JIAN_SELECT";
      
      public static const YINCHANG_ZHAN:String = "YINCHANG_ZHAN";
      
      public static const LIKAI_KUAFU_LEITAI:String = "LIKAI_KUAFU_LEITAI";
      
      public static const HIDE_GUIDE_BAR:String = "HIDE_GUIDE_BAR";
      
      public static const SHOW_LOCK_CHAR:String = "SHOW_LOCK_CHAR";
      
      public static const JINYAN:String = "JINYAN";
      
      public static const SHOW_BIWUDAHUI_PANEL:String = "SHOW_BIWUDAHUI_PANEL";
      
      public static const YN_YUENANHUODONGYOUHUA_CLICK:* = "YN_YUENANHUODONGYOUHUA_CLICK";
      
      public static const GET_BAGUAZHENMAINUI_SHOW_HIDE:String = "GET_BAGUAZHENMAINUI_SHOW_HIDE";
      
      public function MainUI_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_MAINUI,PipeConstants.CHANGED_MAINCHAR_BASE_ATTR,PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,PipeConstants.LOAD_SMALL_MAP_COMPLETE,PipeConstants.SET_SMALL_MAP_STATIC_DATA,PipeConstants.TASK_UPDATE_ALL_NPC_STATUS,PipeConstants.UPDATA_MOUNT_SKILL,PipeConstants.CHANGE_LINE,PipeConstants.SHOW_MAP,PipeConstants.CHANGE_CHAT_SIZE,PipeConstants.SET_SMALL_MAP_BANGQI,PipeConstants.SET_SMALL_MAP_SHENLONGZHIREN,PipeConstants.SET_SMALL_MAP_NB_ZHUANGBEI,PipeConstants.SET_SMALL_MAP_NB_ZHUANGBEI3V3,PipeConstants.KUA_FU_RANK_DATA_RECEIVED,PipeConstants.KUAFU_STATUS,PipeConstants.RANK_CHONGBAI_BISHI_DATA,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.BIWUDAHU_ZHUWEI,PipeConstants.UPDATE_BAOSHI_TIME,PipeConstants.JIAN_SELECT,PipeConstants.LIKAI_KUAFU_LEITAI,PipeConstants.SHOW_LOCK_CHAR,PipeConstants.SET_SMALL_MAP_XIUQIU,PipeConstants.SEND_JINYAN,PipeConstants.SHOW_BIWUDAHUI_PANEL,PipeConstants.YN_YUENANHUODONGYOUHUA_CLICK,PipeConstants.GET_BAGUAZHENMAINUI_SHOW_HIDE]
         ,this.handlePipeMessage,MainUI_ApplicationFacade);
      }
      
      public static function getInstance() : MainUI_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new MainUI_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as MainUI_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,MainUI_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Boolean = false;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_MAINUI:
               this.startup();
               break;
            case PipeConstants.CHANGED_MAINCHAR_BASE_ATTR:
               sendNotification(REF_MAINCHAR_HEAD);
               break;
            case PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR:
               sendNotification(REF_LOCKEDCHAR_HEAD,_loc2_);
               break;
            case PipeConstants.LOAD_SMALL_MAP_COMPLETE:
               sendNotification(INIT_MINI_MAP,_loc2_);
               break;
            case PipeConstants.SET_SMALL_MAP_STATIC_DATA:
               sendNotification(SET_SMALL_MAP_STATIC_DATA,_loc2_);
               break;
            case PipeConstants.TASK_UPDATE_ALL_NPC_STATUS:
               sendNotification(TASK_UPDATE_ALL_NPC_STATUS,_loc2_);
               break;
            case PipeConstants.UPDATA_MOUNT_SKILL:
               sendNotification(UPDATA_MOUNT_SKILL,_loc2_);
               break;
            case PipeConstants.CHANGE_LINE:
               sendNotification(CHANGE_LINE,_loc2_);
               break;
            case PipeConstants.SHOW_MAP:
               sendNotification(SHOW_MAP,_loc2_);
               break;
            case PipeConstants.CHANGE_CHAT_SIZE:
               sendNotification(CHANGE_CHAT_SIZE,_loc2_);
               break;
            case PipeConstants.SET_SMALL_MAP_BANGQI:
               sendNotification(SET_SMALL_MAP_BANGQI,_loc2_);
               break;
            case PipeConstants.SET_SMALL_MAP_SHENLONGZHIREN:
               sendNotification(SET_SMALL_MAP_SHENLONGZHIREN,_loc2_);
               break;
            case PipeConstants.SET_SMALL_MAP_XIUQIU:
               sendNotification(SET_SMALL_MAP_XIUQIU,_loc2_);
               break;
            case PipeConstants.SET_SMALL_MAP_NB_ZHUANGBEI:
               sendNotification(SET_SMALL_MAP_NB_ZHUANGBEI,_loc2_);
               break;
            case PipeConstants.SET_SMALL_MAP_NB_ZHUANGBEI3V3:
               sendNotification(SET_SMALL_MAP_NB_ZHUANGBEI3V3,_loc2_);
               break;
            case PipeConstants.KUA_FU_RANK_DATA_RECEIVED:
               sendNotification(KUA_FU_RANK_DATA_RECEIVED,_loc2_);
               break;
            case PipeConstants.KUAFU_STATUS:
               _loc3_ = _loc2_ as Boolean;
               if(_loc3_)
               {
                  PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI);
               }
               sendNotification(YINCHANG_ZHAN,_loc2_);
               sendNotification(HIDE_GUIDE_BAR,_loc2_);
               break;
            case PipeConstants.RANK_CHONGBAI_BISHI_DATA:
               sendNotification(RANK_CHONGBAI_BISHI_DATA,_loc2_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               sendNotification(NPC_REQ_FUNCTION,_loc2_);
               break;
            case PipeConstants.BIWUDAHU_ZHUWEI:
               sendNotification(BIWUDAHU_ZHUWEI,_loc2_);
               break;
            case PipeConstants.UPDATE_BAOSHI_TIME:
               sendNotification(UPDATE_BAOSHI_TIME,_loc2_);
               break;
            case PipeConstants.JIAN_SELECT:
               sendNotification(JIAN_SELECT,_loc2_);
               break;
            case PipeConstants.LIKAI_KUAFU_LEITAI:
               sendNotification(LIKAI_KUAFU_LEITAI);
               break;
            case PipeConstants.SHOW_LOCK_CHAR:
               sendNotification(SHOW_LOCK_CHAR,_loc2_);
               break;
            case PipeConstants.SEND_JINYAN:
               sendNotification(JINYAN,_loc2_);
               break;
            case PipeConstants.SHOW_BIWUDAHUI_PANEL:
               sendNotification(SHOW_BIWUDAHUI_PANEL,_loc2_);
               break;
            case PipeConstants.YN_YUENANHUODONGYOUHUA_CLICK:
               sendNotification(YN_YUENANHUODONGYOUHUA_CLICK,_loc2_);
               break;
            case PipeConstants.GET_BAGUAZHENMAINUI_SHOW_HIDE:
               sendNotification(GET_BAGUAZHENMAINUI_SHOW_HIDE,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

