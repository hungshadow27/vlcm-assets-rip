package com.tgame.moudels.jiuquhuanghezhen.controller
{
   import com.tgame.moudels.jiuquhuanghezhen.model.JiuQuHuangHeZhen_MsgReceivedProxy;
   import com.tgame.moudels.jiuquhuanghezhen.model.JiuQuHuangHeZhen_MsgSenderProxy;
   import com.tgame.moudels.jiuquhuanghezhen.view.JiuQuHuangHeZhen_Mediator;
   import com.tgame.moudels.jiuquhuanghezhen.view.JiuQuHuangHeZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class JiuQuHuangHeZhen_StartupCommand extends SimpleCommand
   {
      
      public function JiuQuHuangHeZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new JiuQuHuangHeZhen_MsgReceivedProxy());
         facade.registerProxy(new JiuQuHuangHeZhen_MsgSenderProxy());
         facade.registerMediator(new JiuQuHuangHeZhen_Mediator());
         facade.registerMediator(new JiuQuHuangHeZhen_TargetPanelMediator());
      }
   }
}

