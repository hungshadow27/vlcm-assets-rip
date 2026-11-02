package com.tgame.moudels.aojianfeisheng.controller
{
   import com.tgame.moudels.aojianfeisheng.model.AoJianFeiSheng_MsgReceivedProxy;
   import com.tgame.moudels.aojianfeisheng.model.AoJianFeiSheng_MsgSendProxy;
   import com.tgame.moudels.aojianfeisheng.view.AoJianFeiSheng_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class AoJianFeiSheng_StartupCommand extends SimpleCommand
   {
      
      public function AoJianFeiSheng_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new AoJianFeiSheng_MsgReceivedProxy());
         facade.registerProxy(new AoJianFeiSheng_MsgSendProxy());
         facade.registerMediator(new AoJianFeiSheng_Mediator());
      }
   }
}

