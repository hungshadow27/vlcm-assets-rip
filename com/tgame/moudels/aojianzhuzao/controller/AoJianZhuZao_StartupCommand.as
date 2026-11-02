package com.tgame.moudels.aojianzhuzao.controller
{
   import com.tgame.moudels.aojianzhuzao.model.AoJianZhuZao_MsgReceivedProxy;
   import com.tgame.moudels.aojianzhuzao.model.AoJianZhuZao_MsgSenderProxy;
   import com.tgame.moudels.aojianzhuzao.view.AoJianZhuZao_AoJianZhuZaoMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class AoJianZhuZao_StartupCommand extends SimpleCommand
   {
      
      public function AoJianZhuZao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new AoJianZhuZao_AoJianZhuZaoMediator());
         facade.registerProxy(new AoJianZhuZao_MsgReceivedProxy());
         facade.registerProxy(new AoJianZhuZao_MsgSenderProxy());
      }
   }
}

