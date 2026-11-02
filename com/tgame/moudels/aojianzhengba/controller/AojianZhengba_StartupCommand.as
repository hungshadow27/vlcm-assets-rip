package com.tgame.moudels.aojianzhengba.controller
{
   import com.tgame.moudels.aojianzhengba.model.AojianZhengba_MsgReceivedProxy;
   import com.tgame.moudels.aojianzhengba.model.AojianZhengba_MsgSenderProxy;
   import com.tgame.moudels.aojianzhengba.view.AojianZhengba_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class AojianZhengba_StartupCommand extends SimpleCommand
   {
      
      public function AojianZhengba_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new AojianZhengba_MsgReceivedProxy());
         facade.registerProxy(new AojianZhengba_MsgSenderProxy());
         facade.registerMediator(new AojianZhengba_Mediator());
      }
   }
}

