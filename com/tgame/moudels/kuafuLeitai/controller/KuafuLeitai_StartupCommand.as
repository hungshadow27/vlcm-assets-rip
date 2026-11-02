package com.tgame.moudels.kuafuLeitai.controller
{
   import com.tgame.moudels.kuafuLeitai.KuafuLeitai_ApplicationFacade;
   import com.tgame.moudels.kuafuLeitai.model.KuafuLeitai_MsgReceivedProxy;
   import com.tgame.moudels.kuafuLeitai.model.KuafuLeitai_MsgSenderProxy;
   import com.tgame.moudels.kuafuLeitai.view.KuafuLeitai_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class KuafuLeitai_StartupCommand extends SimpleCommand
   {
      
      public function KuafuLeitai_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new KuafuLeitai_MsgReceivedProxy());
         facade.registerProxy(new KuafuLeitai_MsgSenderProxy());
         facade.registerCommand(KuafuLeitai_ApplicationFacade.NPC_REQ_FUNCTION,KuaifuLeitai_ToKuafuLunjiantaiCommand);
         facade.registerMediator(new KuafuLeitai_Mediator());
      }
   }
}

