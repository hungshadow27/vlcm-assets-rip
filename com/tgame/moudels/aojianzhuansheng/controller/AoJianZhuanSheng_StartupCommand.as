package com.tgame.moudels.aojianzhuansheng.controller
{
   import com.tgame.moudels.aojianzhuansheng.model.AoJianZhuanSheng_MsgReceivedProxy;
   import com.tgame.moudels.aojianzhuansheng.model.AoJianZhuanSheng_MsgSenderProxy;
   import com.tgame.moudels.aojianzhuansheng.view.AoJianZhuanSheng_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class AoJianZhuanSheng_StartupCommand extends SimpleCommand
   {
      
      public function AoJianZhuanSheng_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new AoJianZhuanSheng_MsgSenderProxy());
         facade.registerProxy(new AoJianZhuanSheng_MsgReceivedProxy());
         facade.registerMediator(new AoJianZhuanSheng_Mediator());
      }
   }
}

