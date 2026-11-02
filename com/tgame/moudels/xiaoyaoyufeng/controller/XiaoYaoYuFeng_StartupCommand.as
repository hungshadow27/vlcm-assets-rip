package com.tgame.moudels.xiaoyaoyufeng.controller
{
   import com.tgame.moudels.xiaoyaoyufeng.model.XiaoYaoYuFeng_MsgReceivedProxy;
   import com.tgame.moudels.xiaoyaoyufeng.model.XiaoYaoYuFeng_MsgSenderProxy;
   import com.tgame.moudels.xiaoyaoyufeng.view.XiaoYaoYuFengJiNengSheZhi_Mediator;
   import com.tgame.moudels.xiaoyaoyufeng.view.XiaoYaoYuFeng_Mediator;
   import com.tgame.moudels.xiaoyaoyufeng.view.XiaoYaoYuFeng_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XiaoYaoYuFeng_StartupCommand extends SimpleCommand
   {
      
      public function XiaoYaoYuFeng_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XiaoYaoYuFeng_MsgReceivedProxy());
         facade.registerProxy(new XiaoYaoYuFeng_MsgSenderProxy());
         facade.registerMediator(new XiaoYaoYuFeng_Mediator());
         facade.registerMediator(new XiaoYaoYuFeng_TargetPanelMediator());
         facade.registerMediator(new XiaoYaoYuFengJiNengSheZhi_Mediator());
      }
   }
}

