package com.tgame.moudels.ChuanGongWuXue.controller
{
   import com.tgame.moudels.ChuanGongWuXue.model.ChuanGongWuXue_MsgReceivedProxy;
   import com.tgame.moudels.ChuanGongWuXue.model.ChuanGongWuXue_MsgSenderProxy;
   import com.tgame.moudels.ChuanGongWuXue.view.ChuanGongWuXue_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ChuanGongWuXue_StartupCommand extends SimpleCommand
   {
      
      public function ChuanGongWuXue_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ChuanGongWuXue_MsgReceivedProxy());
         facade.registerProxy(new ChuanGongWuXue_MsgSenderProxy());
         facade.registerMediator(new ChuanGongWuXue_Mediator());
      }
   }
}

