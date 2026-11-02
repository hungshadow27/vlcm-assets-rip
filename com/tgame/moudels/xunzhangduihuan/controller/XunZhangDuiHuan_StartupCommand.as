package com.tgame.moudels.xunzhangduihuan.controller
{
   import com.tgame.moudels.xunzhangduihuan.model.XunZhangDuiHuan_MsgReceivedProxy;
   import com.tgame.moudels.xunzhangduihuan.model.XunZhangDuiHuan_MsgSenderProxy;
   import com.tgame.moudels.xunzhangduihuan.view.XunZhangDuiHuan_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XunZhangDuiHuan_StartupCommand extends SimpleCommand
   {
      
      public function XunZhangDuiHuan_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XunZhangDuiHuan_MsgReceivedProxy());
         facade.registerProxy(new XunZhangDuiHuan_MsgSenderProxy());
         facade.registerMediator(new XunZhangDuiHuan_Mediator());
      }
   }
}

