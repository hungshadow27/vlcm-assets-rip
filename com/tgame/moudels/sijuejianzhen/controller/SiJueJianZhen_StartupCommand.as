package com.tgame.moudels.sijuejianzhen.controller
{
   import com.tgame.moudels.sijuejianzhen.model.SiJueJianZhen_MsgReceivedProxy;
   import com.tgame.moudels.sijuejianzhen.model.SiJueJianZhen_MsgSenderProxy;
   import com.tgame.moudels.sijuejianzhen.view.SiJueJianZhen_Mediator;
   import com.tgame.moudels.sijuejianzhen.view.SiJueJianZhen_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class SiJueJianZhen_StartupCommand extends SimpleCommand
   {
      
      public function SiJueJianZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new SiJueJianZhen_MsgSenderProxy());
         facade.registerProxy(new SiJueJianZhen_MsgReceivedProxy());
         facade.registerMediator(new SiJueJianZhen_Mediator());
         facade.registerMediator(new SiJueJianZhen_TargetMediator());
      }
   }
}

