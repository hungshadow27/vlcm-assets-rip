package com.tgame.moudels.kuafuzhan.controller
{
   import com.tgame.moudels.kuafuzhan.Kuafuzhan_ApplicationFacade;
   import com.tgame.moudels.kuafuzhan.model.Kuafuzhan_MsgReceivedProxy;
   import com.tgame.moudels.kuafuzhan.model.Kuafuzhan_MsgSenderProxy;
   import com.tgame.moudels.kuafuzhan.view.Kuafuzhan_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Kuafuzhan_StartupCommand extends SimpleCommand
   {
      
      public function Kuafuzhan_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Kuafuzhan_MsgReceivedProxy());
         facade.registerProxy(new Kuafuzhan_MsgSenderProxy());
         facade.registerCommand(Kuafuzhan_ApplicationFacade.NPC_REQ_FUNCTION,Kuaifuzhan_ToKuafuLunjiantaiCommand);
         facade.registerMediator(new Kuafuzhan_Mediator());
      }
   }
}

