package com.tgame.moudels.shengsifu.controller
{
   import com.tgame.moudels.shengsifu.model.ShengSiFu_MsgReceivedProxy;
   import com.tgame.moudels.shengsifu.model.ShengSiFu_MsgSenderProxy;
   import com.tgame.moudels.shengsifu.view.ShengSiFu_Mediator;
   import com.tgame.moudels.shengsifu.view.ShengSiFu_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ShengSiFu_StartupCommand extends SimpleCommand
   {
      
      public function ShengSiFu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ShengSiFu_MsgSenderProxy());
         facade.registerProxy(new ShengSiFu_MsgReceivedProxy());
         facade.registerMediator(new ShengSiFu_Mediator());
         facade.registerMediator(new ShengSiFu_TargetMediator());
      }
   }
}

