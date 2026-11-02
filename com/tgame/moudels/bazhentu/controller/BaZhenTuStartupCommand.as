package com.tgame.moudels.bazhentu.controller
{
   import com.tgame.moudels.bazhentu.model.BaZhenTu_MsgReceivedProxy;
   import com.tgame.moudels.bazhentu.model.BaZhenTu_MsgSenderProxy;
   import com.tgame.moudels.bazhentu.view.BaZhenTu_Mediator;
   import com.tgame.moudels.bazhentu.view.BaZhenTu_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BaZhenTuStartupCommand extends SimpleCommand
   {
      
      public function BaZhenTuStartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new BaZhenTu_MsgSenderProxy());
         facade.registerProxy(new BaZhenTu_MsgReceivedProxy());
         facade.registerMediator(new BaZhenTu_Mediator());
         facade.registerMediator(new BaZhenTu_TargetMediator());
      }
   }
}

