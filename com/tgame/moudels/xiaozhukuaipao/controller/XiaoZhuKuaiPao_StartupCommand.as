package com.tgame.moudels.xiaozhukuaipao.controller
{
   import com.tgame.moudels.xiaozhukuaipao.model.XiaoZhuKuaiPao_MsgReceivedProxy;
   import com.tgame.moudels.xiaozhukuaipao.model.XiaoZhuKuaiPao_MsgSendProxy;
   import com.tgame.moudels.xiaozhukuaipao.view.XiaoZhuKuaiPao_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XiaoZhuKuaiPao_StartupCommand extends SimpleCommand
   {
      
      public function XiaoZhuKuaiPao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XiaoZhuKuaiPao_MsgReceivedProxy());
         facade.registerProxy(new XiaoZhuKuaiPao_MsgSendProxy());
         facade.registerMediator(new XiaoZhuKuaiPao_Mediator());
      }
   }
}

