package com.tgame.moudels.xingyunzhuanzhuanle.controller
{
   import com.tgame.moudels.xingyunzhuanzhuanle.model.XingYunZhuanZhuanLe_MsgReceivedProxy;
   import com.tgame.moudels.xingyunzhuanzhuanle.model.XingYunZhuanZhuanLe_MsgSenderProxy;
   import com.tgame.moudels.xingyunzhuanzhuanle.view.XingYunZhuanZhuanLe_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XingYunZhuanZhuanLe_StartupCommand extends SimpleCommand
   {
      
      public function XingYunZhuanZhuanLe_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XingYunZhuanZhuanLe_MsgReceivedProxy());
         facade.registerProxy(new XingYunZhuanZhuanLe_MsgSenderProxy());
         facade.registerMediator(new XingYunZhuanZhuanLe_Mediator());
      }
   }
}

