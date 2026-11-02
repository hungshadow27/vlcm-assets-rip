package com.tgame.moudels.shuXingDaZaoKa.controller
{
   import com.tgame.moudels.shuXingDaZaoKa.model.ShuXingDaZaoKa_MsgReceivedProxy;
   import com.tgame.moudels.shuXingDaZaoKa.model.ShuXingDaZaoKa_MsgSenderProxy;
   import com.tgame.moudels.shuXingDaZaoKa.view.ShuXingDaZaoKa_ShuXingDaZaoKaMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ShuxingDaZaoKa_StartupCommand extends SimpleCommand
   {
      
      public function ShuxingDaZaoKa_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ShuXingDaZaoKa_MsgSenderProxy());
         facade.registerProxy(new ShuXingDaZaoKa_MsgReceivedProxy());
         facade.registerMediator(new ShuXingDaZaoKa_ShuXingDaZaoKaMediator());
      }
   }
}

