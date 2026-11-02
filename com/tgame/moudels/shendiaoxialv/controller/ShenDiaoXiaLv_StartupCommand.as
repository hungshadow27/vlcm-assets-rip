package com.tgame.moudels.shendiaoxialv.controller
{
   import com.tgame.moudels.shendiaoxialv.model.ShenDiaoXiaLv_MsgReceivedProxy;
   import com.tgame.moudels.shendiaoxialv.model.ShenDiaoXiaLv_MsgSenderProxy;
   import com.tgame.moudels.shendiaoxialv.view.ShenDiaoXiaLv_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ShenDiaoXiaLv_StartupCommand extends SimpleCommand
   {
      
      public function ShenDiaoXiaLv_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ShenDiaoXiaLv_MsgReceivedProxy());
         facade.registerProxy(new ShenDiaoXiaLv_MsgSenderProxy());
         facade.registerMediator(new ShenDiaoXiaLv_Mediator());
      }
   }
}

