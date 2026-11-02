package com.tgame.moudels.refreshPoint.controller
{
   import com.tgame.moudels.refreshPoint.model.RefreshPoint_MsgReceivedProxy;
   import com.tgame.moudels.refreshPoint.model.RefreshPoint_MsgSendProxy;
   import com.tgame.moudels.refreshPoint.view.RefreshPoint_RefreshPointMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class RefreshPoint_StartCommand extends SimpleCommand
   {
      
      public function RefreshPoint_StartCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new RefreshPoint_MsgSendProxy());
         facade.registerProxy(new RefreshPoint_MsgReceivedProxy());
         facade.registerMediator(new RefreshPoint_RefreshPointMediator());
      }
   }
}

