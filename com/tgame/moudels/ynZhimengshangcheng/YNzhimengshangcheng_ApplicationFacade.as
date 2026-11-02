package com.tgame.moudels.ynZhimengshangcheng
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.ynZhimengshangcheng.controller.YNzhimengshangcheng_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class YNzhimengshangcheng_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.ynZhimengshangcheng.YNzhimengshangcheng_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const SHOW_YNWANGZHEZHIBANGHUODONGPANEL:String = "SHOW_YNWANGZHEZHIBANGHUODONGPANEL";
      
      public static const SHOW_YNZHIMENGQIANZHUANGPANEL:String = "SHOW_YNZHIMENGQIANZHUANGPANEL";
      
      public function YNzhimengshangcheng_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_YNZHIMENGSHANGCHENG,PipeConstants.SHOW_YNWANGZHEZHIBANGHUODONGPANEL,PipeConstants.SHOW_YNZHIMENGQIANZHUANGPANEL],this.handlePipeMessage,YNzhimengshangcheng_ApplicationFacade);
      }
      
      public static function getInstance() : YNzhimengshangcheng_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new YNzhimengshangcheng_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as YNzhimengshangcheng_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,YNzhimengshangcheng_StartupCommand);
      }
      
      public function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_YNZHIMENGSHANGCHENG:
               this.startup();
               break;
            case PipeConstants.SHOW_YNWANGZHEZHIBANGHUODONGPANEL:
               sendNotification(SHOW_YNWANGZHEZHIBANGHUODONGPANEL,_loc2_);
               break;
            case PipeConstants.SHOW_YNZHIMENGQIANZHUANGPANEL:
               sendNotification(SHOW_YNZHIMENGQIANZHUANGPANEL,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

