package com.tgame.moudels.xiuwei.controller
{
   import com.tgame.moudels.xiuwei.model.XiuWei_MsgReceivedProxy;
   import com.tgame.moudels.xiuwei.model.XiuWei_MsgSenderProxy;
   import com.tgame.moudels.xiuwei.view.XiuWei_PlaneMediator;
   import com.tgame.moudels.xiuwei.view.XiuWei_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XiuWei_StartupCommand extends SimpleCommand
   {
      
      public function XiuWei_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XiuWei_MsgReceivedProxy());
         facade.registerProxy(new XiuWei_MsgSenderProxy());
         facade.registerMediator(new XiuWei_PlaneMediator());
         facade.registerMediator(new XiuWei_TargetPanelMediator());
      }
   }
}

