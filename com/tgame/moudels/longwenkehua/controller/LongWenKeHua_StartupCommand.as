package com.tgame.moudels.longwenkehua.controller
{
   import com.tgame.moudels.longwenkehua.model.LongWenKeHua_MsgReceivedProxy;
   import com.tgame.moudels.longwenkehua.model.LongWenKeHua_MsgSenderProxy;
   import com.tgame.moudels.longwenkehua.view.LongWenKeHua_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LongWenKeHua_StartupCommand extends SimpleCommand
   {
      
      public function LongWenKeHua_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new LongWenKeHua_MsgReceivedProxy());
         facade.registerProxy(new LongWenKeHua_MsgSenderProxy());
         facade.registerMediator(new LongWenKeHua_Mediator());
      }
   }
}

