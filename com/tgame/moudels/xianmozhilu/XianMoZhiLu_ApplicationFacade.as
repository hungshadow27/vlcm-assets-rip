package com.tgame.moudels.xianmozhilu
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.xianmozhilu.controller.XianMoZhiLu_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class XianMoZhiLu_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.xianmozhilu.XianMoZhiLu_ApplicationFacade";
      
      public static const GET_XIANMOZHILU_PANEL:String = "GET_XIANMOZHILU_PANEL";
      
      public static const GET_ZHONGZU_PANEL:String = "GET_ZHONGZU_PANEL";
      
      public static const NPC_REQ_FUNCTION:String = "NPC_REQ_FUNCTION";
      
      public static const GOODS_CHANGED:String = "GOODS_CHANGED";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const UI_ZHONGZUJIEMIAN_YICHU_CLICK:String = "UI_ZHONGZUJIEMIAN_YICHU_CLICK";
      
      public static const UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK:String = "UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK";
      
      public static const UI_ZHONGZUJIEMIAN_SKILL_DRAG:String = "UI_ZHONGZUJIEMIAN_SKILL_DRAG";
      
      public static const SHOW_ZHONGZU_PLANE:String = "SHOW_ZHONGZU_PLANE";
      
      public function XianMoZhiLu_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_XIANMOZHILU,PipeConstants.GET_XIANMOZHILU_PANEL,PipeConstants.GET_ZHONGZU_PANEL,PipeConstants.NPC_REQ_FUNCTION,PipeConstants.GOODS_CHANGED,PipeConstants.UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK,PipeConstants.UI_ZHONGZUJIEMIAN_YICHU_CLICK,PipeConstants.UI_ZHONGZUJIEMIAN_SKILL_DRAG],this.handlePipeMessage,XianMoZhiLu_ApplicationFacade);
      }
      
      public static function getInstance() : XianMoZhiLu_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new XianMoZhiLu_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as XianMoZhiLu_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,XianMoZhiLu_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc2_:String = param1.name;
         _loc3_ = param1.body;
         switch(_loc2_)
         {
            case PipeConstants.STARTUP_XIANMOZHILU:
               this.startup();
               break;
            case PipeConstants.GET_XIANMOZHILU_PANEL:
               sendNotification(GET_XIANMOZHILU_PANEL);
               break;
            case PipeConstants.GET_ZHONGZU_PANEL:
               sendNotification(GET_ZHONGZU_PANEL,_loc3_);
               break;
            case PipeConstants.NPC_REQ_FUNCTION:
               _loc4_ = Number(_loc3_);
               if(_loc4_ == NpcFunctionType.TRANSPORT)
               {
                  sendNotification(NPC_REQ_FUNCTION);
               }
               break;
            case PipeConstants.GOODS_CHANGED:
               sendNotification(GOODS_CHANGED);
               break;
            case PipeConstants.UI_ZHONGZUJIEMIAN_YICHU_CLICK:
               sendNotification(UI_ZHONGZUJIEMIAN_YICHU_CLICK);
               break;
            case PipeConstants.UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK:
               sendNotification(UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK,_loc3_);
               break;
            case PipeConstants.UI_ZHONGZUJIEMIAN_SKILL_DRAG:
               sendNotification(UI_ZHONGZUJIEMIAN_SKILL_DRAG,_loc3_);
         }
      }
      
      public function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

