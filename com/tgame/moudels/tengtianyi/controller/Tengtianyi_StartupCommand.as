package com.tgame.moudels.tengtianyi.controller
{
   import com.tgame.moudels.tengtianyi.model.Tengtianyi_MsgReceivedProxy;
   import com.tgame.moudels.tengtianyi.model.Tengtianyi_MsgSenderProxy;
   import com.tgame.moudels.tengtianyi.view.Tengtianyi_MainMediator;
   import com.tgame.moudels.tengtianyi.view.Tengtianyi_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Tengtianyi_StartupCommand extends SimpleCommand
   {
      
      public function Tengtianyi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Tengtianyi_MsgReceivedProxy());
         facade.registerProxy(new Tengtianyi_MsgSenderProxy());
         facade.registerMediator(new Tengtianyi_MainMediator());
         facade.registerMediator(new Tengtianyi_TargetMediator());
      }
   }
}

