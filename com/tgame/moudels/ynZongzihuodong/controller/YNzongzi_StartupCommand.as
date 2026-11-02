package com.tgame.moudels.ynZongzihuodong.controller
{
   import com.tgame.moudels.ynZongzihuodong.model.YNzongzi_MsgReceivedProxy;
   import com.tgame.moudels.ynZongzihuodong.model.YNzongzi_MsgSenderProxy;
   import com.tgame.moudels.ynZongzihuodong.view.YNzongzi_ZhiZuo_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNzongzi_StartupCommand extends SimpleCommand
   {
      
      public function YNzongzi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new YNzongzi_ZhiZuo_Mediator());
         facade.registerProxy(new YNzongzi_MsgReceivedProxy());
         facade.registerProxy(new YNzongzi_MsgSenderProxy());
      }
   }
}

