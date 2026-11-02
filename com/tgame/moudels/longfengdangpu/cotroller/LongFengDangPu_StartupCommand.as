package com.tgame.moudels.longfengdangpu.cotroller
{
   import com.tgame.moudels.longfengdangpu.model.LongFengDangPu_MsgReceivedProxy;
   import com.tgame.moudels.longfengdangpu.model.LongFengDangPu_MsgSendProxy;
   import com.tgame.moudels.longfengdangpu.view.LongFengDangPu_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LongFengDangPu_StartupCommand extends SimpleCommand
   {
      
      public function LongFengDangPu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new LongFengDangPu_MsgReceivedProxy());
         facade.registerProxy(new LongFengDangPu_MsgSendProxy());
         facade.registerMediator(new LongFengDangPu_Mediator());
      }
   }
}

