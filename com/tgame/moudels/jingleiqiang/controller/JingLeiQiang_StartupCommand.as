package com.tgame.moudels.jingleiqiang.controller
{
   import com.tgame.moudels.jingleiqiang.model.JingLeiQiang_MsgReceivedProxy;
   import com.tgame.moudels.jingleiqiang.model.JingLeiQiang_MsgSenderProxy;
   import com.tgame.moudels.jingleiqiang.view.JingLeiQiang_Mediator;
   import com.tgame.moudels.jingleiqiang.view.JingLeiQiang_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class JingLeiQiang_StartupCommand extends SimpleCommand
   {
      
      public function JingLeiQiang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new JingLeiQiang_MsgSenderProxy());
         facade.registerProxy(new JingLeiQiang_MsgReceivedProxy());
         facade.registerMediator(new JingLeiQiang_Mediator());
         facade.registerMediator(new JingLeiQiang_TargetMediator());
      }
   }
}

