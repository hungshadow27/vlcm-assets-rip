package com.tgame.moudels.dantiaowang.controller
{
   import com.tgame.moudels.dantiaowang.model.DanTiaoWang_MsgReceivedProxy;
   import com.tgame.moudels.dantiaowang.model.DanTiaoWang_MsgSenderProxy;
   import com.tgame.moudels.dantiaowang.view.DanTiaoWang_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class DanTiaoWang_StartupCommand extends SimpleCommand
   {
      
      public function DanTiaoWang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new DanTiaoWang_MsgReceivedProxy());
         facade.registerProxy(new DanTiaoWang_MsgSenderProxy());
         facade.registerMediator(new DanTiaoWang_Mediator());
      }
   }
}

