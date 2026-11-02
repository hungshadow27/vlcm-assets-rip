package com.tgame.moudels.synthesize
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.synthesize.controller.Synthesize_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Synthesize_ApplicationFacde extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.synthesize.Synthesize_ApplicationFacde";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const EXPENDGAS_AND_PROBABILITY:String = "EXPENDGAS_AND_PROBABILITY";
      
      public static const CLOSE_SYNTHESIZE_LOAD_BUFF:String = "CLOSE_SYNTHESIZE_LOAD_BUFF";
      
      public static const SYNTHESIZE_NOT_ITEML:String = "SYNTHESIZE_NOT_ITEM";
      
      public static const NEW_ITEM_TO_BACKPACK:String = "NEW_ITEM_TO_BACKPACK";
      
      public static const SHOW_ITEM_SYNTHESIZE_PLANE:String = "SHOW_ITEM_SYNTHESIZE_PLANE";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const KAIGUANG:String = "KAIGUANG";
      
      public static const LINGHUA:String = "LINGHUA";
      
      public static const XILIAN:String = "XILIAN";
      
      public static const JIHUO:String = "JIHUO";
      
      public static const LONGYINKAIGUANG:String = "LONGYINKAIGUANG";
      
      public static const LONGYA_KAIGUANG:String = "LONGYA_KAIGUANG";
      
      public static const HUSHEN_XILIAN:String = "HUSHEN_XILIAN";
      
      public static const SHISHIKAIFENG:String = "SHISHIKAIFENG";
      
      public static const ZUOQI_DAZAO:String = "ZUOQI_DAZAO";
      
      public static const HUXINYAO_TISHEGN:String = "HUXINYAO_TISHEGN";
      
      public static const DAKAI_ZUOQI_ZHUANGBEI_DAZAO_MIANBAN:String = "DAKAI_ZUOQI_ZHUANGBEI_DAZAO_MIANBAN";
      
      public static const SHOW_XUNZHANG_HECHENG_PANEL:String = "SHOW_XUNZHANG_HECHENG_PANEL";
      
      public function Synthesize_ApplicationFacde(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE,PipeConstants.EXPENDGAS_AND_PROBABILITY,PipeConstants.CLOSE_SYNTHESIZE_LOAD_BUFF,PipeConstants.SYNTHESIZE_NOT_ITEM,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.NEW_ITEM_TO_BACKPACK,PipeConstants.STARTUP_ITEM_SYNTHESIZE,PipeConstants.GOODS_CHANGED,PipeConstants.HUYI_KAIGUANG,PipeConstants.HUYI_LINGHUA,PipeConstants.HUYI_XILIAN,PipeConstants.LONGYIN_KAIGUANG,PipeConstants.ZHUANGBEI_JIHUO,PipeConstants.LONGYA_KAIGUANG,PipeConstants.HUSHENFU_XILIAN,PipeConstants.SHISHIKAIFENG,PipeConstants.ZUOQI_DAZAO,PipeConstants.TISHENGPINZHI,PipeConstants.DAKAI_ZUOQI_ZHUANGBEI_DAZAO_MIANBAN,PipeConstants.SHOW_XUNZHANG_HECHENG_PANEL],this.handlePipeMessage,Synthesize_ApplicationFacde);
      }
      
      public static function getInstance() : Synthesize_ApplicationFacde
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Synthesize_ApplicationFacde(NAME);
         }
         return instanceMap[NAME] as Synthesize_ApplicationFacde;
      }
      
      public function dispose() : void
      {
         PipeManager.removeMsgs([PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE,PipeConstants.EXPENDGAS_AND_PROBABILITY,PipeConstants.CLOSE_SYNTHESIZE_LOAD_BUFF,PipeConstants.SYNTHESIZE_NOT_ITEM,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.NEW_ITEM_TO_BACKPACK,PipeConstants.STARTUP_ITEM_SYNTHESIZE,PipeConstants.GOODS_CHANGED,PipeConstants.HUYI_KAIGUANG,PipeConstants.HUYI_LINGHUA,PipeConstants.HUYI_XILIAN,PipeConstants.LONGYIN_KAIGUANG,PipeConstants.ZHUANGBEI_JIHUO,PipeConstants.LONGYA_KAIGUANG,PipeConstants.HUSHENFU_XILIAN,PipeConstants.SHISHIKAIFENG,PipeConstants.ZUOQI_DAZAO,PipeConstants.TISHENGPINZHI,PipeConstants.DAKAI_ZUOQI_ZHUANGBEI_DAZAO_MIANBAN,PipeConstants.SHOW_XUNZHANG_HECHENG_PANEL],Synthesize_ApplicationFacde);
         Facade.removeCore(Synthesize_ApplicationFacde.NAME);
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Synthesize_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.body;
         switch(param1.name)
         {
            case PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE:
               sendNotification(SHOW_ITEM_SYNTHESIZE_PLANE);
               break;
            case PipeConstants.SYNTHESIZE_NOT_ITEM:
               sendNotification(SYNTHESIZE_NOT_ITEML,_loc2_);
               break;
            case PipeConstants.EXPENDGAS_AND_PROBABILITY:
               sendNotification(EXPENDGAS_AND_PROBABILITY,_loc2_);
               break;
            case PipeConstants.CLOSE_SYNTHESIZE_LOAD_BUFF:
               sendNotification(CLOSE_SYNTHESIZE_LOAD_BUFF);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.FUSE)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
               }
               break;
            case PipeConstants.NEW_ITEM_TO_BACKPACK:
               sendNotification(NEW_ITEM_TO_BACKPACK,_loc2_);
               break;
            case PipeConstants.STARTUP_ITEM_SYNTHESIZE:
               this.startup();
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED,_loc2_);
               break;
            case PipeConstants.HUYI_KAIGUANG:
               sendNotification(KAIGUANG,_loc2_);
               break;
            case PipeConstants.HUYI_LINGHUA:
               sendNotification(LINGHUA,_loc2_);
               break;
            case PipeConstants.HUYI_XILIAN:
               sendNotification(XILIAN,_loc2_);
               break;
            case PipeConstants.LONGYIN_KAIGUANG:
               sendNotification(LONGYINKAIGUANG,_loc2_);
               break;
            case PipeConstants.ZHUANGBEI_JIHUO:
               sendNotification(JIHUO,_loc2_);
               break;
            case PipeConstants.LONGYA_KAIGUANG:
               sendNotification(LONGYA_KAIGUANG,_loc2_);
               break;
            case PipeConstants.HUSHENFU_XILIAN:
               sendNotification(HUSHEN_XILIAN,_loc2_);
               break;
            case PipeConstants.SHISHIKAIFENG:
               sendNotification(SHISHIKAIFENG,_loc2_);
               break;
            case PipeConstants.ZUOQI_DAZAO:
               sendNotification(ZUOQI_DAZAO,_loc2_);
               break;
            case PipeConstants.TISHENGPINZHI:
               sendNotification(HUXINYAO_TISHEGN,_loc2_);
               break;
            case PipeConstants.DAKAI_ZUOQI_ZHUANGBEI_DAZAO_MIANBAN:
               sendNotification(DAKAI_ZUOQI_ZHUANGBEI_DAZAO_MIANBAN,_loc2_);
               break;
            case PipeConstants.SHOW_XUNZHANG_HECHENG_PANEL:
               sendNotification(SHOW_XUNZHANG_HECHENG_PANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

