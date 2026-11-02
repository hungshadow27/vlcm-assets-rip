package com.tgame.moudels.ynAojianzhizao.controller
{
   import com.tgame.moudels.ynAojianzhizao.model.YNAojianzhizao_MsgReceivedProxy;
   import com.tgame.moudels.ynAojianzhizao.model.YNAojianzhizao_MsgSendProxy;
   import com.tgame.moudels.ynAojianzhizao.view.YNAojianzhizao_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNAojianZhizao_StartupCommand extends SimpleCommand
   {
      
      public function YNAojianZhizao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNAojianzhizao_MsgReceivedProxy());
         facade.registerProxy(new YNAojianzhizao_MsgSendProxy());
         facade.registerMediator(new YNAojianzhizao_Mediator());
      }
   }
}

