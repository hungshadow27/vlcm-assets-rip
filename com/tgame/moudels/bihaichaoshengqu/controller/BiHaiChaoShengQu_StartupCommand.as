package com.tgame.moudels.bihaichaoshengqu.controller
{
   import com.tgame.moudels.bihaichaoshengqu.model.BiHaiChaoShengQu_MsgReceivedProxy;
   import com.tgame.moudels.bihaichaoshengqu.model.BiHaiChaoShengQu_MsgSenderProxy;
   import com.tgame.moudels.bihaichaoshengqu.view.BiHaiChaoShengQu_Mediator;
   import com.tgame.moudels.bihaichaoshengqu.view.BiHaiChaoShengQu_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BiHaiChaoShengQu_StartupCommand extends SimpleCommand
   {
      
      public function BiHaiChaoShengQu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new BiHaiChaoShengQu_MsgSenderProxy());
         facade.registerProxy(new BiHaiChaoShengQu_MsgReceivedProxy());
         facade.registerMediator(new BiHaiChaoShengQu_Mediator());
         facade.registerMediator(new BiHaiChaoShengQu_TargetMediator());
      }
   }
}

