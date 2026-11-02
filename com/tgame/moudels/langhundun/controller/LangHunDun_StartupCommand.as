package com.tgame.moudels.langhundun.controller
{
   import com.tgame.moudels.langhundun.model.LangHunDun_MsgReceivedProxy;
   import com.tgame.moudels.langhundun.model.LangHunDun_MsgSenderProxy;
   import com.tgame.moudels.langhundun.view.LangHunDun_Mediator;
   import com.tgame.moudels.langhundun.view.LangHunDun_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LangHunDun_StartupCommand extends SimpleCommand
   {
      
      public function LangHunDun_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new LangHunDun_MsgSenderProxy());
         facade.registerProxy(new LangHunDun_MsgReceivedProxy());
         facade.registerMediator(new LangHunDun_Mediator());
         facade.registerMediator(new LangHunDun_TargetMediator());
      }
   }
}

