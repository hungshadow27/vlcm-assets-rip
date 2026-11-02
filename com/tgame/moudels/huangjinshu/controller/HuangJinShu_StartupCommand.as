package com.tgame.moudels.huangjinshu.controller
{
   import com.tgame.moudels.huangjinshu.model.HuangJinShu_MsgReceivedProxy;
   import com.tgame.moudels.huangjinshu.model.HuangJinShu_MsgSenderProxy;
   import com.tgame.moudels.huangjinshu.view.HuangJinShuee_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class HuangJinShu_StartupCommand extends SimpleCommand
   {
      
      public function HuangJinShu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new HuangJinShu_MsgReceivedProxy());
         facade.registerProxy(new HuangJinShu_MsgSenderProxy());
         facade.registerMediator(new HuangJinShuee_Mediator());
      }
   }
}

