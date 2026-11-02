package com.tgame.moudels.aojianshenjiangji.controller
{
   import com.tgame.moudels.aojianshenjiangji.model.AoJianShenJiangJi_MsgReceivedProxy;
   import com.tgame.moudels.aojianshenjiangji.model.AoJianShenJiangJi_MsgSenderProxy;
   import com.tgame.moudels.aojianshenjiangji.view.AoJianShenJiangJi_Mediator;
   import com.tgame.moudels.aojianshenjiangji.view.AoJianShenJiangJi_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class AoJianShenJiangJi_StartupCommand extends SimpleCommand
   {
      
      public function AoJianShenJiangJi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new AoJianShenJiangJi_MsgReceivedProxy());
         facade.registerProxy(new AoJianShenJiangJi_MsgSenderProxy());
         facade.registerMediator(new AoJianShenJiangJi_Mediator());
         facade.registerMediator(new AoJianShenJiangJi_TargetPanelMediator());
      }
   }
}

