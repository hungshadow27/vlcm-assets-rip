package com.tgame.moudels.yurenjie.controller
{
   import com.tgame.moudels.yurenjie.model.YuRenJie_MsgReceivedProxy;
   import com.tgame.moudels.yurenjie.model.YuRenJie_MsgSenderProxy;
   import com.tgame.moudels.yurenjie.view.YuRenJie_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YuRenJie_StartupCommand extends SimpleCommand
   {
      
      public function YuRenJie_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YuRenJie_MsgReceivedProxy());
         facade.registerProxy(new YuRenJie_MsgSenderProxy());
         facade.registerMediator(new YuRenJie_Mediator());
      }
   }
}

