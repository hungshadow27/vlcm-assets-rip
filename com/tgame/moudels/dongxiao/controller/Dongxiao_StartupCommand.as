package com.tgame.moudels.dongxiao.controller
{
   import com.tgame.moudels.dongxiao.model.Dongxiao_MsgReceivedProxy;
   import com.tgame.moudels.dongxiao.model.Dongxiao_MsgSenderProxy;
   import com.tgame.moudels.dongxiao.view.Dongxiao_MaincharDongxiaoPlaneMediator;
   import com.tgame.moudels.dongxiao.view.Dongxiao_TargetCharDongxiaoPlaneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Dongxiao_StartupCommand extends SimpleCommand
   {
      
      public function Dongxiao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Dongxiao_MsgReceivedProxy());
         facade.registerProxy(new Dongxiao_MsgSenderProxy());
         facade.registerMediator(new Dongxiao_MaincharDongxiaoPlaneMediator());
         facade.registerMediator(new Dongxiao_TargetCharDongxiaoPlaneMediator());
      }
   }
}

