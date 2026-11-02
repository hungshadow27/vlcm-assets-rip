package com.tgame.moudels.bangpairongyutarget.controller
{
   import com.tgame.moudels.bangpairongyutarget.model.BangPaiRongYuTarget_MsgReceivedProxy;
   import com.tgame.moudels.bangpairongyutarget.model.BangPaiRongYuTarget_MsgSenderProxy;
   import com.tgame.moudels.bangpairongyutarget.view.BangPaiRongYuTarget_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BangPaiRongYuTarget_StartupCommand extends SimpleCommand
   {
      
      public function BangPaiRongYuTarget_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new BangPaiRongYuTarget_MsgReceivedProxy());
         facade.registerProxy(new BangPaiRongYuTarget_MsgSenderProxy());
         facade.registerMediator(new BangPaiRongYuTarget_Mediator());
      }
   }
}

