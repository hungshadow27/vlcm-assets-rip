package com.tgame.moudels.xuanXiangZhen.controller
{
   import com.tgame.moudels.xuanXiangZhen.model.XuanXiangZhen_MsgReceivedProxy;
   import com.tgame.moudels.xuanXiangZhen.model.XuanXiangZhen_MsgSenderProxy;
   import com.tgame.moudels.xuanXiangZhen.view.XuanXiangZhen_Mediator;
   import com.tgame.moudels.xuanXiangZhen.view.XuanXiangZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XuanXiangZhen_StartupCommand extends SimpleCommand
   {
      
      public function XuanXiangZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XuanXiangZhen_MsgReceivedProxy());
         facade.registerProxy(new XuanXiangZhen_MsgSenderProxy());
         facade.registerMediator(new XuanXiangZhen_Mediator());
         facade.registerMediator(new XuanXiangZhen_TargetPanelMediator());
      }
   }
}

