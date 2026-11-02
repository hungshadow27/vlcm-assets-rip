package com.tgame.moudels.niaoxiangzhen.controller
{
   import com.tgame.moudels.niaoxiangzhen.model.NiaoXiangZhen_MsgReceivedProxy;
   import com.tgame.moudels.niaoxiangzhen.model.NiaoXiangZhen_MsgSenderProxy;
   import com.tgame.moudels.niaoxiangzhen.view.NiaoXiangZhen_Mediator;
   import com.tgame.moudels.niaoxiangzhen.view.NiaoXiangZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class NiaoXiangZhen_StartupCommand extends SimpleCommand
   {
      
      public function NiaoXiangZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new NiaoXiangZhen_MsgSenderProxy());
         facade.registerProxy(new NiaoXiangZhen_MsgReceivedProxy());
         facade.registerMediator(new NiaoXiangZhen_Mediator());
         facade.registerMediator(new NiaoXiangZhen_TargetPanelMediator());
      }
   }
}

