package com.tgame.moudels.xiangyangzhizhan.controller
{
   import com.tgame.moudels.xiangyangzhizhan.model.XiangYangZhiZhan_MsgReceivedProxy;
   import com.tgame.moudels.xiangyangzhizhan.model.XiangYangZhiZhan_MsgSenderProxy;
   import com.tgame.moudels.xiangyangzhizhan.view.XiangYangZhiZhan_Mediator;
   import com.tgame.moudels.xiangyangzhizhan.view.XiangYangZhiZhan_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XiangYangZhiZhan_StartupCommand extends SimpleCommand
   {
      
      public function XiangYangZhiZhan_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XiangYangZhiZhan_MsgReceivedProxy());
         facade.registerProxy(new XiangYangZhiZhan_MsgSenderProxy());
         facade.registerMediator(new XiangYangZhiZhan_Mediator());
         facade.registerMediator(new XiangYangZhiZhan_TargetPanelMediator());
      }
   }
}

