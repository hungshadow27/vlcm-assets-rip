package com.tgame.moudels.dizaizhen.controller
{
   import com.tgame.moudels.dizaizhen.model.DiZaiZhen_MsgReceivedProxy;
   import com.tgame.moudels.dizaizhen.model.DiZaiZhen_MsgSenderProxy;
   import com.tgame.moudels.dizaizhen.view.DiZaiZhen_Mediator;
   import com.tgame.moudels.dizaizhen.view.DiZaiZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class DiZaiZhen_StartupCommand extends SimpleCommand
   {
      
      public function DiZaiZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new DiZaiZhen_MsgReceivedProxy());
         facade.registerProxy(new DiZaiZhen_MsgSenderProxy());
         facade.registerMediator(new DiZaiZhen_Mediator());
         facade.registerMediator(new DiZaiZhen_TargetPanelMediator());
      }
   }
}

