package com.tgame.moudels.fuWenKeHua.controller
{
   import com.tgame.moudels.fuWenKeHua.model.FuWenKeHua_MsgReceivedProxy;
   import com.tgame.moudels.fuWenKeHua.model.FuWenKeHua_MsgSenderProxy;
   import com.tgame.moudels.fuWenKeHua.view.FuWenKeHua_Mediator;
   import com.tgame.moudels.fuWenKeHua.view.FuWenKeHua_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class FuWenKeHua_StartupCommand extends SimpleCommand
   {
      
      public function FuWenKeHua_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new FuWenKeHua_MsgReceivedProxy());
         facade.registerProxy(new FuWenKeHua_MsgSenderProxy());
         facade.registerMediator(new FuWenKeHua_Mediator());
         facade.registerMediator(new FuWenKeHua_TargetMediator());
      }
   }
}

