package com.tgame.moudels.duguqiubai.controller
{
   import com.tgame.moudels.duguqiubai.model.DuGuQiuBai_MsgReceivedProxy;
   import com.tgame.moudels.duguqiubai.model.DuGuQiuBai_MsgSenderProxy;
   import com.tgame.moudels.duguqiubai.view.DuGuQiuBai_Mediator;
   import com.tgame.moudels.duguqiubai.view.DuGuQiuBai_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class DuGuQiuBai_StartupCommand extends SimpleCommand
   {
      
      public function DuGuQiuBai_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new DuGuQiuBai_MsgSenderProxy());
         facade.registerProxy(new DuGuQiuBai_MsgReceivedProxy());
         facade.registerMediator(new DuGuQiuBai_Mediator());
         facade.registerMediator(new DuGuQiuBai_TargetMediator());
      }
   }
}

