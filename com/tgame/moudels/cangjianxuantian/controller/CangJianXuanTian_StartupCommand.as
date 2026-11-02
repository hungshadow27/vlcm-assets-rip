package com.tgame.moudels.cangjianxuantian.controller
{
   import com.tgame.moudels.cangjianxuantian.model.CangJianXuanTian_MsgReceivedProxy;
   import com.tgame.moudels.cangjianxuantian.model.CangJianXuanTian_MsgSenderProxy;
   import com.tgame.moudels.cangjianxuantian.view.CangJianXuanTian_Mediator;
   import com.tgame.moudels.cangjianxuantian.view.CangJianXuanTian_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class CangJianXuanTian_StartupCommand extends SimpleCommand
   {
      
      public function CangJianXuanTian_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new CangJianXuanTian_MsgReceivedProxy());
         facade.registerProxy(new CangJianXuanTian_MsgSenderProxy());
         facade.registerMediator(new CangJianXuanTian_Mediator());
         facade.registerMediator(new CangJianXuanTian_TargetPanelMediator());
      }
   }
}

