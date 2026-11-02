package com.tgame.moudels.doudizhu.controller
{
   import com.tgame.moudels.doudizhu.model.DouDiZhu_MsgReceivedProxy;
   import com.tgame.moudels.doudizhu.model.DouDiZhu_MsgSendProxy;
   import com.tgame.moudels.doudizhu.view.DouDiZhu_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class DouDiZhu_StartupCommand extends SimpleCommand
   {
      
      public function DouDiZhu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new DouDiZhu_MsgReceivedProxy());
         facade.registerProxy(new DouDiZhu_MsgSendProxy());
         facade.registerMediator(new DouDiZhu_Mediator());
      }
   }
}

