package com.tgame.moudels.lingxiyizhi.controller
{
   import com.tgame.moudels.lingxiyizhi.model.LingXiYiZhi_MsgReceivedProxy;
   import com.tgame.moudels.lingxiyizhi.model.LingXiYiZhi_MsgSenderProxy;
   import com.tgame.moudels.lingxiyizhi.view.LingXiYiZhi_Mediator;
   import com.tgame.moudels.lingxiyizhi.view.LingXiYiZhi_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LingXiYiZhi_StartupCommand extends SimpleCommand
   {
      
      public function LingXiYiZhi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new LingXiYiZhi_MsgSenderProxy());
         facade.registerProxy(new LingXiYiZhi_MsgReceivedProxy());
         facade.registerMediator(new LingXiYiZhi_Mediator());
         facade.registerMediator(new LingXiYiZhi_TargetMediator());
      }
   }
}

