package com.tgame.moudels.guiliuzhen.controller
{
   import com.tgame.moudels.guiliuzhen.model.GuiLiuZhen_MsgReceivedProxy;
   import com.tgame.moudels.guiliuzhen.model.GuiLiuZhen_MsgSenderProxy;
   import com.tgame.moudels.guiliuzhen.view.GuiLiuZhen_Mediator;
   import com.tgame.moudels.guiliuzhen.view.GuiLiuZhen_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class GuiLiuZhen_StartupCommand extends SimpleCommand
   {
      
      public function GuiLiuZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new GuiLiuZhen_MsgReceivedProxy());
         facade.registerProxy(new GuiLiuZhen_MsgSenderProxy());
         facade.registerMediator(new GuiLiuZhen_Mediator());
         facade.registerMediator(new GuiLiuZhen_TargetMediator());
      }
   }
}

