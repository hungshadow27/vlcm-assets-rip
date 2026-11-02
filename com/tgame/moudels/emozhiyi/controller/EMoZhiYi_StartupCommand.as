package com.tgame.moudels.emozhiyi.controller
{
   import com.tgame.moudels.emozhiyi.model.EMoZhiYi_MsgReceivedProxy;
   import com.tgame.moudels.emozhiyi.model.EMoZhiYi_MsgSenderProxy;
   import com.tgame.moudels.emozhiyi.view.EMoZhiYi_MainMediator;
   import com.tgame.moudels.emozhiyi.view.EMoZhiYi_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class EMoZhiYi_StartupCommand extends SimpleCommand
   {
      
      public function EMoZhiYi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new EMoZhiYi_MsgReceivedProxy());
         facade.registerProxy(new EMoZhiYi_MsgSenderProxy());
         facade.registerMediator(new EMoZhiYi_MainMediator());
         facade.registerMediator(new EMoZhiYi_TargetMediator());
      }
   }
}

