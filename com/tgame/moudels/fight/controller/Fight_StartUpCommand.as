package com.tgame.moudels.fight.controller
{
   import com.tgame.moudels.fight.Fight_ApplicationFacade;
   import com.tgame.moudels.fight.model.Fight_BuffProxy;
   import com.tgame.moudels.fight.model.Fight_LianZhanProxy;
   import com.tgame.moudels.fight.model.Fight_MsgReceivedProxy;
   import com.tgame.moudels.fight.model.Fight_MsgSenderProxy;
   import com.tgame.moudels.fight.model.Fight_proxy;
   import com.tgame.moudels.fight.view.Fight_AnqiActiveMediator;
   import com.tgame.moudels.fight.view.Fight_AnqiMediator;
   import com.tgame.moudels.fight.view.Fight_AnqiOtherMediator;
   import com.tgame.moudels.fight.view.Fight_PKMediator;
   import com.tgame.moudels.fight.view.Fight_PipeMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Fight_StartUpCommand extends SimpleCommand
   {
      
      public function Fight_StartUpCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Fight_proxy());
         facade.registerProxy(new Fight_MsgReceivedProxy());
         facade.registerProxy(new Fight_MsgSenderProxy());
         facade.registerProxy(new Fight_LianZhanProxy());
         facade.registerProxy(new Fight_BuffProxy());
         facade.registerCommand(Fight_ApplicationFacade.HIT_CHAR,Fight_HitCharCommand);
         facade.registerCommand(Fight_ApplicationFacade.ADD_BUFF,Fight_AddBuffCommand);
         facade.registerCommand(Fight_ApplicationFacade.REMOVE_BUFF,Fight_RemoveBuffCommand);
         facade.registerMediator(new Fight_PipeMediator());
         facade.registerMediator(new Fight_PKMediator());
         facade.registerMediator(new Fight_AnqiMediator());
         facade.registerMediator(new Fight_AnqiOtherMediator());
         facade.registerMediator(new Fight_AnqiActiveMediator());
      }
   }
}

